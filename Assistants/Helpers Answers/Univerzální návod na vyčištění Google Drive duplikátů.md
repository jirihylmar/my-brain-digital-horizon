# Univerzální návod na vyčištění Google Drive duplikátů


```yaml
Author: :person_jirihylmar
Updated: 2025-05-26T00:00:00Z
Purpose:
- Google Drive Sync
Keywords:
- Google Drive
```

## Diagnostický checklist

### 1. Zjištění stavu mapování
```bash
# Zobraz všechny Drive složky v home
ls -la ~/ | grep -i drive

# Zkontroluj mount pointy
mount | grep -i drive

# Zkontroluj symlinky
find ~/ -maxdepth 1 -type l -name "*rive*"
```

### 2. Analýza obsahu jednotlivých mapování
```bash
# Pro každou nalezenou složku spusť:
ls -la "~/NAZEV_SLOZKY"
du -sh "~/NAZEV_SLOZKY"

# Příklady běžných názvů:
# "My Drive"
# "Google Drive" 
# "My Drive (email@domain.com)"
```

### 3. Kontrola Google Drive aplikace
```bash
# Zkontroluj běžící procesy
ps aux | grep -i "google drive"

# Zkontroluj v menu baru:
# Google Drive ikona → Preferences → Google Drive → Folder location
```

### 4. My Mac sync kontrola
```bash
# Zkontroluj Desktop a Documents sync
ls -la ~/Desktop
ls -la ~/Documents

# Ověř iCloud Drive status
brctl status

# Zkontroluj Dropbox (pokud nainstalován)
ls -la ~/Dropbox 2>/dev/null || echo "Dropbox není nainstalován"

# Zkontroluj OneDrive (pokud nainstalován)  
ls -la ~/OneDrive* 2>/dev/null || echo "OneDrive není nainstalován"
```

## Bezpečný postup vyčištění

### Krok 1: Identifikace legitimních složek
```bash
# Legitimní struktura obvykle obsahuje:
# ~/Google Drive (symlink na CloudStorage)
# ~/My Drive (email@domain.com) (uživatelská data)

# Duplikáty k odstranění:
# ~/My Drive (bez emailu)
# ~/Google Drive (pokud není symlink)
# Starší verze s jinými emaily
```

### Krok 2: Záloha před změnami
```bash
# Vytvoř seznam všech Drive složek
ls -la ~/ | grep -i drive > ~/drive_folders_backup.txt

# Zkopíruj důležité soubory mimo Drive strukturu
cp -r "~/NAZEV_DUPLICITNI_SLOZKY/dulezite_soubory" ~/Desktop/drive_backup/
```

### Krok 3: Odpojení v aplikaci
1. Otevři Google Drive v menu baru
2. Klikni na **ozubené kolečko** → **Preferences**
3. V záložce **Google Drive** zkontroluj **Folder location**
4. Ponech pouze cestu s emailem: `~/My Drive (váš@email.com)`
5. Odpoj ostatní mapování

### Krok 4: Odstranění duplikátů
```bash
# POZOR: Spusť pouze po odpojení v aplikaci

# Smaž duplicitní složky (bez emailu v názvu)
rm -rf ~/My\ Drive  # pouze pokud existuje verze s emailem

# Zkontroluj symlinky před smazáním
ls -la ~/Google\ Drive
# Pokud NENÍ symlink a existuje lepší verze:
# rm -rf ~/Google\ Drive

# Alternativní syntaxe pro složky s mezerami
rm -rf "$HOME/My Drive"
rm -rf "$HOME/Google Drive"
```

## Univerzální příkazy pro kontrolu

### Rychlá diagnostika
```bash
# Jednořádkový přehled všech cloud storage
echo "=== GOOGLE DRIVE ===" && ls -la ~/ | grep -i "drive" && \
echo "=== ICLOUD ===" && ls -la ~/ | grep -i "icloud" && \
echo "=== DROPBOX ===" && ls -la ~/ | grep -i "dropbox" && \
echo "=== ONEDRIVE ===" && ls -la ~/ | grep -i "onedrive"
```

### Kontrola velikostí
```bash
# Porovnání velikostí všech Drive složek
for dir in ~/*[Dd]rive*; do
    if [ -d "$dir" ]; then
        echo "$(du -sh "$dir" 2>/dev/null | cut -f1) - $(basename "$dir")"
    fi
done
```

### Validace po vyčištění
```bash
# Ověř finální stav
echo "Zbývající Drive složky:"
ls -la ~/ | grep -i drive

echo "Mount pointy:"
mount | grep -i drive

echo "Google Drive procesy:"
ps aux | grep -i "google drive" | grep -v grep
```

## Troubleshooting

### Problém: Složka se nesmaže
```bash
# Zkontroluj oprávnění
ls -la ~/
# Zkontroluj, zda není připojená
lsof +D "~/NAZEV_SLOZKY"
# Vypni Google Drive a zkus znovu
```

### Problém: Ztráta dat
```bash
# Zkontroluj koš Google Drive
ls -la "~/Google Drive/.Trash" 2>/dev/null
# Zkontroluj lokální koš
ls -la ~/.Trash
```

### Problém: Synchronizace nefunguje
```bash
# Restart Google Drive
killall "Google Drive"
open "/Applications/Google Drive.app"

# Zkontroluj síťové připojení
ping -c 3 drive.google.com
```

## Preventivní opatření

1. **Při reinstalaci**: Vždy smaž staré konfigurace před novou instalací
2. **Monitoring**: Pravidelně kontroluj duplicitní složky pomocí `ls -la ~/ | grep -i drive`
3. **Backup**: Před velkými změnami vytvoř zálohu důležitých dat
4. **Dokumentace**: Veď si záznam o tom, které aplikace synchronizují data