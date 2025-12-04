CREATE TABLE "passengers"(
    "fname" TEXT NOT NULL ,
    "lname" TEXT NOT NULL,
    "age" NUMERIC NOT NULL,
);
CREATE TABLE "airlines"(
    "id" INTEGER,
    PRIMARY KEY("id"),
    "name" TEXT NOT NULL,
    "section" TEXT NOT NULL 
);

CREATE TABLE "check_ins"(
    "date_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    "flight_id" INTEGER ,
    Foreign Key ("flight_id") REFERENCES "flights" ("id")

);

CREATE TABLE "flights"(
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL ,
    "departing_airport" TEXT NOT NULL,
    "arriving_airport" TEXT NOT NULL,
    "deptime" NUMERIC NOT NULL,
    "arvtime" NUMERIC NOT NULL ,
    "date" NUMERIC,
    Foreign Key ("id") REFERENCES "airlines"("id")

);