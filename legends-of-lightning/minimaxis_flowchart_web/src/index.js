import React, { useState, useEffect } from "react";
import ReactDOM from "react-dom";
import mermaid from "mermaid";
import './App.css'

mermaid.initialize({
  startOnLoad: true,
});

const Mermaid = ({ chart, key }) => {
  useEffect(() => {
    mermaid.contentLoaded();
  }, [chart, key]);

  return <div className="mermaid">{chart}</div>;
};

const App = () => {
  const [miniscriptValue, setMiniscriptValue] = useState("");
  const [mermaidChart, setMermaidChart] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [mermaidKey, setMermaidKey] = useState(0);

  const handleReturn = () => {
    window.location.href = 'https://app.minimaxis.com/#/chat';
  };

  const handleMiniscriptChange = (event) => {
    const lowercaseValue = event.target.value.toLowerCase();
    setMiniscriptValue(lowercaseValue);
  };

  const handleFetchData = async () => {
    setLoading(true);
    setError(null);

    try {
      const response = await fetch("https://flowchart-api.onrender.com/miniscript_to_sympy", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ miniscript: miniscriptValue }),
      });

      console.log("Response:", response);

      if (response.ok) {
        const data = await response.json();
        console.log("Data:", data);

        setMermaidChart(data.result);

        setMermaidKey((prevKey) => prevKey + 1);
      } else {
        const errorMessage = await response.text(); 
        console.error("Error fetching data:", errorMessage);
        setError("An error has occurred, please consult the Developer");
      }
    } catch (error) {
      setError("Error fetching data");
      console.error("Error fetching data:", error.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="App">
      <div className="containerapp">
        <button className="button" onClick={handleReturn}>Back to chat</button>
        <input
          type="text"
          placeholder="Enter miniscript"
          value={miniscriptValue}
          onChange={handleMiniscriptChange}
          className="input"
        />
        <button onClick={handleFetchData} className="button">Generate Miniscript</button>
        {loading && <p className="loading">Loading... Minimaxis is working to generate </p>}
        {error && <p style={{ color: "red" }}>{error}</p>}
        <div className="margin"></div>
        <Mermaid chart={mermaidChart} key={mermaidKey} />
      </div>
    </div>
  );
};

const rootElement = document.getElementById("root");
const root = ReactDOM.createRoot(rootElement);
root.render(<App />);
