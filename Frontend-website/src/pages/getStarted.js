import React from "react";
import video from "../assets/videoplayback.mp4";
import { Typewriter } from 'react-simple-typewriter';
import { Link } from 'react-router-dom';
import image from '../assets/photo.jpeg';

function GetStarted() {
    const backgroundStyles = {
        backgroundImage: `url(${image})`,
        height: '300vh',  // Set the height to span 3 viewports
        backgroundSize: 'cover',  // Ensures the image covers the entire background
        backgroundPosition: 'start',  // Center the image
        backgroundRepeat: 'no-repeat',  // Prevent image from repeating
    };

    return (
        <div className="getstarted">
            {/* First Page */}
            <div className="first-page">
                <nav className="navbar">
                    <a className="nav-link" href="#">What</a>       
                    <a className="nav-link" href="#">Why</a>
                    <a className="nav-link" href="#">Tech</a>
                    <a className="nav-link" href="#">Contact</a>
                    <div className="navbar-right">
                        <Link to="/login">
                            <button>Login</button>
                        </Link>
                        <Link to="/signUp">
                            <button>SignUp</button>
                        </Link>
                        <p>Trackr</p>  
                    </div>      
                </nav>
                
                <div className="title">
                    <h1>Track. Save. Live.</h1>
                    <h2>We'll take care of the rest.</h2>
                    <h3>
                        Something that can actually help you 
                        <span className="typewriter">
                            <Typewriter
                                words={[' Live', ' Thrive', ' Achieve']}
                                loop={true}
                                cursor
                                cursorStyle='_'
                                typeSpeed={100}
                                deleteSpeed={50}
                                delaySpeed={1000}
                            />
                        </span>
                    </h3>
                    
                    <div className="video-container">
                        <video src={video} height="100%" width="100%" autoPlay muted loop></video>
                        <div className="vidText">
                            <h1>MORE.</h1>
                        </div>
                    </div>
                </div>
            </div>

            {/* Second Section with Background Image */}
            <div style={backgroundStyles} className="content">
                <div className="first">
                    <h1>Manage your money effortlessly</h1>
                    <p>Our intelligent system automatically records and categorizes your expenses, 
                    saving you time and ensuring accuracy.</p>

                </div>
                <div className="second">
                    <h1>Real-time spending Insights</h1>
                    <p>Get detailed, real-time analytics and insights into your spending habits to make informed financial decisions.</p>
                </div>
                <div className="third">
                    <div className="third-1">
                    <h1>Optimize  your budget goals</h1>
                    <p>Set and monitor personalized budget goals to ensure you stay on track and achieve financial success.</p>
                    </div>
                    <Link to="/login">
                    <button>Get Started <span className="material-icons">arrow_forward</span></button>
                </Link>
                </div>
            </div>
        </div>
    );
}

export default GetStarted;
