# Lab - Data Modelling

Uppgiften 

I would answer questions from The Manager and insert these into a Manager report in an ipynb file. Then I would also create a Dashboard in Evidence. For more information about the task follow the link below.

[Lab_instruktioner (PDF)](./img/lab_yrkesco.pdf)
[Relationship statements](./yh_labb/models/statments.md)

.\yh_labb\models\statments.md
## Video

<a href="https://www.youtube.com/watch?v=sb5SrouAKeg">
  <img src="./img/Thumbnail.png" alt="Video presentation" width="600">
</a>


## Installation
1. Klona repro
    ```bash
    git clone https://github.com/RikardOledal/DataModelling_DE25_LAB_Rikard_Oledal.git
    ```

2. Starta en Container
    ```bash
    docker compose up -d
    ```

3. Starta Bash i containern
    ```bash
    docker exec -it yrkesco bash
    ```

4. Skapa databasen
    ```bash
    psql -U postgres -d yrkco_db -f 01_DDL.sql
    ```

5. Skapa fakedata
    ```bash
    psql -U postgres -d yrkco_db -f 02_fakedata.sql
    ```

6. Checka att datan har kommit in
    ```bash
    psql -U postgres -d yrkco_db -f 03_querry_check.sql
    ```

7. Gå in i databasen på Containern
    ```bash
    psql -U postgres -d yrkco_db
    ```

## Sakila DB
Sakila is a database with data about films, how many of each film there are (inventory), how much these have been rented and how much has been paid for this. There is also information about customers who rent and staff who work there.

<img src="./img/Sakila_staging.png" alt="ERD-Chart Staging" width="600">


## Sakila refined
I discovered that there would be many joins in each query if I were to use the structure that was in schema staging, so I created a refined schema with these tables.

<img src="./img/Sakila_refined.png" alt="ERD-Chart Refined" width="600">


## Data Loading Tool (DLT)
My DLT checks if there is already a DuckDB database in the data folder. If there is, DLT will not create the database. Then the DLT will run refined.sql were my refined schema and tables are added. All tables are idempotent so they will not replace if the tables already exist.
After this, DLT will copy the database to evidence. This allows you to add data to the database manually which will then end up in Evidence.

<img src="./img/Pipeline.png" alt="Pipeline" width="600">


## Evidence
I used the data from the manager report to design the dashboard in Evidence. But in Evidence I made the objects more selectable. For example, I didn't just bring up all the titles with LOVE in them, I made a movie search where you could search for any word you wanted.

## Help
I have coded everything myself, but I have a study group with Anja Scherwall and Felix Kjellberg. I have discussed a lot with them when needed. We have also helped each other with tips and logic.
I used ChatGPT and Google Gemini in troubleshooting when I didn't see the error myself. When I made the dashboard in Evidence, I looked a lot at [Evidence Docs][2].

[1]: https://www.kaggle.com/datasets/atanaskanev/sqlite-sakila-sample-database
[2]: https://docs.evidence.dev/

