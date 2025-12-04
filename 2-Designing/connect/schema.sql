CREATE TABLE "users"(
    "id" SERIAL     PRIMARY KEY,
    "first_name"    TEXT,
    "last_name"     TEXT,
    "username"      TEXT UNIQUE,
    "password"      VARCHAR(100) 
);

CREATE TABLE "schools"(
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" NUMERIC,
    "foundation_year" NUMERIC
);

CREATE TABLE "companies"(
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" NUMERIC,
);

CREATE TABLE "con_people"(
    "1stuser_id" INTEGER,
    "2nduser_id" INTEGER,
    PRIMARY KEY("1stuser_id","2nduser_id")
);

CREATE TABLE "con_school"(
    "user_id"       INTEGER,
    "school_id"     INTEGER,
    "school_name"   TEXT,
    "start_aff"     NUMERIC,
    "end_aff"       NUMERIC,
    "degree"        TEXT,
    "status"        TEXT CHECK ("status" IN ("pursed","earned")),
    "type"          TEXT CHECK ("type" IN ("BA","MA","PhD")),
    Foreign Key ("user_id") REFERENCES "users" ("id"),
    Foreign Key ("school_id") REFERENCES "schools" ("id")

);

CREATE TABLE "con_companies"(
    "user_id" INTEGER,
    "company_id" INTEGER,
    "name" TEXT NOT NULL,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "job_title" TEXT,
    Foreign Key ("user_id") REFERENCES "users" ("id"),
    Foreign Key ("company_id") REFERENCES "company" ("id")
);