import './App.css';
import { StrictMode } from 'react';
import { PrimeReactProvider } from 'primereact/api';
import "primereact/resources/themes/lara-light-cyan/theme.css";  
import Login from './components/Login/Login.js'

export default function MyApp({ Component, pageProps }) {
  return (
    <StrictMode>
      <PrimeReactProvider>
        <Login/>
      </PrimeReactProvider>
    </StrictMode>
  );
}
