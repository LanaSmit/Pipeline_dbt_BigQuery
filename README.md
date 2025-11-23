# Pipeline_dbt_BigQuery

This project demonstrates a complete ELT pipeline using dbt (Data Build Tool) and Google BigQuery. The purpose of the pipeline is to show how raw data is loaded into BigQuery, transformed into clean analytical models using dbt, and validated using automated tests.

### Extract

Raw data comes from CSV files (seeds), starter data from the dbt tutorial, or external sources.

### Load

The raw data gets loaded into Google BigQuery.
This creates the raw tables you see in BigQuery.

### Transform (dbt)

dbt transforms raw tables into clean, analytics-ready models using SQL files you write.

## Pipeline Architecture

### 1. Extract & Load

Raw datasets are loaded directly into Google BigQuery as the first step.  
This includes:

- Seed files (e.g., stadium_cleaned.csv) ingested using dbt seed
- Starter datasets created automatically during course setup
- Customers dataset loaded into the dbt_crash_course dataset

### 2. Transform with dbt

dbt is used to transform raw tables into clean, analysis-ready models.  
Transformations include:

- Creating SQL models such as customers.sql
- Applying materializations (e.g., table)
- Renaming and cleaning columns
- Structuring data for easier analysis
- Organizing models under the models/ directory

dbt ensures all transformations are modular, reproducible, and version-controlled.

### 3. Testing

Automated quality checks are applied using dbt:

- unique tests  
- not_null tests  
- Schema-level validation using schema.yml

This ensures the transformed tables meet data quality expectations before being used downstream.

### 4. Documentation

dbt automatically generates interactive documentation using:

```bash
dbt docs generate
dbt docs serve
```

# Setup Instructions:

1. In the terminal, navigate to the correct folder:
    cd dbt-crash-course
    Then install BigQuery:
    ```bash
    pip install dbt-bigquery
    ```
    In the terminal:
    ```bash
    dbt --version
    ```
    In the terminal:
    ```bash
    dbt init dbt_crash_course
    ```
    Then answer the following questions in the terminal:
    
    bigquery
    ```bash
    1
    ```
    service account
    ```bash
    2
    ```
    keyfile
    ```bash
    yourfilepath/.dbt/dbt-crash-course.json
    ```
    project
    ```bash
    dbt-crash-course-10101
    ```
    dataset
    ```bash
    dbt-crash-course
    ```
    threads
    ```bash
    1
    ```
    job_execution_timeout_seconds [300]
    enter
    Desired location: US
    ```bash
    1
    ```


2. Open a new tab in your browser and go to:
    ```bash
    console.cloud.google.com/bigquery
    ```
    On the page: click Add new project, give the project the name dbt-crash-course, and click Create.
    Select the new project. You will see the project ID on the left as dbt-crash-course-yourcode. Copy this value.
    
    In VS Code, open your .dbt folder and the profiles.yml file.
    Change the project parameter to: dbt-crash-course-yourcode
    (Your code will be different from mine.)
    
    In the Cloud Console: click the hamburger menu (top-left) → IAM & Admin → Service Accounts.
    Create a new service account:
    
      - Type your name
      
      - Click Create and Continue
      
      - Select Role: Owner
      
      - Click Continue → Done
      
      Then select the service account you just created → Keys → Add Key → Create new key → choose JSON → Create.
    
    A .json file will download. Paste this file into your VS Code .dbt folder (where your profiles.yml is).
    Rename the file to: dbt-crash-course.json
    
    Copy the full file path and paste it into profiles.yml as the keyfile parameter.
    
    In profiles.yml change the dataset parameter to:
    dbt_crash_course
    (Replace the - with _.)
    
    In VS Code, go to the folder:
    dbt-crash-course/dbt_crash_course/dbt_project.yml
    
    At the +materialized: parameter, change view to table.

    Save the file, then in the terminal run:
    ```bash
    dbt run
    ```

3. In the Cloud Console, refresh the page. Under dbt_crash_course, you will see the two tables created.

    In the Cloud Console, click Add → Star a project, and name it dbt-tutorial. Explore its sub-files.
    
    In VS Code, under the models folder, add the customers.sql file (you can download it from my GitHub).
    
    In dbt_project.yml, update the file code so it matches the version on my GitHub.
    Then in the terminal run:
    ```bash
    dbt run
    ```
    
    In the Cloud Console, refresh and preview the data in the customers table under dbt_crash_course → Preview.
    
    From my GitHub, download stadium_cleaned.csv and paste it into your seeds folder in VS Code.
    In the terminal:
    ```bash
    dbt seed
    ```
    
    Refresh the Console page and preview the stadium_cleaned table under dbt_crash_course.
    
    From my GitHub, download the schema.yml file under models (not the one in the example folder). Add it directly into your models folder.
    
    In the terminal:
    ```bash
    dbt test
    dbt run
    dbt docs generate
    dbt docs serve
    ```
    A popup will open showing the dbt documentation website where you can explore your models and lineage.
   

4. You have your own Google Cloud + dbt setup. If you wan to runit in  the future you can just run these 2 command in the terminal:
    ```bash
    dbt run
    dbt test
    ```
