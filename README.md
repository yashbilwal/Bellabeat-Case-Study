# 📊 Bellabeat Capstone Case Study

**Google Data Analytics Professional Certificate**  
**Case Study 2: How Can a Wellness Technology Company Play It Smart?**  
**Author:** Yash Bilwal

---

## 📌 1. Ask — Business Task

Bellabeat, a wellness-focused smart device manufacturer, wants to understand how consumers are using their smart fitness devices.  
The goal is to analyze user behavior trends using Fitbit data to generate actionable marketing recommendations.

**Key questions:**
- What are the patterns in smart device usage?
- How can Bellabeat apply these patterns to their customer base?
- What data-driven strategies can improve product marketing?

---

## 🧹 2. Prepare — Data Source & Structure

**Dataset:** [Fitbit Fitness Tracker Data (Kaggle)](https://www.kaggle.com/datasets/arashnic/fitbit)  
**Timeframe:** March–May 2016  
**Users:** 33 unique Fitbit users (anonymized)

**Files used:**
- `dailyActivity_merged.csv`
- `sleepDay_merged.csv`
- `heartrate_seconds_merged.csv`

**Tools:** R, tidyverse, ggplot2, lubridate

---

## ⚙️ 3. Process — Data Cleaning

### `dailyActivity_merged.csv`
- Converted `ActivityDate` to proper `Date` format
- Verified: 940 records, 0 missing values, 33 unique users

### `sleepDay_merged.csv`
- Parsed datetime using `mdy_hms()`, extracted `SleepDate`

### `heartrate_seconds_merged.csv`
- Parsed `Time` column as datetime, extracted daily values
- Final size: 2.48 million rows

---

## 📊 4. Analyze — Key Findings

### 🔹 Daily Steps
- **Mean:** 7,638 steps  
- **Median:** 7,406 steps  
- **Most users:** 3k–11k steps/day  
- Right-skewed distribution with a few super active users

### 🔹 Calories Burned
- **Mean:** 2,304 kcal/day  
- **Correlation with steps:** `r = 0.59`  
- Strong link between activity and calories

### 🔹 Activity Breakdown
| Activity Type     | Avg Minutes |
|-------------------|-------------|
| Sedentary         | 991 mins (~16.5 hrs) |
| Lightly Active    | 193 mins    |
| Very Active       | 21 mins     |
| Fairly Active     | 13 mins     |

> 💡 Most users lead a highly sedentary lifestyle

### 🔹 Sleep Patterns
- **Avg time in bed:** 7.6 hrs  
- **Avg sleep duration:** 7.0 hrs  
- **Efficiency:** Mostly 90–100%  
- Some outliers indicate sleep issues

### 🔹 Heart Rate
- **Avg daily HR:** 65–85 bpm (healthy)  
- Few outliers >95 bpm suggest stress/overtraining

---

## 📤 5. Share — Visuals Created

Using **ggplot2** in R:
- 📈 Histograms (steps, calories, sleep, heart rate)
- 🔁 Correlation plot (steps vs calories)
- 📊 Bar chart (activity minutes breakdown)

Visuals can be stored in `/visuals/` folder in GitHub repo.

---

## 🎯 6. Act — Marketing Recommendations

1. 🏃‍♀️ **Promote Active Breaks**  
   Encourage short movement routines for sedentary users

2. 👟 **Gamify Step Goals**  
   Create challenges/rewards around daily step counts

3. 😴 **Smart Sleep Coaching**  
   Recommend content based on sleep efficiency patterns

4. ❤️ **Stress & Heart Rate Alerts**  
   Use resting heart rate to guide mindfulness programs

5. 🧠 **Segmented Marketing**  
   Customize campaigns for low vs. high-activity users

---

✅ **Created by:** Yash Bilwal  
📅 **Date:** June 2025  
🌐 **Portfolio:** [yashbilwal.vercel.app](https://yashbilwal.vercel.app)