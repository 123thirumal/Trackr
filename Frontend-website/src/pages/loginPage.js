import React, { useState } from "react";
import { useNavigate } from 'react-router-dom'; // Updated to useNavigate from react-router-dom v6
import axios from 'axios';

function LoginPage() {
    // State to store user input for email and password
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState(null); // State for error message
    const navigate = useNavigate(); // useNavigate hook to programmatically navigate

    const handleLogin = async (e) => {
        e.preventDefault(); // Prevent the default form submission

        try {
            // Send the login request to the backend
            const response = await axios.post('http://localhost:5000/auth/login', {
                email,
                password,
            });

            // On success, store the JWT token in localStorage
            localStorage.setItem('token', response.data.jwtToken);

            // Optionally, store other user data if needed
            localStorage.setItem('user', JSON.stringify({ name: response.data.name, email: response.data.email }));

            // Redirect to the home page after successful login
            navigate('/homePage'); // Use react-router to navigate

        } catch (err) {
            console.error('Login failed:', err.response?.data?.message || err.message);
            setError(err.response?.data?.message || 'An error occurred during login');
        }
    };

    return (
        <div className="loginpage">
            <h1>Trackr</h1>
            <div className="LoginBox">
                <h2>Login</h2>
                <form onSubmit={handleLogin}>
                    <input
                        type="email"
                        placeholder="Enter Email"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)} // Update email state
                    />
                    <input
                        type="password"
                        placeholder="Enter Password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)} // Update password state
                    />
                <button type="submit">Submit</button>
                </form>
                {error && <p className="error-message">{error}</p>} {/* Display error message */}
            </div>
        </div>
    );
}

export default LoginPage;
