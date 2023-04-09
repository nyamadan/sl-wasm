import ReactDOM from "react-dom/client";
import { BrowserRouter } from "react-router-dom";
import App from "./App";

const root = document.getElementById("root")!;
if (import.meta.env.DEV) {
  ReactDOM.createRoot(root).render(
    <BrowserRouter>
      <App />
    </BrowserRouter>
  );
} else {
  ReactDOM.hydrateRoot(
    root,
    <BrowserRouter>
      <App />
    </BrowserRouter>
  );
}
