# Trénovací datasety pro datovou analýzu

## Analýza sociálních médií

**Soubor:** `social_media_posts.tsv`

### Struktura dat:
- **post_id** - Jedinečný identifikátor příspěvku
- **platform** - Platforma (Instagram, Twitter, Facebook)
- **user_id** - ID uživatele (opakující se klíče)
- **content** - Text příspěvku
- **likes** - Počet lajků
- **shares** - Počet sdílení
- **comments** - Počet komentářů
- **timestamp** - Datum a čas publikování
- **hashtags** - Použité hashtahy
- **sentiment** - Sentiment (pozitivní, negativní, neutrální)

### Analytické možnosti:
✅ **Engagement analýza** podle platformy  
✅ **Sentiment analýza** v čase  
✅ **Hashtag trendy**  
✅ **Uživatelské chování** (opakující se uživatelé)  
✅ **Časové analýzy** aktivit  

### Doporučené cvičení:
- Výpočet engagement rate
- Analýza nejaktivnějších uživatelů
- Trend sentimentu podle dní
- Popularita hashtagů

## Zákaznická podpora

**Soubor:** `customer_support_tickets.tsv`

### Struktura dat:
- **ticket_id** - Jedinečný identifikátor tiketu
- **customer_id** - ID zákazníka (opakující se klíče)
- **category** - Kategorie (Technical, Billing, Account, General)
- **priority** - Priorita (Low, Medium, High, Critical)
- **status** - Stav (Open, In Progress, Resolved)
- **created_date** - Datum vytvoření
- **resolved_date** - Datum vyřešení (může být prázdné)
- **agent_id** - ID agenta (opakující se klíče)
- **satisfaction_score** - Hodnocení spokojenosti (1-5)
- **description** - Popis problému

### Analytické možnosti:
✅ **SLA analýza** - doba vyřešení podle priority  
✅ **Výkonnost agentů** - počet vyřešených tiketů  
✅ **Zákaznická spokojenost** podle kategorií  
✅ **Trend objemu** tiketů v čase  
✅ **Analýza opakujících se** zákazníků  

### Doporučené cvičení:
- Průměrná doba vyřešení podle priority
- Top performing agenti
- Kategorií s nejnižší spokojeností
- Customers s nejvíce tikety

## HR analýza zaměstnanců

**Soubor:** `hr_employee_data.tsv`

### Struktura dat:
- **employee_id** - Jedinečný identifikátor zaměstnance
- **name** - Jméno zaměstnance
- **department** - Oddělení (IT, HR, Finance, Marketing, Sales)
- **position** - Pozice
- **hire_date** - Datum nástupu
- **salary** - Plat
- **age** - Věk
- **gender** - Pohlaví
- **education** - Vzdělání
- **performance_rating** - Hodnocení výkonu (1-5)
- **training_hours** - Hodiny školení
- **overtime_hours** - Přesčasové hodiny
- **sick_days** - Nemocenské dny
- **status** - Stav (Active, Terminated)

### Analytické možnosti:
✅ **Mzdová analýza** podle pozice/oddělení  
✅ **Performance analýza** vs. demografické údaje  
✅ **Turnover analýza**  
✅ **Work-life balance** (přesčasy vs. nemocnost)  
✅ **ROI školení** (training vs. performance)  

### Doporučené cvičení:
- Mzdové rozdíly podle pohlaví
- Korelace věku a výkonu
- Oddělení s nejvyšším turnovorem
- Vztah přesčasů a nemocnosti

## Retailové prodeje

**Soubor:** `retail_sales_data.tsv`

### Struktura dat:
- **transaction_id** - Jedinečný identifikátor transakce
- **customer_id** - ID zákazníka (opakující se klíče)
- **product_category** - Kategorie produktu
- **product_name** - Název produktu
- **quantity** - Množství
- **unit_price** - Jednotková cena
- **total_amount** - Celková částka
- **purchase_date** - Datum nákupu
- **payment_method** - Způsob platby
- **store_location** - Lokace obchodu
- **customer_age** - Věk zákazníka
- **customer_gender** - Pohlaví zákazníka

### Analytické možnosti:
✅ **Sales performance** podle kategorií  
✅ **Customer segmentation** podle věku/pohlaví  
✅ **Geografická analýza** prodejů  
✅ **Basket analysis** - co nakupují společně  
✅ **Platební trendy**  
✅ **Seasonality** analýza  

### Doporučené cvičení:
- Top selling kategorie
- Průměrná hodnota nákupu podle věku
- Preferované platební metody podle lokace
- Loyal customers (opakované nákupy)

## Recenze produktů

**Soubor:** `product_reviews_dataset.tsv`

### Struktura dat:
- **review_id** - Jedinečný identifikátor recenze
- **product_id** - ID produktu (opakující se klíče)
- **product_name** - Název produktu
- **category** - Kategorie produktu
- **rating** - Hodnocení (1-5)
- **review_text** - Text recenze
- **reviewer_name** - Jméno recenzenta
- **review_date** - Datum recenze
- **verified_purchase** - Ověřený nákup (TRUE/FALSE)
- **helpful_votes** - Počet užitečných hlasů

### Analytické možnosti:
✅ **Sentiment analýza** textů  
✅ **Rating distribution** podle kategorií  
✅ **Impact verified purchase** na hodnocení  
✅ **Review helpfulness** faktory  
✅ **Product quality** analýza  
✅ **Time trends** v hodnocení  

### Doporučené cvičení:
- Průměrné hodnocení podle kategorie
- Vliv verified purchase na rating
- Nejužitečnější recenze
- Sentiment analýza textů

## Výrobní data

**Soubor:** `production_data.tsv`

### Struktura dat:
- **batch_id** - Jedinečný identifikátor šarže
- **production_date** - Datum výroby
- **shift** - Směna (Morning, Afternoon, Night)
- **machine_id** - ID stroje (opakující se klíče)
- **operator_id** - ID operátora (opakující se klíče)
- **units_produced** - Vyrobené kusy
- **defect_count** - Počet vadných kusů
- **quality_score** - Skóre kvality (%)
- **temperature** - Teplota prostředí
- **humidity** - Vlhkost prostředí
- **material_cost** - Náklady na materiál
- **production_time_hours** - Doba výroby v hodinách

### Analytické možnosti:
✅ **Quality control** analýza  
✅ **Machine performance** porovnání  
✅ **Operator efficiency** analýza  
✅ **Environmental impact** (teplota/vlhkost)  
✅ **Cost optimization** analýza  
✅ **Shift patterns** analýza  

### Doporučené cvičení:
- Nejefektivnější stroje/operátoři
- Vliv prostředí na kvalitu
- Optimální podmínky výroby
- Cost per unit analýza

## Finanční data

**Soubor:** `financial_data.tsv`

### Struktura dat:
- **date** - Datum
- **stock_symbol** - Symbol akcie (opakující se klíče)
- **company_name** - Název společnosti
- **open_price** - Otevírací cena
- **high_price** - Nejvyšší cena dne
- **low_price** - Nejnižší cena dne
- **close_price** - Zavírací cena
- **volume** - Objem obchodů
- **sector** - Sektor
- **market_cap_mil** - Tržní kapitalizace (mil.)
- **pe_ratio** - P/E ratio

### Analytické možnosti:
✅ **Price trend** analýza  
✅ **Volatility** měření  
✅ **Sector performance** porovnání  
✅ **Volume-price** vztahy  
✅ **Valuation metrics** analýza  
✅ **Risk assessment**  

### Doporučené cvičení:
- Daily returns calculation
- Volatility podle sektorů
- Korelace mezi akciemi
- P/E ratio analýza

## Technické specifikace

### Formát souborů:
- **TSV** (Tab-Separated Values)
- **UTF-8** kódování
- **Header row** s názvy sloupců
- **Konzistentní datové typy**

### Velikost datasetů:
- **30-40 záznamů** každý
- **Opakující se klíče** pro komplexnější analýzy
- **Realistická data** s variabilitou

## Učební cíle

Po práci s těmito datasety budete umět:
- ✅ Načítat a čistit data
- ✅ Provádět exploratory data analysis (EDA)
- ✅ Vytvářet smysluplné vizualizace
- ✅ Počítat klíčové metriky
- ✅ Identifikovat trendy a vzory
- ✅ Pracovat s různými datovými typy
- ✅ Řešit reálné business problémy