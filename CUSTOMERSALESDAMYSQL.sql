CREATE DATABASE retail_analysis;
USE retail_analysis;

CREATE TABLE customer_behavior (
    customer_id INT,
    age INT,
    gender VARCHAR(20),
    item_purchased VARCHAR(100),
    category VARCHAR(50),
    purchase_amount DECIMAL(10,2),
    location VARCHAR(100),
    size VARCHAR(20),
    color VARCHAR(50),
    season VARCHAR(20),
    review_rating DECIMAL(3,2),
    subscription_status TINYINT,
    shipping_type VARCHAR(50),
    discount_applied TINYINT,
    promo_code_used TINYINT,
    previous_purchases INT,
    payment_method VARCHAR(50),
    frequency_of_purchases VARCHAR(50),
    frequency_standardized VARCHAR(50)
);

DROP TABLE customer_behavior;

CREATE TABLE customer_behavior (
    customer_id INT,
    age INT,
    gender VARCHAR(20),
    item_purchased VARCHAR(100),
    category VARCHAR(50),
    purchase_amount DECIMAL(10,2),
    location VARCHAR(100),
    size VARCHAR(20),
    color VARCHAR(50),
    season VARCHAR(20),
    review_rating DECIMAL(3,2),
    subscription_status VARCHAR(10),
    shipping_type VARCHAR(50),
    discount_applied VARCHAR(10),
    promo_code_used VARCHAR(10),
    previous_purchases INT,
    payment_method VARCHAR(50),
    frequency_of_purchases VARCHAR(50),
    frequency_standardized VARCHAR(50)
);

SELECT COUNT(*) FROM customer_behavior;
SELECT COUNT(*) FROM customer_behavior;

SELECT COUNT(review_rating) FROM customer_behavior;
TRUNCATE TABLE customer_behavior;

LOAD DATA LOCAL INFILE 'C:/Users/Ashwin/Downloads/customer_shopping_behavior.csv'
INTO TABLE customer_behavior
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
customer_id,
age,
gender,
item_purchased,
category,
purchase_amount,
location,
size,
color,
season,
@review_rating,
subscription_status,
shipping_type,
discount_applied,
promo_code_used,
previous_purchases,
payment_method,
frequency_of_purchases,
frequency_standardized
)
SET review_rating = NULLIF(@review_rating, '');

SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'local_infile';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer_shopping_behavior.csv'
INTO TABLE customer_behavior
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
customer_id,
age,
gender,
item_purchased,
category,
purchase_amount,
location,
size,
color,
season,
@review_rating,
subscription_status,
shipping_type,
discount_applied,
promo_code_used,
previous_purchases,
payment_method,
frequency_of_purchases,
frequency_standardized
)
SET review_rating = NULLIF(@review_rating, '');

SELECT COUNT(*) FROM customer_behavior;

## Revenue by Category
SELECT 
    category,
    COUNT(*) AS total_orders,
    ROUND(AVG(purchase_amount),2) AS avg_purchase,
    SUM(purchase_amount) AS total_revenue
FROM customer_behavior
GROUP BY category
ORDER BY total_revenue DESC;

# Business Conclusion #1
# Revenue concentration risk exists.
# Clothing dominates revenue share.
# If Clothing demand drops → overall revenue drops significantly.

## Which Age Groups are driving revenue?
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        WHEN age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '66-70'
    END AS age_group,
    COUNT(*) AS total_orders,
    ROUND(AVG(purchase_amount),2) AS avg_purchase,
    SUM(purchase_amount) AS total_revenue
FROM customer_behavior
GROUP BY age_group
ORDER BY total_revenue DESC;

# Strategic Conclusion #2
# Your business is:
# Volume-driven
# Middle-aged dominant
# Price-stable across demographics
# That’s very valuable intelligence.

## Which Age + Category combination drives the most revenue?
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        WHEN age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '66-70'
    END AS age_group,
    category,
    SUM(purchase_amount) AS total_revenue
FROM customer_behavior
GROUP BY age_group, category
ORDER BY total_revenue DESC
LIMIT 10;
# our ideal customer profile: Age: 36–65
# Primary purchase: Clothing
# Secondary purchase: Accessories

## Does subscription status impact revenue?
SELECT 
    subscription_status,
    COUNT(*) AS total_orders,
    ROUND(AVG(purchase_amount),2) AS avg_purchase,
    SUM(purchase_amount) AS total_revenue
FROM customer_behavior
GROUP BY subscription_status;

# Subscription is currently not a strong revenue lever.

## Does subscription affect purchase frequency?
SELECT 
    subscription_status,
    ROUND(AVG(previous_purchases),2) AS avg_previous_purchases
FROM customer_behavior
GROUP BY subscription_status;

## testing gender revenue concentration.
SELECT 
    gender,
    COUNT(*) AS total_orders,
    ROUND(AVG(purchase_amount),2) AS avg_purchase,
    SUM(purchase_amount) AS total_revenue
FROM customer_behavior
GROUP BY gender;

# Revenue concentration among middle-aged male customers purchasing Clothing.
# But spending parity exists across genders.
# So expansion opportunity lies in:
# Targeted marketing toward female segments.

## Let’s see if gender preference differs by category.
SELECT 
    category,
    gender,
    COUNT(*) AS total_orders,
    SUM(purchase_amount) AS total_revenue
FROM customer_behavior
GROUP BY category, gender
ORDER BY category, total_revenue DESC;

#our retail model is:

# Volume-driven
# Clothing-centric
# Middle-aged dominant
# Male-skewed customer base
# Subscription program weakly differentiated
# Price stable across segments