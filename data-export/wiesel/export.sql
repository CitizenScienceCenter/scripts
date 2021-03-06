CREATE TEMP VIEW w1 AS
    select
    s.content->'animal' as animal,
    s.content->'category' as category,
    u.username,
    u.email,
    s.created_at,
    string_agg(path, ',') as paths
    from media m, tasks t
    left join submissions s on s.task_id = t.id
    left join users u on u.id = s.user_id
    where t.activity_id = '09a565c4-73f8-483d-b59a-c3e5791f9a16' and m.source_id = t.id
    group by u.id, s.content, s.created_at
    order by s.created_at DESC;

\COPY (SELECT * FROM w1) TO './wiesel_data.csv' WITH CSV DELIMITER ',' HEADER

DROP VIEW w1;
