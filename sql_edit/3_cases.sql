SELECT *
FROM skills_job_dim
LIMIT 10;

SELECT *
FROM job_postings_fact
LIMIT 10;

SELECT *
FROM skills_dim
LIMIT 10;


SELECT 
    COUNT(skills_job_dim.job_id) AS count_of_posts,
    skills_job_dim.skill_id,
    skills_dim.skills  AS skill_name
FROM skills_job_dim
INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_postings_fact.job_location = 'Anywhere'
GROUP BY skills_job_dim.skill_id, skills_dim.skills
ORDER BY count_of_posts DESC
LIMIT 5;

SELECT job_title_short, salary_year_avg
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) IN (1, 2, 3)
AND salary_year_avg > 70000
AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC
LIMIT 10;

