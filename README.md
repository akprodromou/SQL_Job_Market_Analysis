# Data Analyst Job Market Analysis (UK)

## 1. Introduction
This repository contains an in-depth **SQL-based analysis** of the **Data Analyst job market in the UK**, with a focus on the most in-demand and highest-paying skills. The goal is to identify key trends, optimal skills to learn, and salary insights for professionals looking to break into or advance within the field.

## 2. Background
The demand for Data Analysts continues to grow, driven by the need for data-driven decision-making across industries. However, not all skills are valued equally in the job market. This project aims to answer:
- Which skills are most frequently required in Data Analyst job postings?
- Which skills lead to the highest salaries?
- What are the most optimal skills to learn for career advancement?

## 3. Tools Used
- **SQL** for data querying and analysis
- **Python (Pandas, Matplotlib)** for visualization and insights
- **CSV files** for structured data storage
- **Git & GitHub** for version control
- **VS Code** as the primary development environment

## 4. The Analysis

### Key Queries and Files

The project is structured as follows:

**[project_sql](project_sql/)**
- [1_top_paying_jobs.sql](project_sql/1_top_paying_jobs.sql) → Identifies the highest-paying jobs
- [2_job_skills_required.sql](project_sql/2_job_skills_required.sql) → Extracts required skills from job postings
- [3_top_demanded_skills.sql](project_sql/3_top_demanded_skills.sql) → Analyzes skill frequency in job postings
- [4_top_paying_skills.sql](project_sql/4_top_paying_skills.sql) → Determines the highest-paying skills
- [5_optimal_skills.sql](project_sql/5_optimal_skills.sql) → Identifies the best skills to learn based on demand and salary
- **[top_paying_skills.csv](project_sql/top%20paying%20skills.csv)** → Processed dataset for further analysis

**[sql_edit](sql_edit/)**
- [2_dates.sql](sql_edit/2_dates.sql) → Handles date-based job data processing
- [3_cases.sql](sql_edit/3_cases.sql) → Manages case-based conditional logic in SQL

**[sql_load](sql_load/)**
- [1_create_database.sql](sql_load/1_create_database.sql) → Creates the database schema
- [2_create_tables.sql](sql_load/2_create_tables.sql) → Defines tables for job postings and skills
- [3_modify_tables.sql](sql_load/3_modify_tables.sql) → Adjusts table structures for optimized querying

## 5. Outcomes

### Most In-Demand Skills for Data Analysts in the UK

| Skill   | Job Postings Requiring It |
|---------|---------------------------|
| **SQL**    | 29 |
| **Excel**  | 20 |
| **Python** | 19 |
| **Tableau** | 10 |
| **R**      | 8 |

SQL is the most critical skill, followed by Excel and Python, reinforcing the importance of **data querying, manipulation, and visualization**.

### Highest-Paying Skills

| Skill | Average Salary (£) |
|--------|------------------|
| **C++** | 177,283 |
| **Pandas** | 177,283 |
| **PyTorch** | 177,283 |
| **NumPy** | 177,283 |
| **TensorFlow** | 177,283 |
| **MongoDB** | 165,000 |
| **AWS** | 131,438 |
| **SQL Server** | 120,379 |
| **Airflow** | 118,140 |
| **JavaScript** | 111,175 |

### Key Takeaways
- **Machine Learning & AI skills (TensorFlow, PyTorch, NumPy) command top salaries.**
- **Big Data & Cloud technologies (MongoDB, AWS, SQL Server) offer strong salaries.**
- **SQL-based database skills remain valuable across all salary ranges.**
- **DevOps & automation tools (Airflow, Kubernetes, GitHub) show increasing relevance.**
- **Traditional programming languages like JavaScript have lower pay in data-focused roles.**

## 6. Conclusions

### Recommended Learning Path
1. **Master SQL and Python** – These are fundamental for any Data Analyst role.
2. **Develop strong Cloud & Big Data skills** – Learn AWS, MongoDB, and Airflow.
3. **Enhance ML & AI expertise** – Gain knowledge in TensorFlow, PyTorch, and Pandas for higher salaries.
4. **Strengthen BI & Reporting capabilities** – Learn Tableau, Power BI, and Looker.

## Next Steps
- Extend the analysis to other countries/regions for global comparison.
- Incorporate time-series analysis to track trends over multiple years.
- Apply predictive modeling to forecast future skill demands.



