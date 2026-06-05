# Seoul Bike Sharing Demand Analysis

Exploratory data analysis of Seoul's public bike rental system, examining how weather conditions and time patterns affect rental demand across seasons.

**Group 13 — ISI Delhi, Semester 2 (2026)**
## Contributors
- Sejal Kashyap (BSD-DH-2520)
- Ch Bavesh Sai Satya Prakash (BSDBG-2504)
- Parnika Garg (BSDBG-2511)
- Thangella Jeevantej (BSDBG-2519)
- Tinku (BSDBG-2520)
- Pinak Majumdar (BSDCC-2512)
---

## Objectives

- Identify peak demand hours across different seasons
- Understand how temperature, humidity, rainfall, and snowfall affect bike rentals
- Analyse seasonal trends in rental patterns

## Dataset

**Source:** UCI Machine Learning Repository — [Seoul Bike Sharing Demand](https://archive.ics.uci.edu/dataset/560/seoul+bike+sharing+demand)

The dataset contains hourly bike rental counts along with weather and holiday information for Seoul, South Korea.

## Tools Used

- **Language:** R
- **Libraries:** `ggplot2`, `dplyr`, `lattice`

## Analysis Summary

- **Peak Hours:** Rental demand peaks during morning (8 AM) and evening (6 PM) commute hours
- **Temperature:** Strong positive correlation with rental count — warmer weather drives more rentals
- **Humidity:** Negative correlation — high humidity suppresses demand
- **Rainfall & Snowfall:** Both significantly reduce rental counts
- **Seasonal Trends:** Summer sees highest demand; winter sees lowest, with cold and snow as key deterrents
## Files

| File | Description |
|------|-------------|
| [SeoulBikeData.csv](https://github.com/sejalkashyap97/seoul-bike-analysis/blob/main/SeoulBikeData.csv) | Raw dataset from UCI ML Repository |
| [seoul_bike_analysis.R](https://github.com/sejalkashyap97/seoul-bike-analysis/blob/main/seoul_bike_analysis1.R) | R script for analysis and visualizations |
| [Group_13_Presentation.pptx](https://github.com/sejalkashyap97/seoul-bike-analysis/blob/main/Group_13_Presentation.pptx) | Project presentation |

