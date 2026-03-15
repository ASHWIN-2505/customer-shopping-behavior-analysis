# Customer Shopping Behavior Analysis

## Project Overview

This project analyzes retail customer shopping behavior to uncover purchasing patterns, revenue drivers, and customer segments. The analysis combines **Python for exploratory data analysis, MySQL for structured querying, and Power BI for interactive dashboard visualization**.

The goal is to provide insights into how different customer demographics and product categories influence overall business performance.

---

# Problem Statement

Retail businesses need to understand customer purchasing behavior in order to improve product strategies, marketing campaigns, and revenue generation.

This project explores:

* Which product categories generate the most revenue
* Which customer segments contribute the most to sales
* How age, gender, and subscription status influence purchasing behavior
* How customer purchase history affects spending patterns

---

# Dataset Description

The dataset contains retail customer transaction data including demographic attributes, product categories, purchase amounts, and behavioral information.

### Key Columns

* Customer ID
* Age
* Gender
* Item Purchased
* Category
* Purchase Amount (USD)
* Subscription Status
* Previous Purchases
* Frequency of Purchases
* Review Rating
* Payment Method
* Shipping Type

The dataset was cleaned and standardized before analysis.

---

# Tools & Technologies Used

### Python

* Pandas
* NumPy
* Matplotlib
* Seaborn

Used for:

* Data cleaning
* Exploratory Data Analysis
* Customer behavior analysis

### MySQL

Used for:

* Data querying
* Revenue aggregation
* Customer segmentation analysis

### Power BI

Used for:

* Interactive dashboards
* KPI tracking
* Customer segmentation visualization

---

# Key Analyses Performed

### Customer Segmentation

Customers were analyzed based on:

* Age groups
* Gender
* Subscription status

### Revenue Analysis

* Revenue by product category
* Revenue by customer demographics
* Revenue distribution analysis

### Customer Behavior Analysis

* Purchase frequency
* Previous purchase trends
* Subscription impact on spending

---

# Key Insights

* **Clothing** generates the highest revenue among all product categories.
* **Male customers contribute approximately 68% of total revenue.**
* Customers aged **51–65 generate the highest overall revenue.**
* **Non-subscribed customers contribute a larger share of total revenue.**
* **Accessories and Clothing dominate overall order volume.**

These insights highlight the importance of targeting key customer segments and optimizing product category strategies.

---

# Power BI Dashboard

The Power BI dashboard provides an interactive view of customer purchasing behavior and revenue patterns.

### Dashboard Features

* Total Revenue KPI
* Total Orders KPI
* Average Purchase Value
* Revenue by Product Category
* Revenue Distribution by Gender
* Revenue by Customer Age Group
* Revenue by Subscription Status
* Category Revenue Split by Gender

Interactive filters allow exploration by:

* Age group
* Gender

---

# Dashboard Preview

![Dashboard Overview](screenshots/dashboard_overview.png)

---

# Repository Structure

```
customer-shopping-behavior-analysis
│
├── data
│   └── customer_shopping_behavior.csv
│
├── notebooks
│   └── customer_behavior_analysis.ipynb
│
├── sql
│   └── customer_behavior_queries.sql
│
├── dashboard
│   └── customer_behavior_dashboard.pbix
│
├── screenshots
│   ├── dashboard_overview.png
│   ├── revenue_by_category.png
│   ├── revenue_by_age_group.png
│   ├── revenue_by_gender.png
│   └── subscription_analysis.png
│
└── README.md
```

---

# Project Workflow

1. Data Cleaning and Exploration using **Python**
2. Revenue and segmentation analysis using **MySQL**
3. Interactive dashboard creation using **Power BI**
4. Business insights generation and visualization

---

# Business Recommendations

* Focus marketing campaigns on **high-spending age segments (36–65)**
* Convert high-value **non-subscribed customers into subscribers**
* Expand marketing strategies for **female customers**
* Promote **underperforming categories like outerwear**
* Develop targeted promotions for **top performing categories**

---

# Author

**Ashwin Shende**

Data Analyst | Python | SQL | Power BI

---

