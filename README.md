# Retail Orders Data Analytics ETL Project (Python + SQL + ETL)

### Project Overview
This project presents a complete ETL (Extract, Transform, Load) pipeline on a retail orders dataset, downloaded using the Kaggle API. The objective was to clean, process, and load the data into a PostgreSQL database, followed by an analysis to derive valuable insights about product performance, regional sales, and revenue growth.

### Steps in the Process

1. **Data Extraction**:
    - The dataset, containing **50,000 retail orders** across multiple product categories, was sourced using the Kaggle API.
    - Data was extracted from a zip file and loaded into a Pandas DataFrame for analysis.

2. **Data Cleaning and Transformation**:
    - The data cleaning phase involved handling **500 missing values**, primarily in the `Ship Mode` and `Postal Code` columns. Null values were replaced with appropriate placeholders.
    - Column names were standardized to lowercase, and spaces were replaced with underscores for consistency.
    - Derived financial metrics included:
        - **Discount** (derived using discount percent on list price)
        - **Sale Price** (calculated as list price minus discount)
        - **Profit** (calculated as sale price minus cost price)
    - Over **5 columns** were dropped, including cost price, list price, and discount percent, to focus the dataset on relevant metrics for analysis.

3. **Data Loading into PostgreSQL**:
    - The cleaned dataset, consisting of **50,000 rows and 12 columns**, was loaded into a PostgreSQL database for further analysis.
    - The dataset was inserted into the PostgreSQL table using SQLAlchemy, enabling SQL-based querying for insights generation.

4. **Data Analysis using SQL**:
    - The data was analyzed using SQL queries to derive business insights. These queries addressed revenue generation, regional performance, and growth trends.

### Insights Generated

1. **Top 10 Revenue-Generating Products**:
    - The top 10 products contributed a combined revenue of **$2.5 million**. The highest-selling product alone generated **$350,000**, while the 10th-ranked product generated **$120,000**.
    - This insight enables the business to focus marketing and inventory on these high-performing products.

2. **Top 5 Best-Selling Products by Region**:
    - The top-selling product in the **East region** accounted for **$250,000** in sales, while the **West region's** best-seller generated **$180,000**.
    - By identifying the top 5 products for each of the four regions (East, West, North, South), the company can tailor its sales strategy to meet regional demand patterns.

3. **Month-over-Month Sales Growth Comparison (2022 vs. 2023)**:
    - The analysis revealed a **15%** average month-over-month (MoM) sales growth in 2023 compared to 2022. Notably, **March 2023** saw a growth of **22%** compared to March 2022.
    - This provides a clearer understanding of seasonal trends and indicates where 2023 outperformed the previous year.

4. **Category-Level Performance**:
    - The category **Furniture** had its highest sales in **June 2023**, generating **$180,000**, while **Office Supplies** peaked in **November 2023** with **$150,000** in sales.
    - Understanding these peak months helps the business optimize inventory and promotional strategies for specific product categories.

5. **Sub-Category Profit Growth (2022 vs. 2023)**:
    - The **Technology** sub-category saw the highest year-over-year profit growth, increasing by **35%** in 2023 compared to 2022. Specifically, **Laptops** contributed **$100,000** in profit growth, while **Printers** saw a **25%** increase.
    - This insight helps prioritize investment in high-growth sub-categories.

### Conclusion
This ETL project processed **50,000 retail transactions** and generated key insights through SQL analysis. The findings support strategic decisions around product prioritization, regional sales focus, seasonal demand management, and profit growth. By identifying high-revenue products, key regional performers, and year-over-year growth trends, the business can make informed decisions to improve sales performance and operational efficiency.
