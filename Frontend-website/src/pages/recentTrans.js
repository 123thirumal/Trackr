import React from "react";
import Table from '../components/tableRecentTrans';

const EncircledPlus=()=>(
    <div>
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 24 24"
        width="40"
        height="40"
        fill="black"
      >
        <circle cx="12" cy="12" r="10" stroke="black" strokeWidth="2" fill="none" />
        <line x1="12" y1="8" x2="12" y2="16" stroke="black" strokeWidth="2" />
        <line x1="8" y1="12" x2="16" y2="12" stroke="black" strokeWidth="2" />
      </svg>
    </div>
);

function RecentTrans(){
    return(
        <div className="recentTransPage">
            <nav className="navbar">
                <p>Trackr</p>           
            </nav>   
            <div className="content">
               <h1>Recent Transactrions</h1>
               <div className="filter">
                <EncircledPlus/>
                <input type="text" placeholder="Filter"/>
               </div>
               <Table/>
            </div>       
        </div>
    );
}


export default RecentTrans;