CREATE TEMP VIEW w1 AS
	select submissions.created_at, u.username, u.email, STRING_AGG(item->>'text', ', ') as responses, t.id as TaskID, t.content->'question'->'text' as Question, a.name from submissions left join users u on submissions.user_id = u.id left join tasks t on submissions.task_id = t.id left join activities a on t.activity_id = a.id, jsonb_array_elements(submissions.content #> '{responses}' ) as item group by submissions.created_at, t.id, u.username, u.email, submissions.created_at, t.content->'question'->'text', a.name order by submissions.created_at DESC;

\COPY (SELECT * FROM w1) TO './wenker_data.csv' WITH CSV DELIMITER ',' HEADER

DROP VIEW w1;
