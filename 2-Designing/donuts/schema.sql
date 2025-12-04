CREATE TABLE "ingredients"(
    "id"    INTEGER PRIMARY KEY,
    "name"  INTEGER,
    "price" NUMERIC
);

CREATE TABLE "donuts"(
    "id"                INTEGER PRIMARY KEY,
    "name"              TEXT,
    "ingredients_id"    INTEGER,
    "gluten-free"       TEXT CHECK("gluten-free" IN ("yes","not")),
    "cost"              NUMERIC,
    Foreign Key ("ingredients") REFERENCES "ingredients" ("id")
);

CREATE TABLE "orders"(
    "id"            INTEGER PRIMARY KEY,
    "order_number"  VARCHAR,
    "customer_id"   INTEGER,
    Foreign Key ("customer_id") REFERENCES "customer" ("id")
);

CREATE TABLE "customer"(
    "id"    INTEGER PRIMARY KEY,
    "fname" TEXT,
    "lname" TEXT,    
);

CREATE TABLE "donuts_orders"(
    "id" INTEGER PRIMARY KEY,
    "customer_id" INTEGER,
    "order_id" INTEGER,
    Foreign Key ("order_id") REFERENCES "orders" ("id"),
    Foreign Key ("customer_id") REFERENCES "customer" ("id")
);

CREATE Table "cust_history"(
    "customer_id" INTEGER,
    "order_id" INTEGER,
    PRIMARY KEY("customer_id", "order_id"),
    Foreign Key ("customer_id") REFERENCES "customer" ("id"),
    Foreign Key ("order_id") REFERENCES "orders" ("id")
);