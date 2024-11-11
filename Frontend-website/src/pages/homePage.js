import React from "react";
import ExpenseGraph from '../components/ytdGraph';
import { Link } from 'react-router-dom';
const Arrow = () => (
    <div className="arrow">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="34" height="34">
            <path d="M10 6l6 6-6 6" fill="none" stroke="white" strokeWidth="2" />
        </svg>
    </div>
);

function HomePage() {
    return (
        <div className="homepage">
            <ExpenseGraph/>
            <div className="title">Trackr</div>
            <div className="recent-trans">
                <p>Recent Transactions</p>
                <Link to='/homePage/recentTrans'>
                <Arrow/>
                </Link>
            </div>
            <div className="stats">
                <p className="heading">Stats</p>
                <div className="stat-elem">
                    <div className="stat-elem-ind">
                        <p style={{ fontSize: '18px', color:'green'}}>50,300</p>
                        <p style={{ fontSize: '18px' }}>Income</p>
                    </div>
                    <div className="stat-elem-ind">
                        <p style={{ fontSize: '18px', color:'red' }}>50,300</p>
                        <p style={{ fontSize: '18px' }}>Expenditure</p>
                    </div>
                    <div className="stat-elem-ind">
                        <p style={{ fontSize: '18px', color:'green' }}>50,300</p>
                        <p style={{ fontSize: '18px' }}>Savings this month</p>
                    </div>
                    <div className="stat-elem-ind">
                        <p style={{ fontSize: '18px', color:'red' }}>50,300</p>
                        <p style={{ fontSize: '18px' }}>Expense growth</p>
                    </div>
                </div>
                <div><Arrow /> </div>
            </div>
            <div className="budgets">
                <p>Budgets</p>
                <Arrow /> 
            </div>
        </div>
    );
}

export default HomePage;
