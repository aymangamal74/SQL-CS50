CREATE TABLE IF NOT EXISTS "temp" (
    "name"      TEXT,
    "id"        INTEGER PRIMARY KEY,
    "nametype"  TEXT,
    "class"     TEXT,
    "mass"      NUMERIC,
    "discovery" TEXT,
    "year"      INTEGER,
    "lat"       NUMERIC,
    "long"      NUMERIC
);

.import --csv --skip 1 meteorites.csv temp

-- replacing empty with NULL

UPDATE "temp" SET "mass" = NULL WHERE "mass" = "";
UPDATE "temp" SET "year" = NULL WHERE "year" = "";
UPDATE "temp" SET "lat" = NULL WHERE "lat" = "";
UPDATE "temp" SET "long"  = NULL WHERE "long" = "";

-- rounded values

UPDATE "temp" SET "mass" = round("mass",2);
UPDATE "temp" SET "long" = round("long",2);
UPDATE "temp" SET "lat" = round("lat",2);

-- delete the specific value 'Relict' from nametype column

DELETE FROM "temp" WHERE "nametype" = 'Relict';

-- create the final table
CREATE TABLE IF NOT EXISTS "meteorites" (
    "id"        INTEGER PRIMARY KEY,
    "name"      TEXT,
    "class"     TEXT,
    "mass"      NUMERIC,
    "discovery" TEXT,
    "year"      INTEGER,
    "lat"       NUMERIC,
    "long"      NUMERIC
);

-- transfer final shape to the new table

INSERT INTO "meteorites" ("name","class","mass","discovery","year","lat","long")
SELECT "name" , "class" , "mass" ,"discovery" , "year" , "lat" , "long"
FROM "temp" ORDER BY "year" , "name";

--drop the old table

DROP TABLE "temp";
