import React, { useState } from "react";
import "./App.css";

const App: React.FC = () => {
  const [speed, setSpeed] = useState(0);
  const [visible, setVisible] = useState(false);

  addEventListener("message", (event) => {
    const { data } = event;

    if (data.action === "show") {
      setSpeed(Math.round(data.speed));
      setVisible(true);
    } else if (data.action === "hide") {
      setSpeed(0);
      setVisible(false);
    }
  });

  if (!visible) {
    return null;
  }

  return (
    <div className="circle">
      <div className="speed-wrapper">
        <h1 className="speed">{speed}</h1>
        <p className="label">MPH</p>
      </div>
    </div>
  );
};

export default App;
