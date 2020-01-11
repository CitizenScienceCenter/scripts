CREATE TEMP VIEW w1 AS
	select submissions.created_at, u.username, u.email, submissions.content, t.id as TaskID, t.content->'question'->'text' as Question, a.name from submissions left join users u on submissions.user_id = u.id left join tasks t on submissions.task_id = t.id left join activities a on t.activity_id = a.id order by submissions.created_at DESC;

\COPY (SELECT * FROM w1) TO './wenker_data.csv' WITH CSV DELIMITER ',' HEADER

DROP VIEW w1;
