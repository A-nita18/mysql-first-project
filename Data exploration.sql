-- Exploratory data

SELECT *
FROM layoff_staging2;

SELECT MAX(total_laid_off)
FROM layoff_staging2;

SELECT *
FROM layoff_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

SELECT company, SUM(total_laid_off)
FROM layoff_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT MIN(`date`),MAX(`date`)
FROM layoff_staging2;


SELECT industry, SUM(total_laid_off)
FROM layoff_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off)
FROM layoff_staging2
GROUP BY country
ORDER BY 2 DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoff_staging2
GROUP BY YEAR(`date`)
ORDER BY 2 DESC;

SELECT SUBSTRING(`date`,1,7) AS month, SUM(total_laid_off)
FROM layoff_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1;

WITH Rolling_total AS
(
SELECT SUBSTRING(`date`,1,7) AS month, SUM(total_laid_off) AS total_off
FROM layoff_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1
)
SELECT `MONTH`,total_off, SUM(total_off) OVER(ORDER BY `month`) AS rolling_total
FROM Rolling_total;

SELECT company,YEAR(`date`), SUM(total_laid_off)
FROM layoff_staging2
GROUP BY company,YEAR(`date`)
ORDER BY 3 DESC;

WITH company_year(Company,Years,Total_laid_off) AS
(
SELECT company,YEAR(`date`), SUM(total_laid_off)
FROM layoff_staging2
GROUP BY company,YEAR(`date`)
ORDER BY 3 DESC
), company_year_rank AS
(
SELECT *,DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM company_year
WHERE years IS NOT NULL
ORDER BY Ranking
)
SELECT *
FROM company_year_rank
WHERE Ranking <= 5;

SELECT stage, ROUND(AVG(percentage_laid_off),2)
FROM layoff_staging2
GROUP BY stage
ORDER BY 2 DESC;