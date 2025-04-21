# File path: course-materials/shared-resources/scripts/python/csv_analyzer.py
#!/usr/bin/env python3

"""
CSV Analyzer - A simple tool for analyzing CSV files
Digital Horizon Course - Example Script
"""

import csv
import sys
from collections import defaultdict

def analyze_csv(file_path):
    """Analyze a CSV file and print basic statistics"""
    print("=" * 50)
    print(f"Analyzing CSV file: {file_path}")
    print("=" * 50)
    
    try:
        with open(file_path, 'r', newline='') as csv_file:
            # Read the CSV file
            reader = csv.reader(csv_file)
            
            # Get headers
            headers = next(reader)
            print(f"Headers: {', '.join(headers)}")
            print("-" * 50)
            
            # Analyze data
            row_count = 0
            column_stats = defaultdict(list)
            
            for row in reader:
                row_count += 1
                for i, value in enumerate(row):
                    if i < len(headers):  # Safety check
                        column_stats[headers[i]].append(value)
            
            print(f"Total rows: {row_count}")
            print("-" * 50)
            
            # Print column statistics
            for header, values in column_stats.items():
                print(f"Column: {header}")
                print(f"  - Unique values: {len(set(values))}")
                
                # Check if values are numeric
                numeric_values = []
                for val in values:
                    try:
                        numeric_values.append(float(val))
                    except ValueError:
                        pass
                
                if numeric_values:
                    avg = sum(numeric_values) / len(numeric_values)
                    print(f"  - Average (numeric values): {avg:.2f}")
                
                print()
            
    except FileNotFoundError:
        print(f"Error: File '{file_path}' not found")
        return False
    except Exception as e:
        print(f"Error analyzing file: {e}")
        return False
    
    print("=" * 50)
    print("Analysis complete!")
    return True

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python csv_analyzer.py <csv_file>")
        sys.exit(1)
    
    result = analyze_csv(sys.argv[1])
    sys.exit(0 if result else 1)