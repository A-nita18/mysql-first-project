# SQL Data Cleaning Project – Layoffs Dataset

## 📌 Project Overview
This project demonstrates how to clean, explore, and prepare raw data in **MySQL**.  
Using a **layoffs** dataset, this repo includes both data-cleaning and data-exploration steps:

- Removing duplicates  
- Standardizing company, industry, and country names  
- Converting string dates into proper `DATE` format  
- Handling null or blank values  
- Dropping unnecessary columns  
- Exploring the data for insights (via `Data exploration.sql`)  

The final cleaned result is stored in the table `layoff_staging2`, which is ready for analysis.

---

## 🗂️ Repository Contents

| File | Purpose |
|---|---|
| `layoffs.csv` | Raw data input |
| `Cleaning data.sql` | SQL script to clean & prepare the dataset |
| `Data exploration.sql` | SQL queries to explore and understand the cleaned data |
| `README.md` | Project description and instructions |

---

## ⚙️ How to Use / Run the Project

1. **Create a new database** (or pick an existing one):
   ```bash
   mysql -u root -p -e "CREATE DATABASE layoffs_db;"
Load the raw CSV into a staging table (you may need to create a table that matches the CSV structure).

3. **Import the cleaning script**:

   ```bash
   Copy code
   mysql -u root -p layoffs_db < Cleaning\ data.sql
   
4. **Run the data exploration script**:

   ```bash
   Copy code
   mysql -u root -p layoffs_db < Data\ exploration.sql
   
5. **Inspect the resulting cleaned table**:
   
   ```sql
   Copy code
   USE layoffs_db;
   SELECT * FROM layoff_staging2 LIMIT 100;
   
**Notes**
The cleaning script assumes you already have the raw data in a table named layoffs that matches the schema of layoffs.csv.

The exploration script uses the cleaned table layoff_staging2.

Be sure to check for null values or any formatting issues after import.

**License**
This project is open source under the MIT License.
Feel free to use, adapt, or expand it for your learning or portfolio.
