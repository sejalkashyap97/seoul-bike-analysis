# Seoul Bike Sharing Demand Analysis
# Group 13 — ISI Delhi, Semester 2 (2025)
# Data Source: UCI Machine Learning Repository

# ── Libraries ────────────────────────────────────────────────────────────────
library(dplyr)
library(lattice)
library(ggplot2) 

# ── Load Data ─────────────────────────────────────────────────────────────────
data <- read.csv("https://raw.githubusercontent.com/sejalkashyap97/seoul-bike-analysis/main/SeoulBikeData.csv", 
                 fileEncoding = "latin1")
# Check unique season values in the dataset
unique(data$Seasons)

# ── Seasonal Distribution ─────────────────────────────────────────────────────
# Histogram of bike rental counts split by season
histogram(~Rented.Bike.Count | Seasons, data,
          main = "Distribution of Bike Rentals by Season")


# ── Seasonal Averages ─────────────────────────────────────────────────────────
# Calculate average rentals per season
season_avg <- data |>
  group_by(Seasons) |>
  summarise(avg_bike = mean(Rented.Bike.Count, na.rm = TRUE))
season_avg
# Overall average across all seasons
overall_avg <- mean(data$Rented.Bike.Count, na.rm = TRUE)
overall_avg
# Percentage difference of each season from the overall average
season_avg_diff <- season_avg |>
  mutate(percent_diff = ((avg_bike - overall_avg) / overall_avg) * 100)

season_avg_diff

# Bar chart showing seasonal % deviation from average
barchart(percent_diff ~ Seasons, data = season_avg_diff,
         col = "skyblue",
         main = "Seasonal % Change in Bike Rentals",
         ylab = "% Difference from Overall Average")

# ── Weather Variables vs Rentals ──────────────────────────────────────────────
# Temperature vs rentals — expect positive relationship (warmer = more rentals)
xyplot(Rented.Bike.Count ~ Temperature..C. | Seasons, data,
       type = c("p", "r"),
       col.line = "red",
       main = "Temperature vs Bike Rentals by Season")

# Rainfall vs rentals — expect negative relationship
xyplot(Rented.Bike.Count ~ Rainfall.mm. | Seasons, data,
       type = c("p", "r"),
       col.line = "red",
       main = "Rainfall vs Bike Rentals by Season")

# Humidity vs rentals
xyplot(Rented.Bike.Count ~ Humidity... | Seasons, data,
       type = c("p", "r"),
       col.line = "red",
       main = "Humidity vs Bike Rentals by Season")

# Snowfall vs rentals — expect strong negative relationship in winter
xyplot(Rented.Bike.Count ~ Snowfall..cm. | Seasons, data,
       type = c("p","r"),
       col.line = "red",
       main = "Snowfall vs Bike Rentals by Season")

# ── Peak Hour Analysis ────────────────────────────────────────────────────────
# Average rentals per hour
peak_hrs <- data |>
  group_by(Hour) |>
  summarise(avg_bike = mean(Rented.Bike.Count, na.rm = TRUE)) |>
  arrange(desc(avg_bike))
peak_hrs

# Rental count by hour of day, split by season
xyplot(Rented.Bike.Count ~ Hour | Seasons, data,
       type = c("p", "r"),
       col.line = "red",
       main = "Hour vs Bike Rentals by Season")

# Average rentals per hour grouped by season
seasonal_peak_hrs <- data |>
  group_by(Seasons, Hour) |>
  summarise(avg_bike = mean(Rented.Bike.Count, na.rm = TRUE)) |>
  arrange(desc(avg_bike))
print(seasonal_peak_hrs)

# Dot plot showing peak hour patterns across seasons
ggplot(data = seasonal_peak_hrs, aes(x = Hour, y = avg_bike, color = Seasons)) +
  geom_point(size = 2) +
  labs(title = "Average Rentals by Hour and Season",
       x = "Hour of Day", y = "Average Rentals") +
  theme_minimal()

# ── Correlation Matrix ────────────────────────────────────────────────────────
# Quantify relationships between rentals and key weather variables
cor(data[, c("Rented.Bike.Count", "Temperature..C.", "Humidity...",
             "Wind.speed..m.s.", "Rainfall.mm.", "Snowfall..cm.")])
