-- Example SQL file to create for offline Yubikey validation
--
-- Create database with command:
--
-- sqlite3 /var/lib/radiator/db/users-internal/yubikey.sqlite < sqlite-yubikey.sql
--
BEGIN TRANSACTION;

CREATE TABLE yubikeys (
    username        TEXT NOT NULL,
    public_uid      TEXT,           -- 12-character modhex, e.g. "vvccccriigjn"
    aes_key         BLOB NOT NULL,  -- 16-byte binary AES-128 key (store as BLOB, not hex string)
    usage_counter   INTEGER NOT NULL DEFAULT 0,
    session_counter INTEGER NOT NULL DEFAULT 0
);

-- Replace the username, public_uid and aes_key with your Yubikey values
-- INSERT INTO yubikeys (username, public_uid, aes_key, usage_counter, session_counter) VALUES ('mikem@example.com','hfhgewuludff',X'9fafa61d1ccafd37a33d7a3703356cd5',0,0);

COMMIT;
