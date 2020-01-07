CREATE TEMP VIEW h1 AS
  select  subs.task_id "Task ID", t.content "Task Content", t.info "Task Info", subs.user_id "User ID", u.username "Username", u.email "Email", subs.created_at "Created", jsonb_array_elements(subs.content#>'{selections}')  "Selections"  from submissions subs left join users u on subs.user_id = u.id left join tasks t on subs.task_id = t.id where t.activity_id = '312eb927-7191-4609-96f2-7b194cd44126';

\COPY (SELECT * FROM h1) TO './hate_data.csv' WITH CSV DELIMITER ',' HEADER

DROP VIEW h1;
