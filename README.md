# 🔐 Token Vesting with 6-Month Cliff
![Solidity](https://img.shields.io/badge/Language-Solidity-blue)
![Ethereum](https://img.shields.io/badge/Blockchain-Ethereum-purple)
![Remix](https://img.shields.io/badge/IDE-Remix-orange)

---


## 🚀 Overview

This project implements a **Token Vesting Smart Contract** on the Ethereum blockchain.

The contract ensures:

* Funds remain locked during a **cliff period**
* After the cliff, funds are released **linearly over time**
* Only the **beneficiary** can withdraw vested funds

This project was developed as part of:

**CS740: Blockchain Design Architecture**

---

## 🎯 Objective

To design and implement a secure time-based vesting mechanism where:

* No withdrawal is allowed before the cliff period
* Funds are released gradually after the cliff
* Smart contract enforces all rules without external trust

---

## 🧰 Requirements

* Geth (Go-Ethereum) v1.17.1
* Node.js & NPM
* Remix IDE (Browser)

---

## ⚙️ Setup Instructions

### 🔗 Step 1 — Start Geth (Local Blockchain)

```bash
geth --dev --http --http.api eth,web3,net --http.corsdomain "https://remix.ethereum.org"
```

---

### 📁 Step 2 — Run remixd (Local File Bridge)

```bash
remixd -s ./ --remix-ide https://remix.ethereum.org
```

---

### 🌐 Step 3 — Open Remix IDE

1. Open: https://remix.ethereum.org
2. In "Workspaces", select **- connect to localhost -**
3. Click **Connect**
4. Local project files will appear in Remix

---

### 🔌 Step 4 — Connect to Local Blockchain

* Environment: **Custom - External HTTP Provider**
* URL: `http://127.0.0.1:8545`

---

## 🛠️ Execution Steps

1. Open `TokenVesting.sol` in Remix

2. Compile using Solidity **0.8.x**

3. Go to **Deploy & Run Transactions**

4. Deploy contract:

   * Enter beneficiary address
   * Set Value = 10 ETH
   * Click Deploy

5. Interact with contract:

   * Call `claimableAmount()` → Check vested funds
   * Call `claim()` → Withdraw funds

---

## 🧪 Observations

* ✅ Contract deployed with initial funding
* ❌ `claim()` reverts before vesting period (cliff enforced)
* 📉 Initial claimable amount = 0
* 📈 Claimable amount increases over time
* 💸 Successful withdrawal after vesting

---

## ⚠️ Note

For demonstration purposes:

* Cliff duration and vesting duration are reduced to seconds

In real-world scenarios:

* Cliff = 6 months
* Vesting = 24 months

---

## 📂 Project Structure

```
TokenVesting/
│── project/
│   └── TokenVesting.sol 
│
│── screenshots/
│   ├── deployment.png
│   ├── revert.png
│   ├── initial.png
│   ├── increasing.png
│   ├── final.png
│   └── claim_success.png
│
│── report
└── README.md
```

---

## 👨‍💻 Authors
- Samyak Shriram Gedam (252IS032)  
- Piyush K. Karn (252IS026)  
- Prithiraj Rabha (252IS028)  

M.Tech CSIS  
National Institute of Technology Karnataka