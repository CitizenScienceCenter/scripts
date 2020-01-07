#!/bin/sh
source ../envs/v3.env

mkdir dumps
rm dumps/*.dump

PGPASSWORD="$PGPASSWORD" pg_dump -d $PG_DB -h $PG_HOST -U $PG_USER -f dumps/$PG_DB_$ENV_$(date +"%Y_%m_%d_%I_%M_%p").dump

mc mirror --overwrite --remove dumps/ c3s/psqlbkp/$ENV

rm dumps/*.dump

