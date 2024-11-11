import React from 'react';
import { Line } from 'react-chartjs-2';
import { Chart as ChartJS, CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend } from 'chart.js';

// Register Chart.js components
ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend);

const ExpenseGraph = () => {
  // Sample data for YTD expenses
  const data = {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'], // Months of the year
    datasets: [
      {
        data: [500, 700, 800, 600, 900, 1000, 1200, 1100, 1300, 1500, 1400, 1600], // Sample expense data
        fill: false,
        borderColor: 'rgba(75, 192, 192, 1)',
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        tension: 0.4, // Smooth line
      },
    ],
  };

  const options = {
    responsive: true,
    plugins: {
      legend: {
        display: false,
      },
      title: {
        display: false,
      },
    },
    scales: {
        x: {
          grid: {
            color: 'rgba(75, 192, 192, 0.2)', // Change the color of the x-axis grid lines
          },
          axis: {
            line: {
              color: 'rgba(75, 192, 192, 0.2)', // Change the color of the x-axis line
            }
          }
        },
        y: {
          grid: {
            color: 'rgba(75, 192, 192, 0.2)', // Change the color of the y-axis grid lines
          },
          axis: {
            line: {
              color: 'rgba(75, 192, 192, 0.2)', // Change the color of the y-axis line
            }
          }
        }
      },
  };

  return (
    <div className="expense-graph">
      <p>YTD expense graph</p>
      <div className="chart-container">
        <Line data={data} options={options} />
      </div>
    </div>
  );
};

export default ExpenseGraph;
