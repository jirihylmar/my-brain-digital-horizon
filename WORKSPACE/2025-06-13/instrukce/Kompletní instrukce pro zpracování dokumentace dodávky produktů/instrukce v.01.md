# Kompletní instrukce pro zpracování dokumentace dodávky produktů

## 1. ÚVODNÍ ČÁST

### 1.1 Popis úkolu
Zpracování kompletní dokumentace k dodávce produktů zahrnující:
- Kontrolní zprávu porovnávající obchodní dokumenty
- Strukturovaná data pro vytvoření produktové etikety
- Metadata pro oba výstupní dokumenty
- readme pro uložení souborů

### 1.2 Struktura vstupu
```
.
├── podklady
│   └── [datum] [projekt]
│       ├── nabidka.pdf
│       ├── faktura.pdf
│       ├── dodací list.pdf
│       └── specifikace produktu.pdf
```
### 1.3 Požadované vstupní dokumenty
**Povinné:**
- Datum
- Název projektu
- Jmého autora
- **Nabídka** - obsahuje nabízené produkty, ceny, podmínky
- **Faktura** - účetní doklad s fakturovanými položkami  
- **Dodací list** - seznam skutečně dodaného zboží
- **Specifikace produktu** - technické údaje, složení, nutriční hodnoty

**Volitelné:**
- **Originální etiketa** - pro kontrolu shody
- **Požadavky na etiketu** - rozměry, certifikace

### 1.4 Způsob uložení výstupů
```
výsledky/
└── [datum] [projekt]/
    ├── documents/
    │   └── [UUID-1]/
    │       ├── kontrolní zpráva [datum] [projekt].md
    │       └── kontrolní zpráva [datum] [projekt].md.metadata.json
    └── datasets/
        └── [UUID-2]/
            ├── etiketa podklady [datum] [projekt].tsv
            └── etiketa podklady [datum] [projekt].tsv.metadata.json
```

### 1.5 UUID generování
Použít formát: `xxxxxxxx-xxxx-4xxx-axxx-xxxxxxxxxxxx`
- Každý dokument má své unikátní UUID
- UUID musí být konzistentní mezi dokumentem a jeho metadaty

---

## 2. KONTROLNÍ ZPRÁVA

### 2.1 Struktura dokumentu

#### Záhlaví (povinné)
```
KONTROLNÍ ZPRÁVA DODÁVKY
UUID: [vygenerované UUID]
Autor: [jméno autora]
Projekt: [název projektu]
Datum: [RRRR-MM-DD]
Cesta: výsledky/[datum] [projekt]/documents/[UUID]/kontrolní zpráva [datum] [projekt].md
```

#### Sekce 1: SROVNÁNÍ NABÍDKY A FAKTURY
Tabulková forma srovnání:
```
| Parametr           | Nabídka    | Faktura    | Shoda |
|--------------------|------------|------------|-------|
| Produkt            | [hodnota]  | [hodnota]  | ANO/NE|
| Objem/velikost     | [hodnota]  | [hodnota]  | ANO/NE|
| Cena za jednotku   | [hodnota]  | [hodnota]  | ANO/NE|
| Množství           | [hodnota]  | [hodnota]  | ANO/NE|
| Doprava            | [hodnota]  | [hodnota]  | ANO/NE|
| Dodatečné poplatky | [hodnota]  | [hodnota]  | ANO/NE|
```

#### Sekce 2: PŘEPOČET CEN PRO SROVNÁNÍ
**Textový popis:**
- Detailní vysvětlení výpočtů pro každý produkt
- Převod na srovnatelné jednotky

**Výpočty:**
```
Jednotková cena = Cena balení ÷ Počet kusů v balení
Cena za ml/g = Jednotková cena ÷ Objem/hmotnost
Celková cena = Jednotková cena × Celkové množství
```

**Srovnávací tabulka:**
```
| Parametr              | Nabídka  | Faktura  | Rozdíl |
|-----------------------|----------|----------|---------|
| Cena za kus           | [€ X.XX] | [€ X.XX] | [+/- €] |
| Cena za ml/g          | [€ X.XX] | [€ X.XX] | [+/- €] |
| Celkem za X kusů      | [€ XXX]  | [€ XXX]  | [+/- €] |
```

#### Sekce 3: SROVNÁNÍ FAKTURY A DODACÍHO LISTU
```
| Parametr              | Faktura   | Dodací list | Shoda |
|-----------------------|-----------|-------------|-------|
| Produkt               | [hodnota] | [hodnota]   | ANO/NE|
| Počet kusů/kartonů    | [hodnota] | [hodnota]   | ANO/NE|
| Počet palet           | [hodnota] | [hodnota]   | ANO/NE|
```

#### Sekce 4: ZJIŠTĚNÉ NESROVNALOSTI
```
1. KRITICKÁ NESROVNALOST: [popis zásadního rozporu]
2. Menší nesrovnalost: [popis drobného rozdílu]
```

#### Sekce 5: DOPORUČENÍ
```
1. [Konkrétní akční krok]
2. [Konkrétní akční krok]
```

#### Sekce 6: NÁVRH EMAILU DODAVATELI
```
Subject: Clarification Required - Order [číslo] / Invoice [číslo]

Dear [Supplier] Team,

We have received the shipment for order [číslo] and identified discrepancies:

1. **[Typ nesrovnalosti]**: [popis]
2. **[Typ nesrovnalosti]**: [popis]

Could you please:
- [Konkrétní požadavek]
- [Konkrétní požadavek]

Best regards,
[Podpis]
```

#### Sekce 7: POUŽITÉ ZDROJOVÉ DOKUMENTY
```
- podklady/[datum] [projekt]/nabidka.pdf
- podklady/[datum] [projekt]/faktura.pdf
- podklady/[datum] [projekt]/dodací list.pdf
- podklady/[datum] [projekt]/specifikace produktu.pdf
```

### 2.2 Pravidla zpracování

**Formátování:**
- Čistý text bez formátování
- Tabulky v ASCII formátu
- Sekce oddělené ====
- Hodnoty ANO/NE/N/A v tabulkách

**Číselné hodnoty:**
- Měna před číslem: €100
- Tisíce s čárkou: 1,000
- Desetinná místa tečkou: 0.50

**Jazyky:**
- Zpráva v češtině
- Email v angličtině
- Zachovat původní názvy

### 2.3 Metadata
Viz sekce 4.1

---

## 3. PODKLAD PRO ETIKETU

### 3.1 Struktura TSV souboru

TSV soubor obsahuje 3 sloupce oddělené tabulátorem v následujícím formátu:
```
pole[TAB]popis[TAB]hodnota
```

### 3.2 Obsah TSV souboru

```
pole	popis	hodnota
nazev_produktu	Hlavní název produktu na etiketě	[vyplnit]
podtitul	Doplňkový název/varianta produktu	[vyplnit]
objem	Objem/hmotnost balení včetně jednotky	[vyplnit]
typ_produktu	Kategorie produktu	[vyplnit]
slogan	Marketingový slogan/claim	[vyplnit]
usp	Unique selling points oddělené svislítkem	[vyplnit]
certifikaty	Seznam certifikací oddělený svislítkem	[vyplnit]
distributor	Úplné údaje distributora včetně adresy	[vyplnit]
vyrobce	Úplné údaje výrobce včetně adresy	[vyplnit]
dovozce	Údaje dovozce (pokud je relevantní)	[vyplnit]
hmotnost_netto	Čistá hmotnost/objem s ℮ značkou	[vyplnit]
davkovani	Doporučené dávkování/užívání	[vyplnit]
pocet_davek	Počet dávek v balení	[vyplnit]
nutricni_hodnoty_100ml	Nutriční hodnoty na 100ml oddělené svislítkem	[vyplnit]
slozeni	Kompletní seznam ingrediencí v sestupném pořadí	[vyplnit]
alergeny	Alergenní látky a upozornění na křížovou kontaminaci	[vyplnit]
aktivni_latky_davka	Aktivní látky na dávku s množstvím a % RHP	[vyplnit]
rhp_vysvetlivka	Vysvětlivka k RHP	[vyplnit]
upozorneni	Zdravotní upozornění a varování	[vyplnit]
skladovani	Podmínky skladování	[vyplnit]
minimalni_trvanlivost	Formát a umístění data minimální trvanlivosti	[vyplnit]
material_obalu	Materiál lahvičky/obalu s kódem	[vyplnit]
material_etikety	Materiál etikety s kódem	[vyplnit]
recyklacni_znacky	Recyklační symboly a kódy	[vyplnit]
carovy_kod	EAN kód produktu	[vyplnit]
sarze	Umístění čísla šarže na obalu	[vyplnit]
jazyk_etikety	Jazyk textu na etiketě	[vyplnit]
web	Webové stránky	[vyplnit]
kontakt	Kontaktní email nebo telefon	[vyplnit]
registracni_cislo	Registrační číslo doplňku stravy	[vyplnit]
cesta_ulozeni	Cesta k uložení souboru v systému	[vyplnit]
```

### 3.3 Pravidla vyplňování

**Formátování hodnot:**
- Více hodnot oddělit: hodnota1 | hodnota2 | hodnota3
- Zachovat původní názvy látek ze specifikace
- Vždy uvádět jednotky za hodnotou

**Příklady formátů:**
```
Nutriční hodnoty: Energie: 124 kJ / 30 kcal | Tuky: 0 g | Sacharidy: 0.01 g
Aktivní látky: L-Citrulin: 6000 mg | Kofein: 100 mg | Vitamín C: 90 mg (113% RHP)
Certifikáty: VEGAN | GLUTEN-FREE | LAB-TESTED
```

**Převody jednotek:**
- 1000 mg → 1 g
- 1000 µg → 1 mg  
- Case/12 → 12 ks

### 3.4 Metadata
Viz sekce 4.2

---

## 4. STRUKTURA METADAT

### 4.1 Metadata pro kontrolní zprávu

```json
{
  "id": "[UUID dokumentu - stejné jako v záhlaví zprávy]",
  
  "Attributes": {
    "_authors": ["jméno autora"],
    "_category": ["document", "small file"],
    "_created_at": "[ISO 8601 timestamp]",
    "_data_source_id": "s3://vysledky/[datum]-[projekt]/documents/[UUID]/kontrolni-zprava-[datum]-[projekt].md",
    "_document_title": "Kontrolni zprava [datum] [projekt]",
    "_file_type": "md",
    "_language_code": "cs",
    "_last_updated_at": "[ISO 8601 timestamp]",
    "_source_uri": "https://storage.example.com/vysledky/[datum]-[projekt]/documents/[UUID]/kontrolni-zprava-[datum]-[projekt].md",
    
    "dc_title": "Kontrolní zpráva dodávky [projekt] [datum]",
    "dc_type": "Text",
    "dc_abstract": "Kontrolní zpráva porovnávající údaje mezi nabídkou, fakturou, dodacím listem a specifikací produktu [název]. Dokument identifikuje nesrovnalosti a poskytuje doporučení.",
    "additional_languages": ["en"],
    "dc_subject": [
      "kontrola dodávky",
      "[název dodavatele]",
      "[název produktu]",
      "porovnání dokumentů",
      "[oblast podnikání]",
      "kvalita dodávky"
    ],
    "dc_rights_holder": "[název společnosti]",
    "dc_license": "copyright",
    "dc_accrual_method": "creation",
    "dc_source": null,
    "dc_relation": [
      "[URL nabídky]",
      "[URL faktury]",
      "[URL dodacího listu]",
      "[URL specifikace]",
      "[URL TSV etikety]"
    ],
    "dc_has_format": null,
    "dc_is_format_of": null,
    "dc_has_part": null,
    "dc_is_part_of": null
  },
  
  "Title": "Kontrolni zprava [datum] [projekt]",
  "ContentType": "DOCX",
  "SK": "#jmenoautora#cs#kontrolni_zprava_[datum]_[projekt]"
}
```

### 4.2 Metadata pro TSV etiketu

```json
{
  "id": "[UUID datasetu]",
  
  "Attributes": {
    "_authors": ["jmého autora"],
    "_category": ["dataset", "small file"],
    "_created_at": "[ISO 8601 timestamp]",
    "_data_source_id": "s3://vysledky/[datum]-[projekt]/datasets/[UUID]/etiketa-podklady-[datum]-[projekt].tsv",
    "_document_title": "Etiketa podklady [datum] [projekt]",
    "_file_type": "tsv",
    "_language_code": "cs",
    "_last_updated_at": "[ISO 8601 timestamp]",
    "_source_uri": "https://storage.example.com/vysledky/[datum]-[projekt]/datasets/[UUID]/etiketa-podklady-[datum]-[projekt].tsv",
    
    "dc_title": "Datová struktura pro etiketu [název produktu]",
    "dc_type": "Dataset",
    "dc_abstract": "Strukturovaná data obsahující všechny potřebné informace pro vytvoření etikety produktu [název]. Dataset zahrnuje texty, nutriční hodnoty, složení, certifikace a technické parametry.",
    "additional_languages": ["en"],
    "dc_subject": [
      "etiketa produktu",
      "[název produktu]",
      "nutriční hodnoty",
      "složení produktu",
      "doplněk stravy",
      "označování potravin",
      "[název výrobce]"
    ],
    "dc_rights_holder": "[název společnosti]",
    "dc_license": "copyright",
    "dc_accrual_method": "creation",
    "dc_source": null,
    "dc_relation": [
      "[URL specifikace]",
      "[URL faktury]",
      "[URL kontrolní zprávy]"
    ],
    "dc_has_format": null,
    "dc_is_format_of": null,
    "dc_has_part": null,
    "dc_is_part_of": null
  },
  
  "Title": "Etiketa podklady [datum] [projekt]",
  "ContentType": "TSV",
  "SK": "#jmenoautora#cs#etiketa_podklady_[datum]_[projekt]"
}
```

### 4.3 Pravidla pro metadata

**Povinná pole:**
- Všechna pole označená v šabloně musí být vyplněna
- UUID musí odpovídat názvu složky a být konzistentní
- Timestamp ve formátu ISO 8601: `2025-06-13T10:44:58.993498Z`

**Kategorie velikosti:**
- `small file` - do 10 MB
- `medium file` - 10-100 MB  
- `big file` - nad 100 MB

**Jazykové kódy:**
- `cs` - čeština
- `en` - angličtina
- `sk` - slovenština

**SK klíč:**
- Formát: `#{jazyk}#{název_podtržítky}`
- Bez diakritiky, malá písmena
- Mezery nahradit podtržítky

## 5. README PRO ULOŽENÍ SOUBORŮ

Vynerovan0 soubory uložte do následujících umístění.

./{cesta 1}
./{cesta 2}
./{cesta 3}
./{cesta 4}
./výsledky/[datum] [projekt]/README.md

Autor: {Jmého Autora}
Datum a čas zpracování: {ts8601}
Verze jazykového modelu: {verze jazykového modelu}

---

## KONTROLNÍ SEZNAM

### Před zpracováním:
- [ ] Všechny vstupní dokumenty jsou k dispozici
- [ ] Je jasné datum a název projektu

### Kontrolní zpráva:
- [ ] UUID vygenerováno a použito ve všech místech
- [ ] Všech 7 sekcí vyplněno
- [ ] Tabulky používají ANO/NE
- [ ] Přepočty obsahují text i tabulku
- [ ] Email je v angličtině
- [ ] Cesta odpovídá struktuře

### TSV etiketa:
- [ ] Všech 31 polí vyplněno
- [ ] Hodnoty odpovídají specifikaci
- [ ] Jednotky správně převedeny
- [ ] Více hodnot odděleno |
- [ ] Cesta odpovídá struktuře

### Metadata:
- [ ] UUID odpovídá složce dokumentu
- [ ] Všechna povinná pole vyplněna
- [ ] dc_relation obsahuje správné odkazy
- [ ] Timestamp je aktuální
- [ ] SK klíč správně naformátován

### Finální kontrola:
- [ ] 4 soubory vytvořeny
- [ ] readme s cestami pro uložení souboru vyrvořen
- [ ] Struktura složek dodržena
- [ ] Názvy souborů konzistentní
- [ ] Reference mezi dokumenty správné