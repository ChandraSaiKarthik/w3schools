MERGE INTO public.shippers AS T
USING (
        VALUES
             (1,'Speedy Express','(503) 555-9831')
            ,(2,'United Package','(503) 555-3199')
            ,(3,'Federal Shipping','(503) 555-9931')
      ) AS S (shipper_id, shipper_name, phone)
    ON T.shipper_id = S.shipper_id
WHEN MATCHED AND (T.shipper_name IS DISTINCT FROM S.shipper_name) OR (T.phone IS DISTINCT FROM S.phone)
    THEN UPDATE SET shipper_name = S.shipper_name, phone = S.phone
WHEN NOT MATCHED
    THEN INSERT (shipper_id, shipper_name, phone)
         OVERRIDING SYSTEM VALUE
         VALUES (S.shipper_id, S.shipper_name, S.phone)
;
SELECT setval('public.shippers_shipper_id_seq', (SELECT MAX(shipper_id) FROM public.shippers));