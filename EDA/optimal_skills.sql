/*
 Question:
 What are the most optimal skills for each role, balancing both demand and salary?
 - Create a ranking column that combines both demand count and median salary to identify most valuable skills.
 - Remote focus
 */
select sd.skills,
    round(median(jf.salary_year_avg), 0) as median_salary,
    round(ln(count(jf.*)), 1) as log_demand,
    round(
        median(jf.salary_year_avg) * ln(count(jf.*)) / 10000,
        2
    ) as optimal_score,
    from job_postings_fact as jf
    inner join skills_job_dim as sjd on jf.job_id = sjd.job_id
    inner join skills_dim as sd on sjd.skill_id = sd.skill_id
where jf.job_title_short = 'Data Engineer'
    and jf.salary_year_avg is not null
group by sd.skills,
    job_work_from_home
having job_work_from_home = 'true'
    and count(jf.*) > 100
order by optimal_score desc
limit 25;
/*
 ┌────────────┬───────────────┬────────────┬───────────────┐
 │   skills   │ median_salary │ log_demand │ optimal_score │
 │  varchar   │    double     │   double   │    double     │
 ├────────────┼───────────────┼────────────┼───────────────┤
 │ terraform  │      184000.0 │        5.3 │         96.83 │
 │ python     │      135000.0 │        7.0 │         94.94 │
 │ aws        │      137320.0 │        6.7 │          91.5 │
 │ sql        │      130000.0 │        7.0 │         91.37 │
 │ airflow    │      150000.0 │        6.0 │         89.34 │
 │ spark      │      140000.0 │        6.2 │         87.09 │
 │ snowflake  │      135500.0 │        6.1 │         82.41 │
 │ kafka      │      145000.0 │        5.7 │         82.31 │
 │ azure      │      128000.0 │        6.2 │         78.89 │
 │ java       │      135000.0 │        5.7 │         77.14 │
 │ scala      │      137290.0 │        5.5 │         75.64 │
 │ kubernetes │      150500.0 │        5.0 │         75.11 │
 │ git        │      140000.0 │        5.3 │         74.73 │
 │ databricks │      132750.0 │        5.6 │         74.12 │
 │ redshift   │      130000.0 │        5.6 │         72.97 │
 │ gcp        │      136000.0 │        5.3 │         71.78 │
 │ hadoop     │      135000.0 │        5.3 │         71.39 │
 │ nosql      │      134415.0 │        5.3 │         70.74 │
 │ pyspark    │      140000.0 │        5.0 │         70.33 │
 │ docker     │      135000.0 │        5.0 │         67.09 │
 │ mongodb    │      135750.0 │        4.9 │         66.69 │
 │ go         │      140000.0 │        4.7 │         66.18 │
 │ r          │      134775.0 │        4.9 │         65.91 │
 │ github     │      135000.0 │        4.8 │          65.4 │
 │ bigquery   │      135000.0 │        4.8 │         64.96 │
 └────────────┴───────────────┴────────────┴───────────────┘
 */
select sd.skills,
    round(median(jf.salary_year_avg), 0) as median_salary,
    round(ln(count(jf.*)), 1) as log_demand,
    round(
        median(jf.salary_year_avg) * ln(count(jf.*)) / 10000,
        2
    ) as optimal_score,
    from job_postings_fact as jf
    inner join skills_job_dim as sjd on jf.job_id = sjd.job_id
    inner join skills_dim as sd on sjd.skill_id = sd.skill_id
where jf.job_title_short = 'Machine Learning Engineer'
    and job_work_from_home = 'true'
    and jf.salary_year_avg is not null
group by sd.skills,
    job_work_from_home
having count(jf.*) > 20
order by optimal_score desc
limit 15;
/*
 ┌──────────────┬───────────────┬────────────┬───────────────┐
 │    skills    │ median_salary │ log_demand │ optimal_score │
 │   varchar    │    double     │   double   │    double     │
 ├──────────────┼───────────────┼────────────┼───────────────┤
 │ python       │      125000.0 │        4.9 │         61.41 │
 │ tensorflow   │      137500.0 │        4.0 │         54.59 │
 │ spark        │      158534.0 │        3.4 │         53.92 │
 │ pytorch      │      123385.0 │        4.2 │         52.06 │
 │ kubernetes   │      156250.0 │        3.1 │          48.3 │
 │ sql          │      121770.0 │        3.8 │          45.8 │
 │ java         │      142750.0 │        3.1 │         44.12 │
 │ aws          │       97500.0 │        4.2 │         40.85 │
 │ numpy        │      115750.0 │        3.4 │         39.37 │
 │ gcp          │      105625.0 │        3.6 │         37.85 │
 │ airflow      │      110000.0 │        3.3 │         36.25 │
 │ azure        │       95000.0 │        3.5 │         33.22 │
 │ scikit-learn │       96150.0 │        3.4 │         32.38 │
 │ pandas       │       87500.0 │        3.2 │         27.81 │
 └──────────────┴───────────────┴────────────┴───────────────┘
 */
select sd.skills,
    round(median(jf.salary_year_avg), 0) as median_salary,
    round(ln(count(jf.*)), 1) as log_demand,
    round(
        median(jf.salary_year_avg) * ln(count(jf.*)) / 10000,
        2
    ) as optimal_score,
    from job_postings_fact as jf
    inner join skills_job_dim as sjd on jf.job_id = sjd.job_id
    inner join skills_dim as sd on sjd.skill_id = sd.skill_id
where jf.job_title_short = 'Data Analyst'
    and job_work_from_home = 'true'
    and jf.salary_year_avg is not null
group by sd.skills,
    job_work_from_home
having count(jf.*) > 50
order by optimal_score desc
limit 15;
/*
 ┌────────────┬───────────────┬────────────┬───────────────┐
 │   skills   │ median_salary │ log_demand │ optimal_score │
 │  varchar   │    double     │   double   │    double     │
 ├────────────┼───────────────┼────────────┼───────────────┤
 │ jira       │      145000.0 │        4.1 │         60.08 │
 │ sql        │       90000.0 │        6.7 │         59.97 │
 │ tableau    │       95000.0 │        6.2 │         59.13 │
 │ python     │       90000.0 │        6.2 │         55.82 │
 │ power bi   │       90000.0 │        5.7 │         51.12 │
 │ r          │       89796.0 │        5.7 │         50.88 │
 │ excel      │       83500.0 │        6.1 │         50.84 │
 │ sas        │       85900.0 │        5.4 │         46.33 │
 │ looker     │       87500.0 │        4.8 │         41.67 │
 │ oracle     │      100000.0 │        4.1 │         41.27 │
 │ sql server │      100200.0 │        4.1 │         40.69 │
 │ powerpoint │       86500.0 │        4.6 │         39.57 │
 │ snowflake  │       89000.0 │        4.4 │         39.33 │
 │ azure      │       86150.0 │        4.3 │         37.31 │
 │ word       │       81825.0 │        4.5 │          37.0 │
 └────────────┴───────────────┴────────────┴───────────────┘
 */