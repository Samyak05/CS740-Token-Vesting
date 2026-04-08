Project: Task 3 - Token Vesting with 6-Month Cliff
Student: Samyak Shriram Gedam (252IS032)

Requirements:
- Geth (Go-Ethereum) v1.17.1
- Node.js & NPM
- Remix IDE

Setup Instructions:
1. Start Geth in Dev Mode:
 
	command:-   geth --dev --http --http.api eth,web3,net --http.corsdomain "https://remix.ethereum.org"

2. In a separate terminal, run remixd to bridge the local folder:

	command:-   remixd -s ./project --remix-ide https://remix.ethereum.org

3. Open Remix IDE and Access the Editor 
	a. Open your browser and go to remix.ethereum.org.
	b. In the "Workspaces" dropdown (top left), select "- connect to localhost -".
	c. Click Connect. You will now see your Local folder files directly in the browser.

Execution:
1. Compile TokenVesting.sol using compiler 0.8.x.
2. Deploy the contract by providing 10 ETH in the 'Value' field and a beneficiary address.
3. Call 'claimableAmount' to see the current vested balance.
4. Use 'claim' to withdraw funds (will revert if within the 6-month cliff).
