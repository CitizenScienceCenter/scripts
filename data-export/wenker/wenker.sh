#!/bin/sh
source ../../envs/wenker.env

PGPASSWORD="$PGPASSWORD" psql -d $PG_DB -U $PG_USER -h $PG_HOST < export.sql

