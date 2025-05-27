Here are sample files with the same content in different formats:

## 1. produkty.csv (CSV - čárkou oddělené)
```csv
Kód,Název,Cena,DPH,Skladem
VC-1000,Vitamín C 1000mg,299,21,150
OM-3-500,Omega-3 rybí olej,459,21,75
MV-W-60,Multivitamín pro ženy,389,21,0
VD-2000,Vitamín D3 2000 IU,189,21,200
MG-B6-90,Hořčík + B6,269,21,45
```

## 2. produkty.tsv (TSV - tabulátorem oddělené)
```tsv
Kód	Název	Cena	DPH	Skladem
VC-1000	Vitamín C 1000mg	299	21	150
OM-3-500	Omega-3 rybí olej	459	21	75
MV-W-60	Multivitamín pro ženy	389	21	0
VD-2000	Vitamín D3 2000 IU	189	21	200
MG-B6-90	Hořčík + B6	269	21	45
```

## 3. produkty_semicolon.csv (středníkem oddělené)
```csv
Kód;Název;Cena;DPH;Skladem
VC-1000;Vitamín C 1000mg;299;21;150
OM-3-500;Omega-3 rybí olej;459;21;75
MV-W-60;Multivitamín pro ženy;389;21;0
VD-2000;Vitamín D3 2000 IU;189;21;200
MG-B6-90;Hořčík + B6;269;21;45
```

## 4. produkty.md (Markdown tabulka)
```markdown
| Kód | Název | Cena | DPH | Skladem |
|-----|-------|------|-----|---------|
| VC-1000 | Vitamín C 1000mg | 299 | 21 | 150 |
| OM-3-500 | Omega-3 rybí olej | 459 | 21 | 75 |
| MV-W-60 | Multivitamín pro ženy | 389 | 21 | 0 |
| VD-2000 | Vitamín D3 2000 IU | 189 | 21 | 200 |
| MG-B6-90 | Hořčík + B6 | 269 | 21 | 45 |
```

## 5. produkty.json (JSON formát)
```json
{
  "produkty": [
    {"kod": "VC-1000", "nazev": "Vitamín C 1000mg", "cena": 299, "dph": 21, "skladem": 150},
    {"kod": "OM-3-500", "nazev": "Omega-3 rybí olej", "cena": 459, "dph": 21, "skladem": 75},
    {"kod": "MV-W-60", "nazev": "Multivitamín pro ženy", "cena": 389, "dph": 21, "skladem": 0},
    {"kod": "VD-2000", "nazev": "Vitamín D3 2000 IU", "cena": 189, "dph": 21, "skladem": 200},
    {"kod": "MG-B6-90", "nazev": "Hořčík + B6", "cena": 269, "dph": 21, "skladem": 45}
  ]
}
```

## Návod k použití

### Cvičení 1: Import různých formátů
1. **CSV import**
   - Soubor → Import → vyberte `produkty.csv`
   - Oddělovač: čárka
   - Kódování: UTF-8

2. **TSV import**
   - Soubor → Import → vyberte `produkty.tsv`
   - Oddělovač: tabulátor
   - Všimněte si, že data jsou stejná jako v CSV

3. **Středníkový CSV**
   - Soubor → Import → vyberte `produkty_semicolon.csv`
   - Oddělovač: středník
   - Běžný formát v České republice

### Cvičení 2: Export do různých formátů
1. Po importu přidejte sloupec "Cena s DPH"
2. Použijte vzorec: `=C2*(1+D2/100)`
3. Exportujte postupně jako:
   - CSV (pouze aktuální list)
   - TSV (pouze aktuální list)
   - Excel (.xlsx)

### Cvičení 3: Podmíněné formátování
1. Vyberte sloupec "Skladem"
2. Formát → Podmíněné formátování
3. Pravidlo: Je rovno 0
4. Styl: Červené pozadí
5. Produkty bez skladu budou zvýrazněny

### Cvičení 5: Základní vzorce
1. Přidejte řádek "Celkem" na konec
2. Použijte funkce:
   - `=SUM(E2:E6)` pro celkový počet kusů
   - `=AVERAGE(C2:C6)` pro průměrnou cenu
   - `=COUNTIF(E2:E6,0)` pro počet vyprodaných položek