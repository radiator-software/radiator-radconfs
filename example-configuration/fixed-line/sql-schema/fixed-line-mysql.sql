/* fixed-line-mysql.sql */

/* Initialise a simple SQL database for use with fixed line, such as
   FTTH and xDSL, authentication. The table definition can be
   customised to match Radiator configuration.
*/

/* This file works with MySQL and MariaDB.
   You can create this database with these commands:
     mysql -uroot -prootpw
     create database fixedline;
     create user 'radiator'@'localhost' identified by 'password';
     grant all privileges on fixedline.* to 'radiator'@'localhost';
     exit

   Then create and intialise the tables with this command:
     mysql -Dfixedline -uradiator -ppassword < fixed-line-mysql.sql
*/

use fixedline;

/* Wipe any old versions */
DROP TABLE IF EXISTS users;

/* The exact names of the columns and this table can be changed with
   Radiator config file, but the values given here match the defaults.
*/
CREATE TABLE IF NOT EXISTS users (
        /* User id is also returned with Access-Accept */
        sub_id         VARCHAR(253) NOT NULL PRIMARY KEY,
        sub_password   VARCHAR(300),

	/* Check attributes from Access-Request */
        nas            VARCHAR(253),    /* NAS-Identifier */
        agent_circuit  VARCHAR(253),    /* DSLForum-Agent-Circuit-Id */
        agent_remote   VARCHAR(253),    /* DSLForum-Agent-Remote-Id */

	/* Reply attributes for Access-Accept */
	sub_sla        VARCHAR(253),    /* Alc-SLA-Prof-Str */
	sub_prof       VARCHAR(253)     /* Alc-Subsc-Prof-Str */
);
/* Index should be automatically created on sub_id because of PRIMARY KEY */

/* Sample user record

INSERT INTO users
       (sub_id, sub_password, nas, agent_circuit, agent_remote, sub_sla, sub_prof)
       VALUES
       ('alc-test-user1', 'alcpw', 'ALC-BNG', 'NYC020_NOK_OLT02_FX eth 1/2/23/05/27/3/2', 'FTTH123456-John_Doe', '10/100', '20/200');

*/
