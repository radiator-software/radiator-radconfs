-- Example SQL file to create internal users database with TOTP support
--
-- Create database with command:
--
-- sqlite3 /var/lib/radiator/db/users-internal/users-internal-totp.sqlite < sqlite_users_internal_totp.sql
--
BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS "users" (
    "id"                      INTEGER PRIMARY KEY AUTOINCREMENT,
    "username"                TEXT NOT NULL UNIQUE,
    "password"                TEXT NOT NULL,
    "totp_enabled"            INTEGER NOT NULL DEFAULT 0,
    "totp_seed"               TEXT,
    "totp_last_timestep"      INTEGER DEFAULT NULL,
    "description"             TEXT,
    "status"                  TEXT
);

-- Insert sample users with TOTP seeds matching the jsonfile example
INSERT INTO users (username, password, totp_enabled, totp_seed, description, status)
VALUES('mikem', 'fred', 1, '0000000000000000000000000000000000000000', 'Test user with all zeros seed', 'active');

INSERT INTO users (username, password, totp_enabled, totp_seed, description, status)
VALUES('batman', 'TheHeroGothamDeserves', 1, 'A0B1C2D3E4F5A6B7C8D9E0F1A2B3C4D5E6F7A8B9', 'The Hero Gotham Deserves', 'active');

INSERT INTO users (username, password, totp_enabled, totp_seed, description, status)
VALUES('alfred', 'TheButlerDidIt', 1, 'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB', 'The Butler', 'active');

INSERT INTO users (username, password, totp_enabled, totp_seed, description, status)
VALUES('robin', 'HolyPasswordBatman', 1, '8806804dd18806804dd18806804dd18806804dd1', 'Boy Wonder', 'active');

COMMIT;
