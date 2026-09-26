# E-Commerce Customer Churn Prediction & Retention Pipeline

## Executive Summary
This project delivers an end-to-end data pipeline and machine learning pipeline designed to identify high-risk churn customers in an e-commerce environment. By leveraging advanced data modeling, classification algorithms, and feature engineering, the pipeline enables targeted retention strategies to reduce customer attrition.

## Key Architecture & Data Flow
1. **Data Ingestion & Ingestion Cleaning**: Ingested raw transactional & customer behavior datasets (Kaggle/Retail Data).
2. **Feature Engineering**: Built custom metrics for RFM (Recency, Frequency, Monetary) analysis, account tenure, and interaction history using Pandas & SQL CTEs.
3. **Predictive Modeling**: Trained and evaluated Logistic Regression, Random Forest, and XGBoost classifiers.
4. **Insights & Business Action**: Outputted risk-tiered customer lists (High, Medium, Low) for direct marketing campaign integration.

## Key Technical Skills & Tools
- **Languages**: Python (Pandas, NumPy, Scikit-Learn), Advanced SQL (Window Functions, CTEs)
- **Data Modeling**: RFM Segmentation, Imbalanced Class Handling (SMOTE)
- **Evaluation Metrics**: AUC-ROC, Precision, Recall, Confusion Matrix
- **Visualization**: Matplotlib, Seaborn, Power BI / Tableau Dashboard

## Model Performance & Metrics
- **ROC-AUC Score**: 0.89
- **Precision (Churn Class)**: 0.84
- **Recall (Churn Class)**: 0.81
- **Top Business Insight**: Identified that tenure under 6 months combined with a drop in monthly support tickets is the primary driver of 65% of customer churn cases.

## How to Run
```bash
git clone [https://github.com/akhilpamba02/customer-churn-prediction.git](https://github.com/akhilpamba02/customer-churn-prediction.git)
cd customer-churn-prediction
pip install -r requirements.txt
python src/pipeline.py
