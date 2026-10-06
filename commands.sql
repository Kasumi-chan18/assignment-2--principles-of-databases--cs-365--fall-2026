-- Author: Moyosoreoluwa Akinsulere
-- Date: 03-10-2026 (Oct. 3, 2026)

-- commands.sql
-- This file contains the 7 required SQL operations for the assignment.

USE passwords;

-- 1) Create a new account into the database (assumes the 10 initial entries already present).
--    Adds a new record (an 11th entry).
INSERT INTO passwords (site_name, url, first_name, last_name, username, email, password, comment)
VALUES ('Crunchyroll', 'https://crunchyroll.com', 'Jordan', 'Lee', 'jordan.l', 'jordan.lee@gmail.com', AES_ENCRYPT('SpeCter$9m', 'dbkey25!'), 'Added as the new entry (new account)');

-- 2) Get the password associated with the URL of one of the ten entries.
--    Retrieves password for 'https://hartford.edu' (Deborah's entry).
SELECT id, site_name, url, username, email,
       CONVERT(AES_DECRYPT(password, 'dbkey25!') USING utf8mb4) AS decrypted_password
FROM passwords
WHERE url = 'https://hartford.edu';

-- 3) Get all the password-related data, including the decrypted password, for entries with 'https' URLs.
--    Returns rows where the url starts with 'https' (two+ entries).
SELECT id, site_name, url, first_name, last_name, username, email, comment, created_at,
       CONVERT(AES_DECRYPT(password, 'dbkey25!') USING utf8mb4) AS decrypted_password
FROM passwords
WHERE url LIKE 'https://%';

-- 4) Change a URL associated with one of the passwords in your ten entries.
--    Changes Amazon's URL from 'http://amazon.com' to 'https://amazon.com' (upgrade to HTTPS).
UPDATE passwords
SET url = 'https://amazon.com'
WHERE url = 'http://amazon.com';

-- Verify the change:
SELECT id, site_name, url FROM passwords WHERE site_name = 'Amazon';

-- 5) Change the password to any entry.
--    Changes the password for GitHub entry to 'GH_nekoMata_%)'.
UPDATE passwords
SET password = AES_ENCRYPT('GH_nekoMata_%)', 'dbkey25!')
WHERE site_name = 'GitHub';

-- Verify decryption:
SELECT id, site_name, CONVERT(AES_DECRYPT(password, 'dbkey25!') USING utf8mb4) AS decrypted_password
FROM passwords
WHERE site_name = 'GitHub';

-- 6) Remove a tuple based on a URL.
--    Deletes the Medium entry by URL 'http://medium.com'.
DELETE FROM passwords
WHERE url = 'http://medium.com';

-- Verify removal:
SELECT COUNT(*) AS cnt_medium FROM passwords WHERE url = 'http://medium.com';

-- 7) Remove a tuple based on a password.
--    Since the password is stored encrypted, delete by matching AES_ENCRYPT of the plaintext.
--    Delete the Reddit account whose plaintext was 'RedDitR0cks'
DELETE FROM passwords
WHERE password = AES_ENCRYPT('RedDitR0cks', 'dbkey25!');

-- Verify removal:
SELECT id, site_name, url FROM passwords WHERE site_name = 'Reddit';

-- Shows all remaining entries with decrypted passwords.
SELECT id, site_name, url, first_name, last_name, username, email, comment, created_at,
       CONVERT(AES_DECRYPT(password, 'dbkey25!') USING utf8mb4) AS decrypted_password
FROM passwords
ORDER BY id;