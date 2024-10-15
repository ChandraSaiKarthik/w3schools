CREATE TABLE if not exists orders_new
    (
        order_id    INT,
        customer_id INT,
        order_date  DATE,
        PRIMARY KEY ( order_id, customer_id )
     )
;

CREATE TABLE if not exists order_details_new
    (
        order_id    INT,
        customer_id INT,
        product_id  INT,
        quantity    INT,
        price       NUMERIC,
        PRIMARY KEY ( order_id, customer_id, product_id ),
        FOREIGN KEY ( order_id, customer_id ) REFERENCES orders_new ( order_id, customer_id )
     )
;