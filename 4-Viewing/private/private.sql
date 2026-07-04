CREATE TABLE IF NOT EXISTS 'gg' (
'number' INTEGER,
'start' INTEGER,
'length' INTEGER);

INSERT INTO gg ('number', 'start', 'lenght')
VALUES
    (14, 98, 4),
    (114, 3, 5),
    (618, 72, 9),
    (630, 7, 3),
    (932, 12, 5),
    (2230, 50, 7),
    (2346, 44, 10),
    (3041, 14, 5);

CREATE VIEW 'message' AS
SELECT substr(sentences.sentence, gg.start, gg.length) AS 'phrase'
FROM sentences
JOIN gg ON gg."number" = sentences."id";

