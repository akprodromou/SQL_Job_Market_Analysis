
/*
- What are the most in-demand skills?
*/

SELECT 
    skills_dim.skills AS skill_name,
    COUNT(job_postings_fact.job_id) AS job_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short LIKE '%Data Analyst%' AND
    job_location LIKE '%UK%' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id, skill_name
ORDER BY
    job_count DESC
LIMIT 5;

