#!/usr/bin/env python3
# File path: system_scripts/python/hello.py

# Simple Python script for Digital Horizon Course
print("Hello from Python!")
print("Welcome to Digital Horizon")

# Display some basic Python capabilities
print("\nPython can perform calculations:")
print(f"5 + 10 = {5 + 10}")
print(f"20 * 3 = {20 * 3}")
print(f"100 / 4 = {100 / 4}")

# Display a simple list
print("\nPython can work with lists:")
fruits = ["apple", "banana", "cherry", "date"]
print(f"Fruits list: {fruits}")
print(f"First fruit: {fruits[0]}")
print(f"Last fruit: {fruits[-1]}")
print(f"Sliced list: {fruits[1:3]}")

# Display a simple dictionary
print("\nPython can work with dictionaries (key-value pairs):")
person = {
    "name": "John",
    "age": 30,
    "city": "Prague",
    "course": "Digital Horizon"
}
print(f"Person dictionary: {person}")
print(f"Name: {person['name']}")
print(f"Course: {person['course']}")

print("\nThis is just a simple example of what Python can do!")