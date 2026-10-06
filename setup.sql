-- Author: Moyosoreoluwa Akinsulere
-- Date: 03-10-2026 (Oct. 3, 2026)

-- setup.sql

DROP DATABASE IF EXISTS passwords;
CREATE DATABASE passwords CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE passwords;

-- Table: passwords
-- Stores website credentials with encrypted passwords using AES_ENCRYPT.
CREATE TABLE passwords (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    site_name VARCHAR(200) NOT NULL,
    url VARCHAR(512) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    username VARCHAR(200),
    email VARCHAR(255),
    password VARBINARY(512) NOT NULL, -- AES_ENCRYPT returns binary
    comment TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Insert 10 initial entries (at least two with https)
-- Encryption key used below: dbkey25!

INSERT INTO passwords (site_name, url, first_name, last_name, username, email, password, comment)
VALUES
('University of Hartford', 'https://hartford.edu', 'Deborah', 'Akinsulere', 'deborah.ak', 'akinsuler@hartford.edu', AES_ENCRYPT('HaVoce%R', 'dbkey25!'), 'University portal account.'),

('Google Mail', 'https://mail.google.com', 'Alex', 'Johnson', 'alex.j', 'alex.johnson@gmail.com', AES_ENCRYPT('fE4Tt%8', 'dbkey25!'), 'Primary email.'),

('GitHub', 'https://github.com', 'Sofia', 'Martinez', 'sofiam', 'sofia.m@gmail.com', AES_ENCRYPT('GH_token_29', 'dbkey25!'), 'Code hosting.'),

('Amazon', 'http://amazon.com', 'Liam', 'Nguyen', 'liam.n', 'liam.nguyen@gmail.com', AES_ENCRYPT('oNLINeSHop!9', 'dbkey25!'), 'Shopping account.'),

('StackOverflow', 'https://stackoverflow.com', 'Zoe', 'Chen', 'zoe.chen', 'zoe.chen@yahoo.com', AES_ENCRYPT('JeNgA_flo3!', 'dbkey25!'), 'Dev Q&A.'),

('Reddit', 'http://reddit.com', 'Noah', 'Patel', 'noah.p', 'noah.patel@gmail.com', AES_ENCRYPT('RedDitR0cks', 'dbkey25!'), 'Community forums.'),

('LinkedIn', 'https://linkedin.com', 'Maya', 'Singh', 'maya.s', 'maya.singh@outlook.com', AES_ENCRYPT('BizNet2039', 'dbkey25!'), 'Professional profile.'),

('X', 'http://x.com', 'Ethan', 'Brown', 'ethan.b', 'ethan.brown@gmail.com', AES_ENCRYPT('TweetNSecure6', 'dbkey25!'), 'Quote Tweet.'),

('Bank of America', 'https://bankofamerica.com', 'Olivia', 'Garcia', 'olivia.g', 'olivia.garcia@gmail.com', AES_ENCRYPT('Safe!Bank$1', 'dbkey25!'), 'Online banking.'),

('Medium', 'http://medium.com', 'Lucas', 'Davis', 'lucas.d', 'lucas.davis@gmail.com', AES_ENCRYPT('Write@More!', 'dbkey25!'), 'Blogging.');