/* ldap-auth-radsec-proxy-postgresql.sql */

/* Initialise a simple SQL database for testing purposes.
   The table definition can be customised to match Radiator configuration.
*/

/* This file works with PostgreSQL

   To create and intialise the tables:
     psql -Uuser -dvlan-db -fldap-auth-radsec-proxy-postgresql.sql
*/

/* Wipe any old versions */
DROP TABLE IF EXISTS vlans;

/* The exact names of the columns and this table can be changed with
   Radiator config file, but the values given here match the example configuration.
*/

CREATE TABLE IF NOT EXISTS vlans (
        tunneltype      VARCHAR(253),    /* Tunnel-Type */
        tunnelmedium    VARCHAR(253),    /* Tunnel-Medium-Type */
	tunnelid        VARCHAR(253),    /* Tunnel-Private-Group */
        airgroup        VARCHAR(253),    /* group name for Aruba AirGroup */
	username        VARCHAR(253)
);

/* Sample user record

INSERT INTO vlans
       (tunneltype, tunnelmedium, tunnelid, airgroup, username)
       VALUES
       ('VLAN', 'Ether_802', '909', 'agroup', 'testUser');

*/
