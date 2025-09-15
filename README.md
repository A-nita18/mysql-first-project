# SQL Data Cleaning Project – Layoffs Dataset

## 📌 Project Overview
This project demonstrates how to clean and prepare raw data in **MySQL**.  
Using a layoffs dataset, the script walks through essential data-cleaning steps:
- Removing duplicates
- Standardizing company, industry, and country names
- Converting date strings into proper `DATE` format
- Handling null or blank values
- Dropping unnecessary columns

The result is a clean, standardized table (`layoff_staging2`) ready for further analysis.

---

## 🗂 Files in this Repository
- `Cleaning data.sql` → Main SQL script for the cleaning process

---

## ⚙️ How to Use

1. **Create a database** (or use an existing one):
   ```bash
   mysql -u root -p -e "CREATE DATABASE layoffs_db;"

2. **Import the script into MySQL**:

   mysql -u root -p layoffs_db < "Cleaning data.sql"


3. **Explore the cleaned table**:

   SELECT * FROM layoff_staging2;
