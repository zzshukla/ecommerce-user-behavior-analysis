-- ============================================
-- E-Commerce User Behavior Analysis
-- Author: Harsh Shukla
-- Database: ecommerce_analysis
-- ============================================

-- Query 1 – Total Records
SELECT COUNT(*) AS Total_Records
FROM ecommerce;

-- Query 2 – Total Unique Users
SELECT COUNT(DISTINCT `user id`) AS Total_Users
FROM ecommerce;

 -- Query 3 – Total Unique Products
SELECT COUNT(DISTINCT `product id`) AS Total_Products
FROM ecommerce;

-- Query 4 – Count of Each Interaction Type
SELECT
    `Interaction type`,
    COUNT(*) AS Total
FROM ecommerce
GROUP BY `Interaction type`
ORDER BY Total DESC;

-- Query 5 – Top 10 Purchased Products
SELECT
    `product id`,
    COUNT(*) AS Purchases
FROM ecommerce
WHERE `Interaction type` = 'purchase'
GROUP BY `product id`
ORDER BY Purchases DESC
LIMIT 10;

-- Query 6 – Top 10 Viewed Products
SELECT
    `product id`,
    COUNT(*) AS Views
FROM ecommerce
WHERE `Interaction type` = 'view'
GROUP BY `product id`
ORDER BY Views DESC
LIMIT 10;

-- Query 7 – Top 10 Liked Products
SELECT
    `product id`,
    COUNT(*) AS Likes
FROM ecommerce
WHERE `Interaction type` = 'like'
GROUP BY `product id`
ORDER BY Likes DESC
LIMIT 10;

-- Query 8 – Daily Interaction Count

SELECT
    `Date`,
    COUNT(*) AS Total_Interactions
FROM ecommerce
GROUP BY `Date`
ORDER BY `Date`;

-- Query 9 – User Activity by Weekday

SELECT
    `Day Name`,
    COUNT(*) AS Total_Interactions
FROM ecommerce
GROUP BY `Day Name`
ORDER BY Total_Interactions DESC;

-- Query 10 – User Activity by Hour

SELECT
    `Hour`,
    COUNT(*) AS Total_Interactions
FROM ecommerce
GROUP BY `Hour`
ORDER BY `Hour`;

-- Query 11 – Monthly Activity

SELECT
    `Month Name`,
    COUNT(*) AS Total_Interactions
FROM ecommerce
GROUP BY `Month Name`;

-- Query 12 – Purchase Percentage

SELECT
ROUND(
    SUM(CASE
            WHEN `Interaction type`='purchase' THEN 1
            ELSE 0
        END) *100.0 / COUNT(*),
2) AS Purchase_Percentage
FROM ecommerce;

-- Query 13 – Like Percentage

SELECT
ROUND(
    SUM(CASE
            WHEN `Interaction type`='like' THEN 1
            ELSE 0
        END) *100.0 / COUNT(*),
2) AS Like_Percentage
FROM ecommerce;

-- Query 14 – View Percentage

SELECT
ROUND(
    SUM(CASE
            WHEN `Interaction type`='view' THEN 1
            ELSE 0
        END) *100.0 / COUNT(*),
2) AS View_Percentage
FROM ecommerce;

-- Query 15 – Rank Interaction Types

SELECT
    `Interaction type`,
    COUNT(*) AS Total_Interactions,
    RANK() OVER(ORDER BY COUNT(*) DESC) AS Ranking
FROM ecommerce
GROUP BY `Interaction type`;