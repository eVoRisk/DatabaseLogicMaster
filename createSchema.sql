-- Create Schema Oracle
CREATE USER homework IDENTIFIED BY homework
DEFAULT TABLESPACE USERS 	-- the place where Oracle store data logically
TEMPORARY TABLESPACE TEMP
/

-- Grant access
GRANT CONNECT, RESOURCE TO homework
/
GRANT CREATE VIEW TO homework
/
ALTER USER homework QUOTA UNLIMITED ON USERS
/