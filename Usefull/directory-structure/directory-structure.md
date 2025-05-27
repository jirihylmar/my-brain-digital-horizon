# Struktura složky Brain Digital Horizon

## Workflow práce se složkami

```mermaid
flowchart TD
    A[service-brain-digital-horizon<br/>Sdilena slozka od lektora] -->|Pridat na My Drive| B[jmeno-brain-digital-horizon<br/>Vlastni slozka na Google Drive]
    
    A -->|Kopirovat materialy| B
    
    B -->|Synchronizace offline| C[Lokalni slozka<br/>/Users/NazevPocitace/Documents/<br/>jmeno-brain-digital-horizon]
    
    C -->|Sdilet s lektory| D[Spoluprace<br/>hylmar@brainmarket.cz<br/>orcik@brainmarket.cz]
    
    C --> E[Assistants<br/>Helper nastroje a instrukce]
    C --> F[Files Samples<br/>Vzorove soubory]
    C --> G[Usefull<br/>Uzitecne materialy]
    C --> H[WORKSPACE<br/>Aktualni projekty podle dat]
    
    H -->|Organizace podle data| I[2025-05-23<br/>Konkretni lekce/projekt]
    
    I --> J[Podklady Varianta A]
    I --> K[Podklady Varianta B]
    
    style A fill:#e1f5fe
    style B fill:#f3e5f5
    style C fill:#e8f5e8
    style H fill:#fff3e0
```

## Lokální struktura složky

```
/Users/
{NazevPocitace}/
Documents/
{JmenoPredZavinacemFiremnihoEmailu}-brain-digital-horizon/

Assistants/
  Helpers Answers/
    Essential Mac Shortcuts.md
    GitHub Command Cheatsheet.md
    Hlavní funkce Finderu v macOS.md
    Základní klávesové zkratky na Macu.md
  Helpers Instructions LLM/
    Instrukce LLM zpracování odpovědí v rámci lekcí DH v.02.md

Files Samples/
  sample animated.gif
  sample geojson.json
  sample kosovo.svg
  sample.zip

Usefull/
  mailing-list.txt

WORKSPACE/
  2025-05-23/
    Podklady Varianta A/
      POSTUP_ Jak evidovat majetek.docx
      POSTUP_ Jak evidovat majetek.txt
    Podklady Varianta B/
      reference.md
```

## Popis složek

### Assistants
- **Helpers Answers**: Připravené odpovědi, cheatsheets, návody
- **Helpers Instructions LLM**: Instrukce pro práci s AI asistenty

### Files Samples
- Vzorové soubory různých formátů (GIF, JSON, SVG, ZIP)
- Pro testování a ukázky

### Usefull
- Užitečné materiály jako kontakty, seznamy

### WORKSPACE
- Hlavní pracovní prostor organizovaný podle dat
- Každá lekce/projekt má vlastní podsložku
- Obsahuje varianty řešení (A, B, C...)

## Klíčové kontakty

- **hylmar@brainmarket.cz** - sdílení práce
- **orcik@brainmarket.cz** - sdílení práce

## Odkazy

![Drive Local Settings](/Users/jirihylmar/Documents/my-brain-digital-horizon/Usefull/directory-structure/image_drive_local_settings.png)

![Drive Cloud](/Users/jirihylmar/Documents/my-brain-digital-horizon/Usefull/directory-structure/image_drive_cloud.png){width=50%}
