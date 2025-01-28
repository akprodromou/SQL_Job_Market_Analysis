/* What are the skills required for these roles? */


WITH job_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date,
        company_dim.name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short LIKE '%Data Analyst%' AND
        job_location LIKE '%UK%' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT
        10
)

SELECT
    job_paying_jobs.*,
    skills_dim.skills AS skill_required
FROM job_paying_jobs
INNER JOIN skills_job_dim ON job_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;


/*
From the job postings dataset, the most in-demand skills for data-related roles in the UK are:

- SQL and Python dominate the job market for Data Analysts.
- Cloud and Data Engineering skills (AWS, Azure, Big Data tools) are in high demand for senior roles.
- ML & AI knowledge is also valuable even for Data Analysts.

[
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 21:00:41",
    "company_name": "DeepMind",
    "skill_required": "python"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 21:00:41",
    "company_name": "DeepMind",
    "skill_required": "c++"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 21:00:41",
    "company_name": "DeepMind",
    "skill_required": "pandas"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 21:00:41",
    "company_name": "DeepMind",
    "skill_required": "numpy"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 21:00:41",
    "company_name": "DeepMind",
    "skill_required": "tensorflow"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 21:00:41",
    "company_name": "DeepMind",
    "skill_required": "pytorch"
  },
  {
    "job_id": 1563887,
    "job_title": "Data Architect",
    "job_location": "Cambridge, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-17 12:17:54",
    "company_name": "Darktrace",
    "skill_required": "sql"
  },
  {
    "job_id": 1563887,
    "job_title": "Data Architect",
    "job_location": "Cambridge, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-17 12:17:54",
    "company_name": "Darktrace",
    "skill_required": "mysql"
  },
  {
    "job_id": 1563887,
    "job_title": "Data Architect",
    "job_location": "Cambridge, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-17 12:17:54",
    "company_name": "Darktrace",
    "skill_required": "sql server"
  },
  {
    "job_id": 1563887,
    "job_title": "Data Architect",
    "job_location": "Cambridge, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-17 12:17:54",
    "company_name": "Darktrace",
    "skill_required": "flow"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "sql"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "python"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "scala"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "r"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "mongodb"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "postgresql"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "elasticsearch"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "sql server"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "mongodb"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "azure"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "aws"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "redshift"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "oracle"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "aurora"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "hadoop"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital",
    "skill_required": "kafka"
  },
  {
    "job_id": 478395,
    "job_title": "Data Architect",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-03-01 22:26:19",
    "company_name": "Logispin",
    "skill_required": "nosql"
  },
  {
    "job_id": 478395,
    "job_title": "Data Architect",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-03-01 22:26:19",
    "company_name": "Logispin",
    "skill_required": "azure"
  },
  {
    "job_id": 478395,
    "job_title": "Data Architect",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-03-01 22:26:19",
    "company_name": "Logispin",
    "skill_required": "looker"
  },
  {
    "job_id": 217504,
    "job_title": "Analytics Engineer - ENA London, Warsaw- (F/M)",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "139216.0",
    "job_posted_date": "2023-04-21 10:38:48",
    "company_name": "AccorCorpo",
    "skill_required": "sql"
  },
  {
    "job_id": 217504,
    "job_title": "Analytics Engineer - ENA London, Warsaw- (F/M)",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "139216.0",
    "job_posted_date": "2023-04-21 10:38:48",
    "company_name": "AccorCorpo",
    "skill_required": "python"
  },
  {
    "job_id": 307234,
    "job_title": "Finance Data Analytics Manager",
    "job_location": "Manchester, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-04-01 12:20:22",
    "company_name": "AJ Bell",
    "skill_required": "sql"
  },
  {
    "job_id": 307234,
    "job_title": "Finance Data Analytics Manager",
    "job_location": "Manchester, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-04-01 12:20:22",
    "company_name": "AJ Bell",
    "skill_required": "python"
  },
  {
    "job_id": 307234,
    "job_title": "Finance Data Analytics Manager",
    "job_location": "Manchester, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-04-01 12:20:22",
    "company_name": "AJ Bell",
    "skill_required": "r"
  },
  {
    "job_id": 307234,
    "job_title": "Finance Data Analytics Manager",
    "job_location": "Manchester, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-04-01 12:20:22",
    "company_name": "AJ Bell",
    "skill_required": "excel"
  },
  {
    "job_id": 307234,
    "job_title": "Finance Data Analytics Manager",
    "job_location": "Manchester, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-04-01 12:20:22",
    "company_name": "AJ Bell",
    "skill_required": "power bi"
  },
  {
    "job_id": 1493972,
    "job_title": "Senior Data Analyst - Octopus Electroverse",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-20 18:12:41",
    "company_name": "Octopus Energy",
    "skill_required": "sql"
  },
  {
    "job_id": 1493972,
    "job_title": "Senior Data Analyst - Octopus Electroverse",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-20 18:12:41",
    "company_name": "Octopus Energy",
    "skill_required": "python"
  },
  {
    "job_id": 1493972,
    "job_title": "Senior Data Analyst - Octopus Electroverse",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-20 18:12:41",
    "company_name": "Octopus Energy",
    "skill_required": "postgresql"
  },
  {
    "job_id": 1493972,
    "job_title": "Senior Data Analyst - Octopus Electroverse",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-20 18:12:41",
    "company_name": "Octopus Energy",
    "skill_required": "firebase"
  },
  {
    "job_id": 1493972,
    "job_title": "Senior Data Analyst - Octopus Electroverse",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-20 18:12:41",
    "company_name": "Octopus Energy",
    "skill_required": "databricks"
  },
  {
    "job_id": 1493972,
    "job_title": "Senior Data Analyst - Octopus Electroverse",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-20 18:12:41",
    "company_name": "Octopus Energy",
    "skill_required": "aws"
  },
  {
    "job_id": 1493972,
    "job_title": "Senior Data Analyst - Octopus Electroverse",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-20 18:12:41",
    "company_name": "Octopus Energy",
    "skill_required": "firebase"
  },
  {
    "job_id": 1493972,
    "job_title": "Senior Data Analyst - Octopus Electroverse",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-20 18:12:41",
    "company_name": "Octopus Energy",
    "skill_required": "spark"
  },
  {
    "job_id": 1493972,
    "job_title": "Senior Data Analyst - Octopus Electroverse",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-20 18:12:41",
    "company_name": "Octopus Energy",
    "skill_required": "airflow"
  },
  {
    "job_id": 1493972,
    "job_title": "Senior Data Analyst - Octopus Electroverse",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-20 18:12:41",
    "company_name": "Octopus Energy",
    "skill_required": "jupyter"
  },
  {
    "job_id": 1493972,
    "job_title": "Senior Data Analyst - Octopus Electroverse",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-20 18:12:41",
    "company_name": "Octopus Energy",
    "skill_required": "kubernetes"
  },
  {
    "job_id": 1493972,
    "job_title": "Senior Data Analyst - Octopus Electroverse",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-20 18:12:41",
    "company_name": "Octopus Energy",
    "skill_required": "github"
  },
  {
    "job_id": 34052,
    "job_title": "Senior Data Analyst",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-06-22 07:11:42",
    "company_name": "Publicis Groupe",
    "skill_required": "spark"
  },
  {
    "job_id": 34052,
    "job_title": "Senior Data Analyst",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-06-22 07:11:42",
    "company_name": "Publicis Groupe",
    "skill_required": "tableau"
  },
  {
    "job_id": 34052,
    "job_title": "Senior Data Analyst",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-06-22 07:11:42",
    "company_name": "Publicis Groupe",
    "skill_required": "cognos"
  },
  {
    "job_id": 1396666,
    "job_title": "Data Analyst - Financial services",
    "job_location": "Newcastle upon Tyne, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-28 14:23:24",
    "company_name": "Version 1",
    "skill_required": "sql"
  },
  {
    "job_id": 1396666,
    "job_title": "Data Analyst - Financial services",
    "job_location": "Newcastle upon Tyne, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-28 14:23:24",
    "company_name": "Version 1",
    "skill_required": "sas"
  },
  {
    "job_id": 1396666,
    "job_title": "Data Analyst - Financial services",
    "job_location": "Newcastle upon Tyne, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-28 14:23:24",
    "company_name": "Version 1",
    "skill_required": "aws"
  },
  {
    "job_id": 1396666,
    "job_title": "Data Analyst - Financial services",
    "job_location": "Newcastle upon Tyne, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-28 14:23:24",
    "company_name": "Version 1",
    "skill_required": "oracle"
  },
  {
    "job_id": 1396666,
    "job_title": "Data Analyst - Financial services",
    "job_location": "Newcastle upon Tyne, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-28 14:23:24",
    "company_name": "Version 1",
    "skill_required": "hadoop"
  },
  {
    "job_id": 1396666,
    "job_title": "Data Analyst - Financial services",
    "job_location": "Newcastle upon Tyne, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-28 14:23:24",
    "company_name": "Version 1",
    "skill_required": "sas"
  }
]
*/