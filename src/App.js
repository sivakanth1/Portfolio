import React from "react";
import "./App.css";
import About from "./Components/About";
import Contact from "./Components/Contact";
import Home from "./Components/Home";
import Portfolio from "./Components/Portfolio"; 
import Services from "./Components/Services";

function App() {
  return (
    <div className="App">
          <div className="header">
            <p><a href="#">HOME</a></p>
            <p><a href="#">ABOUT US</a></p>
            <p><a href="#">SERVICES</a></p>
            <p><a href="#">PORTFOLIO</a></p>
            <p><a href="#">CONTACT US</a></p>
          </div>

          <Home />
          <About />
          <Services />
          <Portfolio />
          <Contact />
    </div>
  );
}

export default App;
