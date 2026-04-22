# Data-Analysis-in-R
# 🚢 Titanic Survival Prediction using R

📌 Project Description

This project analyzes the Titanic dataset and predicts passenger survival using Logistic Regression in R. It includes data preprocessing, visualization, and model building to understand key factors affecting survival.

---

🎯 Objectives

* Perform data cleaning and preprocessing
* Handle missing values
* Explore dataset using visualizations
* Build a predictive model using logistic regression
* Evaluate model performance

---

🛠️ Technologies Used

* R Programming
* ggplot2
* dplyr

---

📂 Dataset

* Titanic dataset (CSV file)
* Contains details like Age, Sex, Passenger Class, Fare, etc.

---

⚙️ Steps Performed

1. Loaded dataset using `read.csv()`
2. Cleaned data (handled missing values)
3. Converted variables into factors
4. Performed Exploratory Data Analysis (EDA)
5. Created visualizations (barplots, histograms, ggplot graphs)
6. Built Logistic Regression model
7. Predicted survival and calculated accuracy
8. Exported cleaned dataset

---

📊 Model Details

* Algorithm: Logistic Regression
* Features used: Pclass, Sex, Age, Fare
* Output: Survival Prediction (0 = No, 1 = Yes)

---

📈 Results

* Model successfully predicts survival
* Accuracy calculated using predicted vs actual values
* Gender, class, and age significantly affect survival

---

▶️ How to Run

1. Install required libraries:

   ```R
   install.packages("ggplot2")
   install.packages("dplyr")
   ```
2. Run the R script file
3. Ensure dataset path is correct

---

📁 Output

* Cleaned dataset: `cleaned_titanic.csv`
* Graphs and model summary

---

📌 Conclusion

This project demonstrates how machine learning techniques like logistic regression can be applied to real-world datasets for prediction and analysis.
