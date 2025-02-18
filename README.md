# dbt-dremio golden project example

The golden example of dbt project with Dremio as a database.

To run this project you need to have only Docker installed on your machine.

Then run docker compose up in the root directory of this project.

```docker compose up -d```

DBT project will live inside dbt container and Dremio will be available on localhost:9047.

How to connect to dbt container:

```docker exec -it dbt /bin/bash```

The only needed dbt command to run this project is:

```dbt build```
