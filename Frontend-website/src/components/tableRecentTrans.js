import React from 'react';

const Arrow = () => (
    <div>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
            <path d="M10 6l6 6-6 6" fill="none" stroke="white" strokeWidth="2" />
        </svg>
    </div>
);

const TableComponent = () => {
  return (
    <table>
      <thead>
        <tr>
          <th>S.no</th>
          <th>Amount</th>
          <th>Description</th>
          <th>Tag</th>
          <th>Date</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td>$100</td>
          <td>Groceries</td>
          <td><div><Arrow/>Food</div></td>
          <td>2024-09-15</td>
        </tr>
        <tr>
          <td>2</td>
          <td>$50</td>
          <td>Transportation</td>
          <td><div><Arrow/>Commute</div></td>
          <td>2024-09-14</td>
        </tr>
        <tr>
          <td>1</td>
          <td>$100</td>
          <td>Groceries</td>
          <td><div><Arrow/>Food</div></td>
          <td>2024-09-15</td>
        </tr>
        <tr>
          <td>1</td>
          <td>$100</td>
          <td>Groceries</td>
          <td><div><Arrow/>Food</div></td>
          <td>2024-09-15</td>
        </tr>
        <tr>
          <td>1</td>
          <td>$100</td>
          <td>Groceries</td>
          <td><div><Arrow/>Food</div></td>
          <td>2024-09-15</td>
        </tr>
        <tr>
          <td>1</td>
          <td>$100</td>
          <td>Groceries</td>
          <td><div><Arrow/>Food</div></td>
          <td>2024-09-15</td>
        </tr>
        <tr>
          <td>1</td>
          <td>$100</td>
          <td>Groceries</td>
          <td><div><Arrow/>Food</div></td>
          <td>2024-09-15</td>
        </tr>
        {/* Add more rows as needed */}
      </tbody>
    </table>
  );
};

export default TableComponent;
