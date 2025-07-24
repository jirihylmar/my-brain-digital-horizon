# Základy časových řad a explorační analýza (60 min)

## Úvod do časových řad a jejich specifik (15 min)

**Definice časových řad**
- Co jsou časové řady vs. běžné datasety
- Klíčové vlastnosti: časová závislost, trend, sezónnost
- Příklady z business prostředí

**Komponenty časových řad**
- **Trend** - dlouhodobý směr vývoje
- **Sezónnost** - pravidelné vzory (denní, týdenní, měsíční)
- **Cyklické vzory** - nepravidelné dlouhodobé cykly
- **Náhodná složka** - nepředvídatelná variabilita

## Klíčové pojmy a technologie

### ARIMA (AutoRegressive Integrated Moving Average)

**Co to je:** Statistický model pro časové řady kombinující tři komponenty:
- **AR (p)** - autoregresní část: současná hodnota závisí na p předchozích hodnotách
- **I (d)** - integrace: počet diferencování potřebný pro stacionaritu  
- **MA (q)** - klouzavý průměr: současná hodnota závisí na q předchozích chybách

**Kdy použít:** Pro stacionární časové řady s jasným trendem a autokorelací

### Exponenciální vyhlazování

**Co to je:** Metoda předpovídání, která dává exponenciálně klesající váhy historickým pozorováním
- **Simple:** Sₜ = αXₜ + (1-α)Sₜ₋₁
- **Double:** Přidává trend komponentu
- **Triple:** Přidává sezónní komponentu

**Výhoda:** Jednoduché, rychlé, dobré pro krátkodobé prognózy

### Holt-Winters metoda
**Co to je:** Pokročilá forma exponenciálního vyhlazování zahrnující trend a sezónnost
- **Additive:** Sezónnost se přičítá S(t) = L(t) + T(t) + S(t)
- **Multiplicative:** Sezónnost se násobí S(t) = L(t) × T(t) × S(t)

**Komponenty:**
- Level (úroveň): základní hodnota
- Trend: směr změny
- Seasonal: sezónní vzory

### ARIMA vs. Transformer architektury

**ARIMA:**

- **Lineární model** s explicitními komponenty
- **Parametrický** - pevný počet parametrů
- **Interpretovatelný** - rozumíme každému koeficientu
- **Malá data** - funguje s desítkami pozorování

**Transformer:**

- **Nelineární model** s attention mechanismem  
- **Non-parametrický** - adaptivní počet parametrů
- **Black box** - těžko interpretovatelný
- **Velká data** - potřebuje tisíce pozorování

**Klíčový rozdíl:** ARIMA modeluje explicitní vztahy (AR, MA), Transformer se učí implicit attention weights
