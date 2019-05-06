CREATE DATABASE linux_nmon
CREATE DATABASE linux_nmon_log
CREATE USER ls_nmon_import WITH PASSWORD 'crc2019'
GRANT ALL ON linux_nmon TO ls_nmon_import
GRANT ALL ON linux_nmon_log TO ls_nmon_import
USE linux_nmon
CREATE RETENTION POLICY "90days" ON linux_nmon DURATION 90d REPLICATION 1 DEFAULT
CREATE RETENTION POLICY "90days" ON linux_nmon_log DURATION 90d REPLICATION 1 DEFAULT
CREATE DATABASE njmon
CREATE USER njmon_import WITH PASSWORD 'crc2019'
GRANT ALL ON njmon TO njmon_import
