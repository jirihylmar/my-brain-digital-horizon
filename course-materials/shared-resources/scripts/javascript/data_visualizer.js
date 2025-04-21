// File path: course-materials/shared-resources/scripts/javascript/data_visualizer.js

/**
 * Data Visualizer - A simple tool for visualizing CSV data
 * Digital Horizon Course - Example Script
 */

// Function to parse CSV data
function parseCSV(csvText) {
	const lines = csvText.trim().split('\n');
	const headers = lines[0].split(',').map(header => header.trim());
	
	const data = [];
	for (let i = 1; i < lines.length; i++) {
	  const values = lines[i].split(',');
	  if (values.length === headers.length) {
	    const entry = {};
	    headers.forEach((header, index) => {
	      // Try to convert numeric values
	      const value = values[index].trim();
	      entry[header] = isNaN(value) ? value : parseFloat(value);
	    });
	    data.push(entry);
	  }
	}
	
	return { headers, data };
     }
     
     // Function to calculate basic statistics
     function calculateStats(data, field) {
	// Check if the field exists and contains numeric values
	if (!data.length || typeof data[0][field] !== 'number') {
	  return null;
	}
	
	const values = data.map(item => item[field]);
	
	// Calculate min, max, sum, average
	const min = Math.min(...values);
	const max = Math.max(...values);
	const sum = values.reduce((acc, val) => acc + val, 0);
	const avg = sum / values.length;
	
	return { min, max, sum, avg };
     }
     
     // Function to create a simple bar chart (using console.log for demonstration)
     function createConsoleBarChart(data, labelField, valueField, title = "Bar Chart") {
	console.log(`\n${title}\n${"=".repeat(title.length)}`);
	
	// Find the max value for scaling
	const values = data.map(item => item[valueField]);
	const maxValue = Math.max(...values);
	const scale = 40 / maxValue; // Scale to max width of 40 characters
	
	// Find the longest label for padding
	const longestLabel = Math.max(...data.map(item => String(item[labelField]).length));
	
	// Create the chart
	data.forEach(item => {
	  const label = String(item[labelField]).padEnd(longestLabel);
	  const value = item[valueField];
	  const barLength = Math.round(value * scale);
	  const bar = "█".repeat(barLength);
	  
	  console.log(`${label} | ${bar} ${value}`);
	});
	
	console.log("\n");
     }
     
     // Function to load and visualize CSV data
     function visualizeCSVData(csvFilePath) {
	// In a browser environment, you would use fetch or XMLHttpRequest
	// For demonstration, we'll assume a function to read the file content
	
	// Example usage (commented out as this is just a demonstration)
	/*
	const csvContent = readCSVFile(csvFilePath);
	const { headers, data } = parseCSV(csvContent);
	
	console.log(`Loaded ${data.length} records from ${csvFilePath}`);
	console.log(`Headers: ${headers.join(', ')}`);
	
	// Example visualization for a numeric field
	if (headers.includes('grade')) {
	  const stats = calculateStats(data, 'grade');
	  console.log("\nGrade Statistics:");
	  console.log(`Min: ${stats.min}`);
	  console.log(`Max: ${stats.max}`);
	  console.log(`Average: ${stats.avg.toFixed(2)}`);
	  
	  // Create a bar chart of grades by student
	  createConsoleBarChart(data, 'last_name', 'grade', "Student Grades");
	}
	*/
     }
     
     // Export functions for use in Node.js (if applicable)
     if (typeof module !== 'undefined' && module.exports) {
	module.exports = {
	  parseCSV,
	  calculateStats,
	  createConsoleBarChart,
	  visualizeCSVData
	};
     }