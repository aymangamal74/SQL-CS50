
-- *** The Lost Letter ***
select id from "addresses" where "address" = '900 Somerville Avenue';
select id from packages where("from_address_id" = 432 and contents = 'Congratulatory letter');
select action from scans where ("package_id" = 384 and "address_id" = 432);

-- *** The Devious Delivery ***
select type from addresses where id = (
       select address_id from scans where (
         package_id = ( select id from packages where from_address_id is NULL)
           and action = 'Drop'));
select contents from packages where from_address_id is NULL;

-- *** The Forgotten Gift ***
select contents from packages where from_address_id =( select id from addresses where address = '109 Tileston Street');
select name from drivers where id = (select driver_id FROM scans WHERE package_id = 9523 ORDER BY timestamp DESC LIMIT 1);
