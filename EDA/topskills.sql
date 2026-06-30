/*
 Question:
 What is the most in-demand skills for data engineers, analysts and ML engineers?
 - Identify top 8 in-demand skills for each.
 - Focus on remote jobs.
 */
select sd.skills,
    count(skills) as demand
from job_postings_fact as jf
    inner join skills_job_dim as sjd on jf.job_id = sjd.job_id
    inner join skills_dim as sd on sjd.skill_id = sd.skill_id
where jf.job_title_short = 'Data Engineer'
group by sd.skills,
    job_work_from_home
having job_work_from_home = 'true'
order by demand desc
limit 8;
/*
 ┌────────────┬────────┐
 │   skills   │ demand │
 │  varchar   │ int64  │
 ├────────────┼────────┤
 │ sql        │  29221 │
 │ python     │  28776 │
 │ aws        │  17823 │
 │ azure      │  14143 │
 │ spark      │  12799 │
 │ airflow    │   9996 │
 │ snowflake  │   8639 │
 │ databricks │   8183 │
 └────────────┴────────┘
 */
select sd.skills,
    count(skills) as demand
from job_postings_fact as jf
    inner join skills_job_dim as sjd on jf.job_id = sjd.job_id
    inner join skills_dim as sd on sjd.skill_id = sd.skill_id
where jf.job_title_short = 'Data Analyst'
group by sd.skills,
    job_work_from_home
having job_work_from_home = 'true'
order by demand desc
limit 8;
/*
 ┌──────────┬────────┐
 │  skills  │ demand │
 │ varchar  │ int64  │
 ├──────────┼────────┤
 │ sql      │  15293 │
 │ python   │   9973 │
 │ excel    │   9274 │
 │ tableau  │   8213 │
 │ power bi │   5946 │
 │ r        │   4714 │
 │ looker   │   2153 │
 │ sas      │   1715 │
 └──────────┴────────┘
 */
select sd.skills,
    count(skills) as demand
from job_postings_fact as jf
    inner join skills_job_dim as sjd on jf.job_id = sjd.job_id
    inner join skills_dim as sd on sjd.skill_id = sd.skill_id
where jf.job_title_short = 'Machine Learning Engineer'
group by sd.skills,
    job_work_from_home
having job_work_from_home = 'true'
order by demand desc
limit 8;
/*
 ┌────────────┬────────┐
 │   skills   │ demand │
 │  varchar   │ int64  │
 ├────────────┼────────┤
 │ python     │   3600 │
 │ aws        │   1748 │
 │ pytorch    │   1677 │
 │ tensorflow │   1594 │
 │ azure      │   1262 │
 │ sql        │   1178 │
 │ docker     │   1069 │
 │ spark      │    961 │
 └────────────┴────────┘
 */