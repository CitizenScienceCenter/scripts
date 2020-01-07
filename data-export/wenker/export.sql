CREATE TEMP VIEW w1 AS
  select u.id, u.username, s.task_id, s.info, s.content->>'responses' as response, jsonb_array_elements(s.content->'responses')->>0 from users u, submissions s;

\COPY (SELECT * FROM w1) TO './wenker_data.csv' WITH CSV DELIMITER ',' HEADER

DROP VIEW w1;
