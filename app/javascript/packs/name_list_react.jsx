import React from "react";
import ReactDOM from "react-dom";
import { store } from "../components/redux/store";
import { Provider } from "react-redux";

import App from "../components/App";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <Provider store={store}>
      <App />
    </Provider>,
    document.body.appendChild(document.createElement("div"))
  );
});
