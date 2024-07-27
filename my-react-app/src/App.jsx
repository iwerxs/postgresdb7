import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Home from "./components/Home/Home";
import Navbar from "./components/Navbar/Navbar";
import "./components/styles.css";
import Register from "./components/Login/Register";
import Login from "./components/Login/Login";
import CreateUser from "./components/User/CreateUser";
import CreateCompany from "./components/Company/CreateCompany";
import Referrals from "./components/Referrals/Referrals";
import { useState, useEffect } from "react";
import axios from "axios";

const App = () => {
  const [companies, setCompanies] = useState([]);
  const [error, setError] = useState("");
  const [role, setRole] = useState(""); // Ensure role is initialized

  const fetchCompanies = async () => {
    try {
      const response = await axios.get("http://localhost:8080/companies", {
        withCredentials: true,
      });
      setCompanies(response.data);
    } catch (error) {
      if (error.response && error.response.status === 401) {
        console.error("Unauthorized access, please log in.");
        setError("Unauthorized access, please log in.");
      } else {
        console.error("Error fetching companies:", error);
        setError("Failed to fetch companies");
      }
    }
  };

  useEffect(() => {
    const storedRole = localStorage.getItem("userRole") || "";
    setRole(storedRole);
    fetchCompanies();
  }, []);

  return (
    <div className='App'>
      <Navbar role={role} setRole={setRole} />
      <Router>
        <main className='main-content'>
          <Routes>
            <Route path='/' exact element={<Home />} />
            <Route path='/register' element={<Register />} />
            <Route path='/login' element={<Login />} />
            <Route path='/referrals' element={<Referrals role={role} />} />
            <Route
              path='/create-user'
              element={
                <CreateUser
                  companies={companies}
                  refreshData={fetchCompanies}
                  role={role} // Pass role to CreateUser component
                />
              }
            />
            <Route path='/create-company' element={<CreateCompany />} />
          </Routes>
          {error && <div style={{ color: "red" }}>{error}</div>}
        </main>
      </Router>
    </div>
  );
};

export default App;
