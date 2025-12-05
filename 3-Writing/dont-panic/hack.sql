UPDATE users SET password = '982c0381c279d139fd221fce974916e7'
WHERE username = 'admin';

DELETE FROM "user_logs" where type = 'update' AND "new_username" = 'admin';

INSERT INTO "user_logs" ("type","old_username","new_username","new_password")
VALUES ("update","admin","admin",(select password from users where username='emily33'));
