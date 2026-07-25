SELECT users.username from users
join messages on users.id = messages.to_user_id
GROUP BY users.username, messages.to_user_id
ORDER BY COUNT(*) DESC
LIMIT 1;

---

-- SELECT username from users WHERE id = (
--     SELECT to_user_id from messages
-- GROUP BY to_user_id
-- ORDER BY COUNT(*) DESC
-- LIMIT 1);
