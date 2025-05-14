/**
 * Simple data visualization script for Digital Horizon course
 * This script demonstrates how to create a basic text-based visualization
 * File path: system_scripts/javascript/data_visualizer.js
 */

// Sample data
const data = [
  { month: "January", value: 42 },
  { month: "February", value: 73 },
  { month: "March", value: 95 },
  { month: "April", value: 62 },
  { month: "May", value: 88 },
  { month: "June", value: 56 }
];

// Print a simple bar chart
function printBarChart(data, title) {
  console.log("=".repeat(40));
  console.log(title);
  console.log("=".repeat(40));
  
  // Find maximum value for scaling
  const maxValue = Math.max(...data.map(item => item.value));
  const scale = 30 / maxValue; // Scale to fit in terminal
  
  // Print each bar
  data.forEach(item => {
    const barLength = Math.round(item.value * scale);
    const bar = "#".repeat(barLength);
    console.log(`${item.month.padEnd(10)}: ${bar} ${item.value}`);
  });
  
  console.log("=".repeat(40));
}

// Print the chart
printBarChart(data, "Monthly Data Visualization");

// Export functions if in Node.js environment
if (typeof module !== 'undefined' && module.exports) {
  module.exports = {
    printBarChart
  };
}