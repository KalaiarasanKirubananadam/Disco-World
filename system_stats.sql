SET VERIFY OFF

COLUMN name FORMAT A50
COLUMN value FORMAT 99999999999999999999

SELECT sn.name, ss.value
FROM   v$sysstat ss,
       v$statname sn
WHERE  ss.statistic# = sn.statistic#
AND    sn.name LIKE '%' || DECODE(LOWER('&1'), 'all', '', LOWER('&1')) || '%';