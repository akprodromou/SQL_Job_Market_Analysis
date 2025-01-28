/*
What are the most optimal skills to learn?
*/

-- combine both CTEs inside a single WITH statement, separating them with a comma

WITH skills_demand AS (
    SELECT
        skills_job_dim.skill_id,
        skills_dim.skills AS skill_name,
        COUNT(job_postings_fact.job_id) AS job_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short LIKE '%Data Analyst%'
        AND job_location LIKE '%UK%' 
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_job_dim.skill_id, skill_name
),
average_salaries AS (
    SELECT
        skills_job_dim.skill_id,
        skills_dim.skills AS skill_name,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS average_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short LIKE '%Data Analyst%'
        AND job_location LIKE '%UK%' 
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_job_dim.skill_id, skill_name
)

SELECT
    skills_demand.skill_id,
    skills_demand.skill_name,
    job_count,
    average_salary
FROM
    skills_demand
INNER JOIN
    average_salaries
ON
    skills_demand.skill_id = average_salaries.skill_id
WHERE
    job_count > 5
ORDER BY
    average_salary DESC,
    job_count DESC;



