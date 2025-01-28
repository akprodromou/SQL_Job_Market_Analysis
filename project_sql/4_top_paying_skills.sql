/*
What are the top skills based on salary?
*/

SELECT 
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
    skills_dim.skill_id, skill_name
ORDER BY
    average_salary DESC
LIMIT 25;


/*

The highest-paying skills are strongly related to AI, Machine Learning, and Data Science.

C++ is widely used for high-performance computing in ML/AI applications.
Pandas, NumPy, PyTorch, and TensorFlow are essential libraries in the Python ecosystem for data manipulation, deep learning, and model training.
AI/Machine Learning engineers seem to command the top salaries.

*/