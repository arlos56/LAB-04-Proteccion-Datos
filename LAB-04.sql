SELECT version();
SHOW port;
SHOW listen_addresses;
SHOW ssl;
SHOW password_encryption;

SELECT pid, usename, datname, client_addr, client_port, application_name 
FROM pg_stat_activity;

SHOW config_file;
SHOW hba_file;
SHOW ident_file;
SHOW data_directory;
SHOW log_directory;
SHOW log_connections;
SHOW log_disconnections;

SHOW listen_addresses;
SELECT type, database, user_name, address, auth_method 
FROM pg_hba_file_rules;

SHOW password_encryption;

SELECT rolname, rolsuper, rolinherit, rolcreaterole, rolcreatedb, rolcanlogin 
FROM pg_roles 
ORDER BY rolname;

SELECT extname, extversion 
FROM pg_extension 
ORDER BY extname;

SHOW max_connections;
SHOW superuser_reserved_connections;
SHOW statement_timeout;
SHOW idle_in_transaction_session_timeout;

SELECT 
    s.pid, 
    a.usename, 
    a.client_addr, 
    s.ssl, 
    s.version, 
    s.cipher
FROM pg_stat_ssl s
JOIN pg_stat_activity a ON s.pid = a.pid
WHERE s.pid = pg_backend_pid();