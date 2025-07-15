# 🔮 Datasety pro prediktivní modelování a business aplikace forecastingu

## 📊 Přehled datasetů

Vytvořil jsem **2 specializované datasety** zaměřené na praktické osvojení forecasting metod a jejich business implementaci:

1. **🔌 Energetická spotřeba** - pro **metody a techniky**
2. **💼 Business KPI** - pro **automatizaci a aplikace**

---

## 1. ⚡ **Dataset: Energetická spotřeba (Metody)**
**Soubor:** `energy_consumption_timeseries.tsv`

### 🎯 **Účel:** Osvojení forecasting metod
Tento dataset je speciálně navržen pro **porovnání různých prediktivních metod** s jasně viditelnými vzory.

### 📈 **Struktura dat:**

#### **Cílová proměnná:**
- **energy_consumption_mwh** - Spotřeba energie (hlavní proměnná k predikci)

#### **Časové komponenty:**
- **date** - Datum (2024-01-01 až 2024-01-03, hodinová data)
- **hour** - Hodina (0-23)
- **day_type** - Typ dne (Weekday, Weekend, Holiday)
- **month** - Měsíc
- **season** - Sezóna

#### **Exogenní proměnné:**
- **temperature_celsius** - Teplota (ovlivňuje spotřebu)
- **baseline_demand** - Základní poptávka
- **industrial_load** - Průmyslová zátěž
- **residential_load** - Domácí spotřeba
- **renewable_generation** - Obnovitelné zdroje
- **grid_frequency** - Frekvence sítě

#### **Analytické komponenty:**
- **demand_forecast_naive** - Naivní prognóza pro srovnání
- **trend_component** - Trendová složka
- **seasonal_component** - Sezónní složka  
- **random_component** - Náhodná složka

### 🔬 **Charakteristiky pro modelování:**

#### **✅ Jasný trend:** 
Postupný nárůst spotřeby v čase

#### **✅ Silná sezónnost:**
- **Denní cykly** - nižší spotřeba v noci, špička ráno/večer
- **Týdenní vzory** - rozdíly pracovní dny vs. víkendy
- **Sváteční efekty** - snížená spotřeba o svátcích

#### **✅ Exogenní faktory:**
- **Teplota** - inverzní vztah (chladněji = vyšší spotřeba)
- **Typ dne** - různé vzory podle dne v týdnu

#### **✅ Noise a variabilita:**
Přirozená variabilita pro testování robustnosti modelů

### 🛠️ **Doporučené metody k testování:**

#### **Statistické přístupy:**
```python
# ARIMA modely
ARIMA(1,1,1) pro základní trend
SARIMA(1,1,1)(1,1,1,24) pro sezónnost

# Exponenciální vyhlazování
Simple Exponential Smoothing
Holt-Winters (additive/multiplicative)
```

#### **Machine Learning:**
```python
# Sklearn modely
RandomForestRegressor
GradientBoostingRegressor
LinearRegression s polynomial features

# Specialized libraries
Prophet (Facebook)
LSTM neural networks
```

#### **Evaluační metriky:**
- **MAE** - Mean Absolute Error
- **MAPE** - Mean Absolute Percentage Error  
- **RMSE** - Root Mean Square Error
- **Forecast accuracy** - přesnost vs. naive forecast

---

## 2. 💼 **Dataset: Business KPI (Business aplikace)**
**Soubor:** `business_kpi_forecasting.tsv`

### 🎯 **Účel:** Automatizace a business implementace
Dataset navržen pro **praktické business scénáře** s důrazem na ROI, monitoring a automatizaci.

### 💰 **Struktura dat:**

#### **Core Business Metrics:**
- **daily_revenue** - Denní tržby (hlavní KPI)
- **new_customers** - Noví zákazníci
- **churn_rate** - Míra odchodu zákazníků
- **cac_cost_per_customer** - Customer Acquisition Cost
- **ltv_customer** - Customer Lifetime Value
- **gross_margin_pct** - Hrubá marže

#### **Operational Metrics:**
- **support_tickets** - Počet support tiketů
- **server_costs** - Náklady na servery
- **marketing_spend** - Marketingové výdaje
- **inventory_turnover** - Obrátka zásob

#### **Forecasting & Automation:**
- **forecast_revenue** - Prognóza tržeb
- **forecast_accuracy** - Přesnost předchozích prognóz
- **alert_threshold_revenue** - Práh pro alert systém
- **alert_threshold_churn** - Práh pro churn alert
- **reorder_trigger** - Trigger pro objednávku zásob

#### **Business Intelligence:**
- **roi_marketing** - ROI marketingu
- **cash_flow_impact** - Dopad na cash flow
- **seasonal_multiplier** - Sezónní multiplikátor

### 🚀 **Business aplikace:**

#### **📊 Predikce prodejů:**
```python
# Multi-step forecasting
revenue_forecast = model.predict(horizon=30)
confidence_intervals = model.predict_intervals()
```

#### **🔔 Automatizované alerting:**
```python
# Alert system implementation
if predicted_revenue < alert_threshold_revenue:
    send_alert("Revenue below threshold")
    
if predicted_churn > alert_threshold_churn:
    trigger_retention_campaign()
```

#### **💡 Optimalizace zásob:**
```python
# Automated reordering
if reorder_trigger == 1:
    optimal_order_quantity = calculate_eoq(demand_forecast)
    place_order(optimal_order_quantity)
```

#### **📈 ROI monitoring:**
```python
# Marketing ROI tracking
roi_forecast = predict_roi(marketing_spend_planned)
if roi_forecast < minimum_roi:
    adjust_marketing_budget()
```

#### **💰 Finanční plánování:**
```python
# Cash flow forecasting
cash_flow_30d = forecast_cash_flow(
    revenue_forecast, 
    predicted_costs,
    seasonal_adjustments
)
```

---

## 🎓 **Cvičební scénáře**

### **A) Metodické cvičení (Dataset 1: Energie):**

#### **Úroveň 1: Základní implementace**
1. **Exploratory Data Analysis**
   - Vizualizace časových řad
   - Decomposition (trend, seasonal, residual)
   - Stationarity testing (ADF test)

2. **Baseline modely**
   - Naive forecast
   - Moving averages
   - Simple exponential smoothing

3. **Pokročilé statistické metody**
   - ARIMA model selection
   - SARIMA s sezónností
   - Holt-Winters method

#### **Úroveň 2: Machine Learning**
4. **Feature engineering**
   - Lag features
   - Rolling statistics
   - Cyclical encoding (hour, day)

5. **ML modely**
   - Random Forest regressor
   - Gradient Boosting
   - Neural networks (LSTM)

6. **Model validation**
   - Time series cross-validation
   - Walk-forward validation
   - Hyperparameter tuning

### **B) Business implementace (Dataset 2: KPI):**

#### **Úroveň 1: Business forecasting**
1. **Revenue prediction**
   - Multi-horizon forecasting
   - Confidence intervals
   - Business impact assessment

2. **Customer analytics**
   - Churn prediction
   - CLV forecasting
   - CAC optimization

#### **Úroveň 2: Automatizace**
3. **Alert systems**
   - Threshold-based alerts
   - Anomaly detection
   - Automated responses

4. **Inventory optimization**
   - Demand forecasting
   - Reorder point calculation
   - Safety stock optimization

5. **Financial planning**
   - Cash flow forecasting
   - Budget optimization
   - ROI predictions

#### **Úroveň 3: Production deployment**
6. **Model monitoring**
   - Forecast accuracy tracking
   - Model drift detection
   - Automated retraining

7. **Dashboard creation**
   - Real-time KPI monitoring
   - Forecast visualization
   - Business intelligence reports

---

## 💻 **Technická implementace**

### **Python knihovny:**

#### **Statistické forecasting:**
```python
# Core libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Statistical forecasting
from statsmodels.tsa.arima.model import ARIMA
from statsmodels.tsa.holtwinters import ExponentialSmoothing
from statsmodels.tsa.seasonal import seasonal_decompose

# Facebook Prophet
from prophet import Prophet
```

#### **Machine Learning:**
```python
# Sklearn
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import TimeSeriesSplit
from sklearn.metrics import mean_absolute_error

# Deep learning
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import LSTM, Dense
```

#### **Business applications:**
```python
# Data processing
import pandas as pd
from datetime import datetime, timedelta

# Visualization and dashboards
import plotly.graph_objects as go
import plotly.express as px
import streamlit as st

# Alerts and monitoring
import smtplib
from email.mime.text import MIMEText
```

### **R knihovny:**
```r
# Core forecasting
library(forecast)
library(tseries)
library(seasonal)

# Advanced methods  
library(prophet)
library(modeltime)
library(timetk)

# Business applications
library(shiny)
library(DT)
library(plotly)
```

---

## 📋 **Praktické úkoly**

### **Dataset 1 (Energie) - Metodické cvičení:**

#### **Týden 1: Data exploration**
- [ ] Načtení a vizualizace dat
- [ ] Identifikace trendů a sezónnosti
- [ ] Testování stacionarity

#### **Týden 2: Statistické metody**
- [ ] Implementace ARIMA modelů
- [ ] SARIMA s hodinovou sezónností
- [ ] Exponenciální vyhlazování

#### **Týden 3: Machine Learning**
- [ ] Feature engineering
- [ ] Random Forest forecasting
- [ ] Model evaluation a comparison

### **Dataset 2 (Business) - Aplikační cvičení:**

#### **Týden 1: Business forecasting**
- [ ] Revenue forecasting pipeline
- [ ] Confidence intervals
- [ ] Business impact analysis

#### **Týden 2: Automatizace**
- [ ] Alert system implementation
- [ ] Automated reordering logic
- [ ] ROI optimization

#### **Týden 3: Production deployment**
- [ ] Model monitoring dashboard
- [ ] Automated retraining
- [ ] Business intelligence reports

---

## 🎯 **Učební výstupy**

Po dokončení práce s těmito datasety budete umět:

### **Metodické dovednosti:**
- ✅ **Implementovat** ARIMA, SARIMA, Holt-Winters modely
- ✅ **Porovnat** statistické vs. ML přístupy
- ✅ **Optimalizovat** hyperparametry pomocí cross-validation
- ✅ **Evaluovat** modely pomocí vhodných metrik

### **Business dovednosti:**
- ✅ **Vytvářet** automatizované forecasting systémy
- ✅ **Implementovat** alerting a monitoring
- ✅ **Optimalizovat** business procesy pomocí predikce
- ✅ **Prezentovat** výsledky managementu

### **Technické dovednosti:**
- ✅ **Pracovat** s time series v Python/R
- ✅ **Deployment** modelů do produkce
- ✅ **Vytvářet** dashboardy a reporty
- ✅ **Automatizovat** business rozhodování

**Tyto datasety poskytují komplexní základ pro zvládnutí prediktivního modelování od teorie až po praktickou business implementaci!** 🚀