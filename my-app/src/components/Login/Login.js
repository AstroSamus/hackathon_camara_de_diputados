import "primereact/resources/themes/lara-light-cyan/theme.css";
import React, { useState, useRef } from "react";
import { createWeb3Modal, defaultConfig } from '@web3modal/ethers/react'
import { styled } from 'styled-components'
import { Button } from 'primereact/button'; 
import { Checkbox } from 'primereact/checkbox';

// 1. Get projectId at https://cloud.walletconnect.com
const projectId = 'acc64a6d2308020280276076ddc6effa'

// 2. Set chains
const filecoinCalibrationTestNet = {
  chainId: 314159,
  name: 'Filecoin - Calibration testnet',
  currency: 'tFIL',
  explorerUrl: 'https://calibration.filscan.io',
  rpcUrl: 'https://rpc.ankr.com/filecoin_testnet'
}

// 3. Create modal
const metadata = {
  name: 'My Website',
  description: 'My Website description',
  url: 'https://mywebsite.com', // origin must match your domain & subdomain
  icons: ['https://avatars.mywebsite.com/']
}

createWeb3Modal({
  ethersConfig: defaultConfig({ metadata }),
  tokens: {
    1: {
      address: '0xe54d9c99a9A0cfc3974f1b4AfB0a231a059872aD'
    },
  },
  chains: [filecoinCalibrationTestNet],
  projectId,
  enableAnalytics: true // Optional - defaults to your Cloud configuration
})


export default function Login({ Component, pageProps }) {

    const Container = styled.div`
        height: 100vh;
        width: 100vw;
        background-color: var(--pink-500);
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-content: center;
    `;

    const Form = styled.div`
        background-color: white;
        width: 80%;
        height: 80%;
    `

    return (
        <Container>
            <Form>
                <h2>Bienvenido(a)</h2>
                <Button 
                    icon="pi pi-check" 
                    label="Conectar Wallet"
                    severity="secondary" 
                    outlined 
                />
                <div>
                    <Checkbox/> 
                    <a>Acepto aviso de privcidad</a>
                </div>
            </Form>
        </Container>
    );
}