-- NOTE:
-- This is a sanitized sample query.
-- Table names, column names, and values have been modified
-- to remove any sensitive or client-specific information.

SELECT request_number,
       request_type,
       created_at,
       customer_id,
       customer_category,
       derived_name_from_request,
       current_customer_name,
       status_code
FROM (
    SELECT sr.request_id AS request_number,
           rt.type_name AS request_type,
           sr.created_at,
           sr.client_id AS customer_id,
           c.customer_type AS customer_category,
           
           CASE 
               WHEN sr.flag_indicator = 'X' THEN 
                    TRIM(sr.attribute_value_1)
               ELSE 
                    TRIM(sr.attribute_value_2 || ' ' ||
                         sr.attribute_value_3 || ' ' ||
                         sr.attribute_value_4)
           END AS derived_name_from_request,
           
           c.customer_name AS current_customer_name,
           sr.status_code,
           
           ROW_NUMBER() OVER (
               PARTITION BY sr.client_id
               ORDER BY sr.created_at DESC, sr.internal_id DESC
           ) AS row_rank

    FROM service_requests sr
    JOIN request_types rt
      ON sr.request_type_id = rt.request_type_id
    JOIN customers c
      ON c.customer_id = sr.client_id

    WHERE rt.type_name = :request_type_param
      AND sr.created_at >= :start_date
      AND sr.created_at < :end_date
      AND sr.status_code = :status_param
      
      AND NVL(TRIM(UPPER(c.customer_name)), 'X') <>
          NVL(TRIM(UPPER(
              CASE 
                  WHEN sr.flag_indicator = 'X' THEN sr.attribute_value_1
                  ELSE sr.attribute_value_2 || ' ' ||
                       sr.attribute_value_3 || ' ' ||
                       sr.attribute_value_4
              END
          )), 'X')
)
WHERE row_rank = 1
ORDER BY created_at DESC;
