/*
 Question:
 What are the highest paying skills for each of Data engineers, analysts and ML engineers?
 - Calculate the median salary for each skill required for the job.
 - Include skill frequency to identify both salary and demand.
 - Remote ones
 */
select sd.skills,
    round(median(jf.salary_year_avg), 0) as median_salary,
    count(skills) as demand
from job_postings_fact as jf
    inner join skills_job_dim as sjd on jf.job_id = sjd.job_id
    inner join skills_dim as sd on sjd.skill_id = sd.skill_id
where jf.job_title_short = 'Data Engineer'
group by sd.skills,
    job_work_from_home
having job_work_from_home = 'true'
    and count(skills) > 100
order by median_salary desc
limit 25;
/*
 ┌────────────┬───────────────┬────────┐
 │   skills   │ median_salary │ demand │
 │  varchar   │    double     │ int64  │
 ├────────────┼───────────────┼────────┤
 │ rust       │      210000.0 │    232 │
 │ golang     │      184000.0 │    912 │
 │ terraform  │      184000.0 │   3248 │
 │ spring     │      175500.0 │    364 │
 │ neo4j      │      170000.0 │    277 │
 │ gdpr       │      169616.0 │    582 │
 │ zoom       │      168438.0 │    127 │
 │ graphql    │      167500.0 │    445 │
 │ mongo      │      162250.0 │    265 │
 │ fastapi    │      157500.0 │    204 │
 │ django     │      155000.0 │    265 │
 │ bitbucket  │      155000.0 │    478 │
 │ crystal    │      154224.0 │    129 │
 │ atlassian  │      151500.0 │    249 │
 │ c          │      151500.0 │    444 │
 │ typescript │      151000.0 │    388 │
 │ kubernetes │      150500.0 │   4202 │
 │ node       │      150000.0 │    179 │
 │ airflow    │      150000.0 │   9996 │
 │ css        │      150000.0 │    262 │
 │ ruby       │      150000.0 │    736 │
 │ redis      │      149000.0 │    605 │
 │ vmware     │      148798.0 │    136 │
 │ ansible    │      148798.0 │    475 │
 │ jupyter    │      147500.0 │    400 │
 └────────────┴───────────────┴────────┘
 */
select sd.skills,
    round(median(jf.salary_year_avg), 0) as median_salary,
    count(skills) as demand
from job_postings_fact as jf
    inner join skills_job_dim as sjd on jf.job_id = sjd.job_id
    inner join skills_dim as sd on sjd.skill_id = sd.skill_id
where jf.job_title_short = 'Machine Learning Engineer'
group by sd.skills,
    job_work_from_home
having job_work_from_home = 'true'
    and count(skills) > 100
order by median_salary desc
limit 25;
/*
 ┌────────────┬───────────────┬────────┐
 │   skills   │ median_salary │ demand │
 │  varchar   │    double     │ int64  │
 ├────────────┼───────────────┼────────┤
 │ mongodb    │      223000.0 │    302 │
 │ scala      │      194000.0 │    296 │
 │ flow       │      171000.0 │    103 │
 │ excel      │      170000.0 │    116 │
 │ c          │      165318.0 │    101 │
 │ hadoop     │      165318.0 │    299 │
 │ flask      │      165318.0 │    106 │
 │ jupyter    │      165000.0 │    122 │
 │ bigquery   │      165000.0 │    101 │
 │ github     │      161250.0 │    339 │
 │ spark      │      158534.0 │    961 │
 │ kubernetes │      156250.0 │    904 │
 │ go         │      152500.0 │    346 │
 │ snowflake  │      152500.0 │    170 │
 │ linux      │      145000.0 │    196 │
 │ java       │      142750.0 │    655 │
 │ r          │      141500.0 │    449 │
 │ databricks │      140875.0 │    450 │
 │ tensorflow │      137500.0 │   1594 │
 │ git        │      130000.0 │    557 │
 │ python     │      125000.0 │   3600 │
 │ pytorch    │      123385.0 │   1677 │
 │ sql        │      121770.0 │   1178 │
 │ c++        │      120000.0 │    306 │
 │ keras      │      120000.0 │    507 │
 └────────────┴───────────────┴────────┘
 */
select sd.skills,
    round(median(jf.salary_year_avg), 0) as median_salary,
    count(skills) as demand
from job_postings_fact as jf
    inner join skills_job_dim as sjd on jf.job_id = sjd.job_id
    inner join skills_dim as sd on sjd.skill_id = sd.skill_id
where jf.job_title_short = 'Data Analyst'
group by sd.skills,
    job_work_from_home
having job_work_from_home = 'true'
    and count(skills) > 100
order by median_salary desc
limit 25;
/*
 ┌──────────────┬───────────────┬────────┐
 │    skills    │ median_salary │ demand │
 │   varchar    │    double     │ int64  │
 ├──────────────┼───────────────┼────────┤
 │ typescript   │      445000.0 │    132 │
 │ perl         │      158000.0 │    115 │
 │ pyspark      │      153026.0 │    273 │
 │ kafka        │      145538.0 │    141 │
 │ zoom         │      145000.0 │    217 │
 │ jira         │      145000.0 │    798 │
 │ scala        │      135000.0 │    252 │
 │ shell        │      117300.0 │    145 │
 │ airflow      │      114250.0 │    552 │
 │ c            │      112850.0 │    373 │
 │ linux        │      112500.0 │    282 │
 │ dax          │      110000.0 │    544 │
 │ ssis         │      110000.0 │    444 │
 │ databricks   │      110000.0 │    776 │
 │ hadoop       │      107500.0 │    474 │
 │ db2          │      106850.0 │    114 │
 │ t-sql        │      106500.0 │    204 │
 │ php          │      105000.0 │    136 │
 │ scikit-learn │      103500.0 │    132 │
 │ javascript   │      103250.0 │    859 │
 │ unix         │      103000.0 │    106 │
 │ spark        │      102500.0 │    639 │
 │ go           │      102250.0 │   1714 │
 │ confluence   │      101500.0 │    300 │
 │ sql server   │      100200.0 │   1102 │
 └──────────────┴───────────────┴────────┘
 */