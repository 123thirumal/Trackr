import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import GetStartedPage from './pages/getStarted';
import LoginPage from './pages/loginPage';
import SignUpPage from './pages/signUpPage';
import HomePage from './pages/homePage';
import RecentTrans from './pages/recentTrans';

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<GetStartedPage />} />  {/* Root route */}
        <Route path="/login" element={<LoginPage />} />  {/* About page */}
        <Route path="/signUp" element={<SignUpPage />} />  {/* Contact page */}
        <Route path="/homePage" element={<HomePage />} />
        <Route path='/homePage/recentTrans' element={<RecentTrans/>}/>
      </Routes>
    </Router>
  );
};

export default App;
