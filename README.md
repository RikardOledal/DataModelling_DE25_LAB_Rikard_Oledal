# DataModelling_DE25_LAB_Rikard_Oledal
Lab in the Data Modelling-course at STI


docker compose up -d

docker exec -it yrkesco bash


psql -U postgres -d yrkco_db -f 01_DDL.sql

psql -U postgres -d yrkco_db -f 02_fakedata.sql

psql -U postgres -d yrkco_db -f 03_querry_check



