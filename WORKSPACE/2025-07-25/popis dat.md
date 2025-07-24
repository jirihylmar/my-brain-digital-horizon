# 🔮 Datasety pro prediktivní modelování a business aplikace forecastingu

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

## 🚀 **Business aplikace:**

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