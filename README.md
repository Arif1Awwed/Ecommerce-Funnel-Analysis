# 🛒 E-Commerce Sales Funnel & Revenue Optimization Strategy 

![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/SQL-003B57?style=for-the-badge&logo=mysql&logoColor=white)
![Data Analysis](https://img.shields.io/badge/Data_Analysis-4CAF50?style=for-the-badge)

## 📌 Project Overview
This project provides a comprehensive end-to-end analysis of the customer journey within an e-commerce platform, tracking 5,000 unique users across 9,381 granular events—from their initial page view to the final purchase. 

The primary goal is to identify funnel bottlenecks, measure conversion rates across different stages, evaluate time-to-convert velocities, and analyze revenue to determine the most effective marketing channels. SQL was used to extract and process the raw data using advanced CTEs, while a fully interactive Power BI dashboard was built (utilizing DAX) to visualize the findings and provide actionable insights for decision-makers.

## 🎯 Key Analysis Objectives
1. **Sales Funnel Analysis:** Tracking user drop-offs sequentially across 5 stages (`page_view` ➔ `add_to_cart` ➔ `checkout_start` ➔ `payment_info` ➔ `purchase`).
2. **Conversion Rates:** Calculating stage-to-stage retention to pinpoint exactly where potential customers are lost.
3. **Traffic Source Performance:** Evaluating the performance of different marketing channels (Organic, Paid Ads, Social, Email) based on sales volume and conversion efficiency.
4. **Time-to-Conversion Analysis:** Calculating the average time (in minutes) it takes for a user to move from browsing to purchasing to detect UI/UX friction.
5. **Revenue Analysis:** Measuring Total Revenue, Total Orders, and Average Order Value (AOV).

## 📊 Key Findings & Insights
* **Funnel Overview:** Out of **5,000** unique visitors, **826** users successfully completed a purchase, resulting in a solid overall conversion rate of **16.52%**.
* **Revenue Generation:** The store generated **$87,975.11** in total gross revenue, with a healthy Average Order Value (AOV) of **$106.51**.
* **Traffic Sources Analysis:**
  * **Organic Traffic** is the top-performing channel in terms of volume, bringing in the highest number of overall interactions (3,904 events).
  * **Paid Ads** and **Social Media** drove significant mid-funnel traffic but require optimization to match the ROI of organic search.
  * **Email** campaigns demonstrated strong retention, proving highly effective for bottom-of-funnel conversions.
* **Drop-off Bottlenecks:** The steepest drop-off occurs right at the top of the funnel (between `page_view` and `add_to_cart`), indicating that while traffic generation is healthy, product page persuasion needs improvement.

## 💡 Strategic Recommendations & Action Plan
Based on the data insights, the following strategies are recommended to optimize revenue and reduce drop-offs:
1. **Optimize Product Pages (Top-of-Funnel):** Since the biggest loss occurs before adding items to the cart, introduce clearer Calls-to-Action (CTAs), display customer reviews prominently, and consider offering limited-time discounts or free shipping banners on the product pages.
2. **Implement Cart Abandonment Workflows (Mid-Funnel):** For users who drop off between `checkout_start` and `payment_info`, set up automated email retargeting triggers to remind them of their pending items, potentially offering a 5% discount to close the sale.
3. **Refine Social Media ROI:** Since social media generates high traffic but struggles with final conversions, refine audience targeting parameters to ensure the traffic being driven has higher purchase intent.
4. **Streamline Payment UI (Bottom-of-Funnel):** Analyze the time-to-conversion metrics. If users are spending too long on the `payment_info` page, integrate faster checkout options like Apple Pay, Google Wallet, or PayPal to reduce friction.

## 🛠️ Tools & Technologies Used
* **Database & Querying:** SQL (CTEs, Aggregate Functions, `TIMESTAMPDIFF` for duration tracking).
* **Data Visualization:** Power BI Desktop (Interactive Dashboards, Matrix Visuals, Funnel Charts).
* **Data Modeling:** DAX (Calculated Tables, `CALCULATE`, `DISTINCTCOUNT`, `DIVIDE` for dynamic KPIs) and Power Query for Data Type formatting.
* **Dataset:** `user_events.csv` (contains user IDs, event types, timestamps, revenue, and traffic sources).

## 📂 Repository Structure
* `user_events.csv`: The raw dataset logging comprehensive user actions.
* `Ecommerce-Funnel-Analysis.sql`: The complete SQL script containing all queries for the funnel, conversion, source, time-to-conversion, and revenue analysis.
* `Ecommerce-Funnel-Analysis.pbix`: The interactive Power BI dashboard file containing the semantic DAX model.
* `image_4ae4dd.png`: A UI blueprint image showcasing the final dashboard layout.
* `README.md`: Project documentation, findings, and deployment manual.

## 🚀 How to Use This Repository
1. Import the `user_events.csv` dataset into your preferred SQL environment (MySQL, PostgreSQL, SQL Server, etc.).
2. Run the queries inside `Ecommerce-Funnel-Analysis.sql` to explore the data and verify the backend metrics.
3. Open the `Ecommerce-Funnel-Analysis.pbix` file using Power BI Desktop. 
4. *Note:* If data connections break, go to **Transform Data > Data Source Settings**, change the source to your local path for the CSV file, and click **Refresh** to interact with the visualizations dynamically.
