import React, { useState } from "react";
import { useNavigate } from 'react-router-dom';

function SignupPage() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();

  const handleSignup = async (e) => {
    e.preventDefault();

    const userData = { name, email, password };

    try {
      const response = await fetch('http://localhost:5000/auth/signup', {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(userData),
      });

      const data = await response.json();

      if (response.ok) {
        console.log("User signed up successfully:", data);
        // Handle successful signup, such as redirecting to login page or showing a success message
        navigate('/homePage');
      } else {
        console.error(data.message);
        // Handle error (e.g., show error message to the user)
      }
    } catch (error) {
      console.error("Error during signup:", error);
    }
  };

  return (
    <div className="loginpage">
      <h1>Trackr</h1>
      <div className="LoginBox">
        <h2>Signup</h2>
        <form onSubmit={handleSignup}>
          <input
            type="text"
            placeholder="Enter name"
            value={name}
            onChange={(e) => setName(e.target.value)}
          />
          <input
            type="email"
            placeholder="Enter Email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
          <input
            type="password"
            placeholder="Enter Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        <button type="submit">Signup</button>
        </form>
      </div>
    </div>
  );
}

export default SignupPage;
