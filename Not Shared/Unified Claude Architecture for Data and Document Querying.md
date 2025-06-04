# Unified Claude Architecture for Data and Document Querying

## Key Abbreviations
- **API**: Application Programming Interface
- **SQL**: Structured Query Language
- **Claude Project Docs**: Native document upload to Claude (not a vector database)

## Core Unified Workflow

```mermaid
graph TD
    A[User Question] --> B[Schema Knowledge Lookup]
    B --> C{Available Schemas?}
    
    C -->|Database Schema| D[SQL Query Planning]
    C -->|API Schema| E[API Query Planning]
    C -->|Both| F[Multi-Source Query Planning]
    
    D --> G[SQL Query Execution]
    E --> H[API Call Execution]
    F --> I[Parallel Query Execution]
    
    G --> J[Live Database Results]
    H --> K[Live API Results]
    I --> L[Combined Live Results]
    
    J --> M[Claude Processing]
    K --> M
    L --> M
    
    M --> N[Response with Live Data]
    
    subgraph "Claude Project Documents (Schema Only)"
        P[Database Schemas]
        Q[API Documentation]
        R[Query Patterns]
        S[Metadata Descriptions]
    end
    
    B --> P
    B --> Q
    B --> R
    B --> S
```

---

## Document vs Data Clarification

### Claude Project Documents (Schema/Metadata Only)
- **Contains**: Database schemas, metadata descriptions, query patterns
- **Does NOT Contain**: Actual customer data, order records, etc.
- **Purpose**: Helps Claude understand what data exists and how to query it
- **Examples**: `customer_db_schema.md`, `order_system_metadata.json`

### Actual Data (Retrieved via Queries)
- **Source**: Live databases (DynamoDB, MongoDB, RDS, etc.)
- **Access**: Claude generates and executes queries based on schema knowledge
- **Real-time**: Always current data, not static documents
- **Examples**: Actual customer records, current order status, live metrics

**Our Approach**: Claude Project Documents contain the "map" (schemas/metadata), queries retrieve the "treasure" (actual data).

---

## Single Architecture Implementation

**Use Case**: One system handles all data and document queries using metadata intelligence

```mermaid
graph TD
    A[User Query] --> B[Query Analyzer]
    B --> C[Schema Knowledge Lookup]
    
    C --> D{Available Data Sources}
    
    D -->|DB Schema Found| E[Database Query Path]
    D -->|API Schema Found| F[API Query Path] 
    D -->|Multiple Schemas| G[Multi-Source Query Path]
    
    E --> H[SQL Query Generation]
    F --> I[API Call Generation]
    G --> J[Multi-Query Generation]
    
    H --> K[Database Execution]
    I --> L[API Execution]
    J --> M[Parallel Execution]
    
    K --> N[Live Database Results]
    L --> O[Live API Results]
    M --> P[Combined Live Results]
    
    N --> Q[Claude API Call]
    O --> Q
    P --> Q
    
    Q --> R[Response with Live Data]
    
    subgraph "Claude Project Documents (Schema/Metadata Only)"
        S[Database Schemas]
        T[API Documentation]
        U[Query Templates]
        V[Business Logic Rules]
    end
    
    subgraph "Live Data Sources"
        W[(Application DBs)]
        X[External APIs]
    end
    
    C --> S
    C --> T
    C --> U
    C --> V
    
    K --> W
    L --> X
    M --> W
    M --> X
```

---

## Metadata Database Structure

**Purpose**: Single source of truth for all available data and document sources

```mermaid
graph TD
    A[Metadata Database] --> B[Schema Registry]
    A --> C[Document Catalog]
    A --> D[Source Relationships]
    
    B --> E[Table Definitions]
    B --> F[Column Metadata]
    B --> G[Business Rules]
    
    C --> H[Document Types]
    C --> I[Content Summaries]
    C --> J[Access Patterns]
    
    D --> K[DB-to-Doc Links]
    D --> L[Cross-Reference Maps]
    D --> M[Query Routing Rules]
```

**Sample Metadata Structure**:
- **Tables**: `customers`, `orders`, `products` (with full schema)
- **Documents**: `customer_policies.pdf`, `order_procedures.doc` (with summaries)
- **Relationships**: Customer questions → check both `customers` table AND `customer_policies.pdf`

---

## Query Processing Flow

### Step 1: Question Analysis
```mermaid
graph LR
    A[User Question] --> B[Extract Entities]
    B --> C[Identify Intent]
    C --> D[Metadata Lookup]
    
    D --> E{Source Match}
    E -->|Table Match| F[Structured Query]
    E -->|Document Match| G[Document Reference]
    E -->|Both Match| H[Hybrid Approach]
```

### Step 2: Context Assembly Based on Metadata
```mermaid
graph TD
    A[Matched Sources] --> B{Query Type}
    
    B -->|Database Query| C[Schema Context]
    C --> D[Table relationships, Column types, Business rules]
    
    B -->|Document Query| E[Document Context]  
    E --> F[Document names, Content summaries, Relevance to query]
    
    B -->|Hybrid Query| G[Combined Context]
    G --> H[Schema + Document metadata + Cross-references]
    
    D --> I[Context for Claude]
    F --> I
    H --> I
```

### Step 3: Single Claude Call with Smart Context
```mermaid
graph TD
    A[Assembled Context] --> B[Claude API Call]
    B --> C{Processing Mode}
    
    C -->|SQL Mode| D[Generate and execute SQL]
    C -->|Document Mode| E[Reference project documents]
    C -->|Hybrid Mode| F[Execute query + reference docs]
    
    D --> G[Database Results]
    E --> H[Document Content]
    F --> I[Combined Results]
    
    G --> J[Format Response]
    H --> J
    I --> J
    
    J --> K[Final Answer with Citations]
```

---

## Example Metadata Entries

### Database Schema Entry
```json
{
  "source_type": "database",
  "source_id": "customer_db",
  "tables": {
    "customers": {
      "columns": ["id", "name", "email", "created_date"],
      "business_context": "Customer master data",
      "relationships": ["orders.customer_id"]
    }
  },
  "query_patterns": [
    "customer information",
    "customer details", 
    "account data"
  ]
}
```

### Document Catalog Entry
```json
{
  "source_type": "document",
  "source_id": "customer_handbook",
  "content_summary": "Customer service policies and procedures",
  "document_type": "policy",
  "topics": ["customer service", "support procedures", "escalation"],
  "related_entities": ["customers", "support_tickets"]
}
```

### Cross-Reference Entry
```json
{
  "query_pattern": "customer support process",
  "sources": [
    {"type": "database", "tables": ["customers", "support_tickets"]},
    {"type": "document", "files": ["customer_handbook.pdf", "support_procedures.doc"]}
  ],
  "strategy": "combine_structured_and_policy_data"
}
```

---

## Implementation Benefits

### Single Point of Intelligence
- One Claude instance handles all query types
- Unified response format regardless of source
- Consistent citation and reference handling

### Metadata-Driven Routing
- No hardcoded query logic
- Easy to add new data sources
- Self-documenting system through metadata

### Adaptive Query Strategy
- Automatically chooses best approach based on available sources
- Falls back gracefully when sources unavailable
- Learns from query patterns over time

---

## Query Examples

**Question**: "What's our top customer's support history?"

**Schema Knowledge Lookup**: 
- References `customer_db_schema.md` (uploaded to Claude project)
- References `support_system_api.md` (uploaded to Claude project)
- Finds schema for `customers` table and `support_tickets` API

**Query Generation**:
```
Schema Knowledge: customers(id, name, revenue), support_tickets API(customer_id, issue, status)
Business Rules: "Top customer" = highest revenue in current year
Query Plan: 1) SQL to find highest revenue customer, 2) API call for their support tickets
```

**Live Data Retrieval**: 
1. Executes SQL query against live customer database
2. Makes API call to support system with customer ID
3. Gets actual current data (not cached/static information)

**Claude Processing**: 
1. Combines live customer data with live support ticket data
2. References schema documentation for context and business rules
3. Provides comprehensive answer with current, real data

---

## Architecture Advantages

| Aspect | Benefit |
|--------|---------|
| **Simplicity** | Single workflow handles all query types |
| **Intelligence** | Metadata drives smart source selection |
| **Flexibility** | Easy to add new databases or documents |
| **Consistency** | Uniform response format and citations |
| **Efficiency** | One Claude call per query regardless of complexity |
| **Maintenance** | Centralized metadata makes system self-documenting |