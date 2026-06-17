# GA4 Product Analytics Dashboard

## Overview

This project is an end-to-end product analytics case study built using the Google Analytics 4 (GA4) Sample Ecommerce dataset. The goal was to transform raw event-level data into actionable business insights using SQL in BigQuery and visualise those findings through an interactive Looker Studio dashboard.

The analysis focuses on understanding customer acquisition, conversion behaviour, product performance, and retention patterns to identify opportunities for improving ecommerce performance.

---

## Dashboard Access

[View Interactive Dashboard](https://datastudio.google.com/reporting/b88c5fba-3b2d-4950-8bf2-068f38c08480)

---

## Project Objective

The objective of this project was to answer key business questions, including:

* Where do customers drop off during the purchase journey?
* Which acquisition channels generate the most revenue?
* Which channels attract higher-value customers?
* Which products attract attention but fail to convert?
* How many sessions do customers typically require before purchasing?
* How effectively are customers retained over time?
---

## Dataset

**Source:** Google Analytics 4 Sample Ecommerce Dataset

Dataset:
`bigquery-public-data.ga4_obfuscated_sample_ecommerce`

The dataset contains anonymised ecommerce interactions from the Google Merchandise Store, including:

* Product views
* Add-to-cart events
* Checkout activity
* Purchases
* Product information
* Traffic acquisition data
* User sessions
* Customer behaviour events

---

## Tools Used

* **Google BigQuery** – SQL querying and data modelling
* **Looker Studio** – Dashboard development and visualisation
* **Google Analytics 4 Sample Dataset** – Event-level ecommerce data
* **GitHub** – Version control and project documentation

---

## Dashboard Structure

### Page 1: Executive Overview

Provides a high-level view of ecommerce performance.

**KPI Scorecards**

* Cart Rate
* Purchase Rate
* Purchasers
* Revenue

**Filters**

* Product
* Traffic Source

**Visualisations**

* Customer Purchase Funnel
* Revenue by Acquisition Channel
* Top Revenue-Generating Products
* Acquisition Quality by Channel

---

### Page 2: Product Performance

Evaluates how products perform throughout the customer journey.

**KPI Scorecards**

* Total Revenue
* Units Sold
* Purchase Events

**Visualisations**

* Product Conversion Table
* Top Products by Units Sold
* Product Opportunity Matrix

---

### Page 3: Customer Behaviour

Explores how customers convert and return over time.

**Visualisations**

* Sessions Before Purchase
* Cohort Retention Analysis

---

## Analysis Performed

### Purchase Funnel Analysis

Analysed user progression through the ecommerce funnel to identify where the largest drop-offs occur.

### Traffic Source Analysis

Evaluated acquisition channels based on:

* Revenue generated
* Number of purchasers
* Revenue per purchaser

### Product Revenue Analysis

Identified products contributing the highest revenue and sales volume.

### Product Conversion Analysis

Compared product interest against purchasing behaviour to uncover products with optimisation potential.

### Product Opportunity Analysis

Highlighted products with high visibility but low conversion rates.

### Sessions Before Purchase Analysis

Measured the number of sessions users required before completing a purchase.

### Cohort Retention Analysis

Tracked user retention across acquisition cohorts to understand repeat engagement patterns.

---

## Key Findings

* Only **7.21%** of product viewers ultimately completed a purchase.
* The largest funnel drop occurred between **product view and add-to-cart**, where only **20.48%** of users progressed.
* **Google** generated the highest overall revenue, contributing approximately **$104,831**.
* **shop.googlemerchandisestore.com** delivered the highest revenue per purchaser at approximately **$89.12**.
* Several products attracted significant customer interest but converted poorly, indicating optimisation opportunities.
* Most purchases occurred within the first few sessions, with conversion likelihood declining thereafter.
* Cohort retention declined sharply after the initial month, suggesting limited repeat engagement.

---

## Business Recommendations

### Improve Funnel Conversion

Investigate friction points between product viewing and cart addition through experimentation, product page optimisation, and usability improvements.

### Invest in High-Quality Acquisition Channels

Prioritise channels that generate higher-value customers rather than focusing solely on purchase volume.

### Optimise Opportunity Products

Review pricing, merchandising, inventory availability, and product presentation for products with strong interest but low purchase conversion.

### Encourage Earlier Conversion

Use remarketing campaigns and targeted incentives to encourage purchases within the first few customer sessions.

### Strengthen Retention Strategies

Develop post-purchase engagement initiatives and reactivation campaigns to improve repeat customer activity.

---

## What I Learned

Through this project, I strengthened my ability to:

* Write analytical SQL using BigQuery.
* Transform event-level GA4 data into business metrics.
* Design multi-page dashboards in Looker Studio.
* Identify conversion bottlenecks and optimisation opportunities.
* Translate analytical findings into actionable business recommendations.
* Present data through a structured analytical narrative.

---

## Conclusion

This project demonstrates an end-to-end analytics workflow, from querying raw GA4 event data to delivering executive-ready insights through an interactive dashboard. It highlights the importance of combining technical skills with business storytelling to drive informed decision-making.
