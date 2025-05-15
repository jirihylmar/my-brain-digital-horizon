# My Brain Digital Horizon

Vítejte v repozitáři kurzu Digitální Horizont - Fenomenologie moderních technologií. Tento repozitář slouží jako centrální centrum pro materiály kurzu, ukázkové skripty a váš osobní pracovní prostor.

## Struktura repozitáře

```
my-brain-digital-horizon/
├── README.md                     # Hlavní dokumentace
├── LICENSE                       # Licence repozitáře
├── Files Samples/                # POUZE KE ČTENÍ Kolekce různých formátů souborů pro testování
├── Files Tests/                  # Vaše pracovní oblast pro testování souborů
├── Helpers Answers/              # Referenční příručky a přehledové listy
├── Helpers Instructions LLM/     # Instrukce pro zpracování pomocí LLM
├── Sessions My Notes/            # Oblast pro vaše osobní poznámky
├── system_scripts/               # POUZE KE ČTENÍ Ukázkové skripty v různých jazycích
└── system_tools/                 # POUZE KE ČTENÍ Nástroje a ověřovací utility
```

## Začínáme pro uživatele macOS

### Předpoklady

Před začátkem práce s materiály kurzu se ujistěte, že máte nainstalované následující:

1. **Zkontrolujte, zda je nainstalován Git**:
   ```bash
   git --version
   ```
   
   Pokud není nainstalován, máte dvě možnosti:
   - Instalace z oficiálních stránek: [git-scm.com](https://git-scm.com/download/mac)
   - Instalace Command Line Tools (včetně Gitu): 
     ```bash
     xcode-select --install
     ```

2. **Terminál**:
   - Terminál je předinstalován v macOS (Aplikace → Utility → Terminál)
   - Nebo použijte Spotlight (Cmd + Space) a vyhledejte "Terminál"

### Klonování repozitáře

```bash
# Přejděte do složky Dokumenty (doporučené umístění)
cd ~/Documents

# Klonujte repozitář
git clone https://github.com/jirihylmar/my-brain-digital-horizon.git

# Vstupte do adresáře repozitáře
cd my-brain-digital-horizon
```

### Konfigurace Gitu

Nastavte svou identitu pro Git commity:

```bash
git config --global user.name "Vaše Jméno"
git config --global user.email "vas.email@example.com"
```

### Ověření vašeho nastavení

Spusťte skript pro kontrolu prostředí:

```bash
bash ~/Documents/my-brain-digital-horizon/system_tools/check_environment.sh
```

## Práce s repozitářem

### Důležité pokyny

1. Ujistěte se, že pravidelně stahujete nejnovější aktualizace:
   ```bash
   git pull
   ```

2. Ukládejte své osobní poznámky do adresáře `Sessions My Notes`.

3. Můžete experimentovat s různými typy souborů pomocí příkladů v `Files Samples`.

4. Použijte `Files Tests` pro vaše vlastní cvičení s testováním souborů.

### Ukázkové skripty

Repozitář obsahuje ukázkové skripty v různých programovacích jazycích:

#### Shell skripty (system_scripts/shell/)

1. **hello.sh** - Jednoduchý skript "Hello World":

```bash
#!/bin/bash
echo "Hello, Digital Horizon!"
echo "This is a sample shell script."
```

2. **data_processor.sh** - Skript pro zpracování textových souborů:

```bash
#!/bin/bash

# Zobrazení uvítací zprávy
echo "=========================================="
echo "Digital Horizon Data Processor"
echo "=========================================="

# Kontrola, zda je zadán vstupní soubor
if [ -z "$1" ]; then
    echo "Error: No input file specified"
    echo "Usage: ./data_processor.sh <input_file>"
    exit 1
fi

# Kontrola, zda soubor existuje
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found"
    exit 1
fi

# Zpracování souboru
echo "Processing file: $1"
echo "----------------------------------------"

# Počítání řádků
line_count=$(wc -l < "$1")
echo "Line count: $line_count"

# Počítání slov
word_count=$(wc -w < "$1")
echo "Word count: $word_count"

# Kontrola typu souboru
file_extension="${1##*.}"
echo "File type: $file_extension"

echo "----------------------------------------"
echo "Processing complete!"
echo "=========================================="
```

Pro spuštění těchto skriptů:

```bash
# Nastavení skriptů jako spustitelných
chmod +x system_scripts/shell/hello.sh
chmod +x system_scripts/shell/data_processor.sh

# Spuštění skriptů
./system_scripts/shell/hello.sh
./system_scripts/shell/data_processor.sh README.md
```

#### Python skripty (system_scripts/python/)

1. **hello.py** - Jednoduchý Python hello world skript:
2. **csv_analyzer.py** - Skript pro analýzu CSV souborů:

Pro spuštění těchto skriptů:

```bash
python3 system_scripts/python/hello.py
python3 system_scripts/python/csv_analyzer.py Files\ Samples/sample.csv
```

#### JavaScript skripty (system_scripts/javascript/)

1. **hello.js** - Jednoduchý JavaScript hello skript:
2. **data_visualizer.js** - Základní skript pro vizualizaci dat:

Pro spuštění těchto skriptů:

```bash
node system_scripts/javascript/hello.js
node system_scripts/javascript/data_visualizer.js
```

## Nastavení prostředí a ověření

Skript pro kontrolu prostředí (system_tools/setup/check_environment.sh) ověřuje, že je vaše prostředí správně nastaveno.

### Použití ukázkových souborů

Adresář `Files Samples` obsahuje příklady různých formátů souborů, které můžete použít pro testování.
