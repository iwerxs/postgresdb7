import { Component } from "react";
import PropTypes from "prop-types";
import { MenuData } from "./MenuData";
import "./Navbar.css";

class Navbar extends Component {
  state = { clicked: false };

  handleClick = () => {
    this.setState({ clicked: !this.state.clicked });
  };

  handleLogout = () => {
    localStorage.removeItem("userRole");
    this.props.setRole("");
    window.location.href = "/login";
  };

  render() {
    const { role } = this.props;
    const isLoggedIn = role !== "";

    // Console log 'role' value and whether the user is logged in
    console.log("Role:", role);
    console.log("Is logged in:", isLoggedIn);

    return (
      <nav className='NavbarItems'>
        <img src='./ssglogo.png' className='logo' alt='logo' />
        <div className='menu-icons' onClick={this.handleClick}>
          <i
            className={this.state.clicked ? "fas fa-times" : "fas fa-bars"}></i>
        </div>
        <ul className={this.state.clicked ? "nav-menu active" : "nav-menu"}>
          {MenuData.map((item, index) => {
            // Condition to display or hide menu items based on role
            if (
              (item.url === "/create-company" && role === "companyAdmin") ||
              (item.url === "/create-user" &&
                !["admin", "platformAdmin", "superAdmin", "companyAdmin"].includes(role))
            ) {
              return null; // Hide Create Company for companyAdmin, and Create User for non-authorized roles
            }
            return (
              <li key={index}>
                <a href={item.url} className={item.cName}>
                  <i className={item.icon}></i>
                  {item.title}
                </a>
              </li>
            );
          })}
          {isLoggedIn ? (
            <li>
              <button onClick={this.handleLogout} className='nav-links-logout'>
                <i className='fa-solid fa-arrow-right-from-bracket'></i> Logout
              </button>
            </li>
          ) : (
            <li>
              <a href='/login' className='nav-links-login'>
                <i className='fa-solid fa-arrow-right-to-bracket'></i> Login
              </a>
            </li>
          )}
        </ul>
      </nav>
    );
  }
}

Navbar.propTypes = {
  role: PropTypes.string.isRequired,
  setRole: PropTypes.func.isRequired,
};

export default Navbar;
