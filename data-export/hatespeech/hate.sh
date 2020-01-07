#!/bin/sh
source ../../envs/v2.env
PGPASSWORD="$PGPASSWORD" psql -h $PG_HOST -d $PG_DB -h $PG_HOST -U $PG_USER < export.sql
