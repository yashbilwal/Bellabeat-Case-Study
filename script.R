# Install and load the tidyverse package
install.packages("tidyverse") 
library(tidyverse)

# Load the dataset
daily_activity <- read_csv("D:/Yash/Academics/Google_data_analytics/bellabeat-case-study/dailyActivity_merged.csv")

# View the first few rows
head(daily_activity)

# See the structure of the data
glimpse(daily_activity)

# Convert ActivityDate to Date format
daily_activity <- daily_activity %>%
  mutate(ActivityDate = mdy(ActivityDate))

# Check the structure again
glimpse(daily_activity)

# Count missing values per column
colSums(is.na(daily_activity))

# Count duplicated rows
sum(duplicated(daily_activity))

# Number of unique users
n_distinct(daily_activity$Id)


summary(daily_activity$TotalSteps)


# Histogram of daily steps
ggplot(daily_activity, aes(x = TotalSteps)) +
  geom_histogram(fill = "#69b3a2", bins = 30) +
  labs(title = "Distribution of Daily Steps",
       x = "Total Steps per Day",
       y = "Count of Users") +
  theme_minimal()


summary(daily_activity$Calories)

ggplot(daily_activity, aes(x = Calories)) +
  geom_histogram(fill = "#ff7f0e", bins = 30) +
  labs(title = "Distribution of Daily Calories Burned",
       x = "Calories Burned",
       y = "Count of Users") +
  theme_minimal()

ggplot(daily_activity, aes(x = TotalSteps, y = Calories)) +
  geom_point(alpha = 0.5, color = "#2c3e50") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Steps vs. Calories Burned",
       x = "Total Steps",
       y = "Calories Burned") +
  theme_minimal()

cor(daily_activity$TotalSteps, daily_activity$Calories)


daily_activity %>%
  select(VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes) %>%
  summary()


# Step 1: Create a summary table
activity_summary <- daily_activity %>%
  summarise(
    VeryActive = mean(VeryActiveMinutes),
    FairlyActive = mean(FairlyActiveMinutes),
    LightlyActive = mean(LightlyActiveMinutes),
    Sedentary = mean(SedentaryMinutes)
  ) %>%
  pivot_longer(cols = everything(), names_to = "ActivityType", values_to = "AverageMinutes")

# Step 2: Plot the summary
ggplot(activity_summary, aes(x = ActivityType, y = AverageMinutes, fill = ActivityType)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Daily Minutes by Activity Level",
       x = "Activity Level",
       y = "Average Minutes") +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal()



# Load the file
sleep_data <- read_csv("D:/Yash/Academics/Google_data_analytics/bellabeat-case-study/sleepDay_merged.csv")

# Preview the structure
glimpse(sleep_data)

# Convert SleepDay to Date
sleep_data <- sleep_data %>%
  mutate(SleepDay = mdy_hms(SleepDay))  # handles date + time

# Optional: extract just the date (if needed for joining later)
sleep_data <- sleep_data %>%
  mutate(SleepDate = as_date(SleepDay))

# Preview cleaned structure
glimpse(sleep_data)


summary(sleep_data$TotalMinutesAsleep)
summary(sleep_data$TotalTimeInBed)

sleep_data <- sleep_data %>%
  mutate(SleepEfficiency = round((TotalMinutesAsleep / TotalTimeInBed) * 100, 1))


ggplot(sleep_data, aes(x = SleepEfficiency)) +
  geom_histogram(fill = "#6a5acd", bins = 25) +
  labs(title = "Distribution of Sleep Efficiency",
       x = "Sleep Efficiency (%)",
       y = "Number of Records") +
  theme_minimal()


# Load the file
heart_data <- read_csv("D:/Yash/Academics/Google_data_analytics/bellabeat-case-study/heartrate_seconds_merged.csv")

# Preview structure
glimpse(heart_data)

# Convert Time to datetime
heart_data <- heart_data %>%
  mutate(Time = mdy_hms(Time))

# Create a Date column for grouping
heart_data <- heart_data %>%
  mutate(Date = as_date(Time))

# Check structure again
glimpse(heart_data)


# Calculate average HR per user per day
avg_hr <- heart_data %>%
  group_by(Id, Date) %>%
  summarise(AverageHR = mean(Value)) %>%
  ungroup()

# Preview result
head(avg_hr)

ggplot(avg_hr, aes(x = AverageHR)) +
  geom_histogram(fill = "#e74c3c", bins = 30) +
  labs(title = "Distribution of Average Daily Heart Rate",
       x = "Average Heart Rate (bpm)",
       y = "Count of User-Days") +
  theme_minimal()


