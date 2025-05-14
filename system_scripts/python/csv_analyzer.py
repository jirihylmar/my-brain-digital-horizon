#!/usr/bin/env python3
# File path: system_scripts/python/csv_analyzer.py

import sys
import csv

def analyze_csv(file_path):
    """Analyze a CSV file and print basic statistics."""
    try:
        with open(file_path, 'r', newline='') as csv_file:
            # Try to detect the dialect
            dialect = csv.Sniffer().sniff(csv_file.read(1024))
            csv_file.seek(0)
            
            # Create CSV reader
            reader = csv.reader(csv_file, dialect)
            
            # Read headers
            headers = next(reader)
            
            # Initialize data
            rows = []
            for row in reader:
                rows.append(row)
            
            # Print analysis
            print("=" * 40)
            print(f"CSV Analysis: {file_path}")
            print("=" * 40)
            print(f"Headers: {len(headers)}")
            print(f"Rows: {len(rows)}")
            print(f"Column names: {', '.join(headers)}")
            
            # Sample data
            if rows:
                print("\nSample data (first row):")
                for i, value in enumerate(rows[0]):
                    print(f"  {headers[i]}: {value}")
            
            print("=" * 40)
            
    except FileNotFoundError:
        print(f"Error: File '{file_path}' not found")
        return False
    except Exception as e:
        print(f"Error processing CSV: {e}")
        return False
    
    return True

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python csv_analyzer.py <csv_file_path>")
        print("Example: python csv_analyzer.py 'Files Samples/sample.csv'")
    else:
        analyze_csv(sys.argv[1])