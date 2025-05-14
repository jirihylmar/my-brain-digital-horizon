// File path: system_scripts/javascript/hello.js

// Simple JavaScript example for Digital Horizon course
console.log("Hello from JavaScript!");
console.log("Welcome to Digital Horizon");

// Display some basic JavaScript capabilities
console.log("\nJavaScript can perform calculations:");
console.log(`5 + 10 = ${5 + 10}`);
console.log(`20 * 3 = ${20 * 3}`);
console.log(`100 / 4 = ${100 / 4}`);

// Display a simple array
console.log("\nJavaScript can work with arrays:");
const fruits = ["apple", "banana", "cherry", "date"];
console.log(`Fruits array: ${fruits}`);
console.log(`First fruit: ${fruits[0]}`);
console.log(`Last fruit: ${fruits[fruits.length - 1]}`);
console.log(`Sliced array: ${fruits.slice(1, 3)}`);

// Display a simple object
console.log("\nJavaScript can work with objects:");
const person = {
    name: "John",
    age: 30,
    city: "Prague",
    course: "Digital Horizon"
};
console.log("Person object:");
console.log(person);
console.log(`Name: ${person.name}`);
console.log(`Course: ${person.course}`);

console.log("\nThis is just a simple example of what JavaScript can do!");