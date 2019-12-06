# SUPPLY_CHAIN USING BLOCKCHAIN
      
   **under guidance of Dr. Raju Halder Sir(IIT PATNA) **

**What is it?**

It is a tracking and tracing system of ordered items where all the data is stored on the Blockchain, thus eliminating traditional database. Since, all information is stored on the blockchain, no one can ever deny nor falsify data.

**Smart Contracts**


Smart contracts are lines of code that are stored on a blockchain and automatically execute when predetermined terms and conditions are met. At the most basic level, they are programs that run as they’ve been set up to run by the people who developed them. The benefits of smart contracts are most apparent in business collaborations, in which they are typically used to enforce some type of agreement so that all participants can be certain of the outcome without an intermediary’s involvement.

A smart contract is a computer code running on top of a blockchain containing a set of rules under which the parties to that smart contract agree to interact with each other. If and when the predefined rules are met, the agreement is automatically enforced. The smart contract code facilitates, verifies, and enforces the negotiation or performance of an agreement or transaction. It is the simplest form of decentralized automation.

For more information:
https://blockchainhub.net/smart-contracts/
https://solidity.readthedocs.io/en/v0.5.3/introduction-to-smart-contracts.html

For this project the smart contract has been written is Solidity, which is a JavaScript based language. To know more about solidity:
https://solidity.readthedocs.io/en/v0.5.3/solidity-by-example.html

**What are the benefits of smart contracts?**

The benefits of smart contracts go hand-in-hand with blockchain.

**Speed and accuracy:** Smart contracts are digital and automated, so you won’t have to spend time processing paperwork or reconciling and correcting the errors that are often written into documents that have been filled manually. Computer code is also more exact than the legalese that traditional contracts are written in.

**Trust:** Smart contracts automatically execute transactions following predetermined rules, and the encrypted records of those transactions are shared across participants. Thus, nobody has to question whether information has been altered for personal benefit.

**Security:** Blockchain transaction records are encrypted, and that makes them very hard to hack. Because each individual record is connected to previous and subsequent records on a distributed ledger, the whole chain would need to be altered to change a single record.

**Savings:** Smart contracts remove the need for intermediaries because participants can trust the visible data and the technology to properly execute the transaction. There is no need for an extra person to validate and verify the terms of an agreement because it is built into the code.


**what is Supply_Chain Management?**

The management of the flow of goods, services, and information involving the storage and movement of raw materials, building products as well as full-fledged finished goods from one point to another are known as “supply chain management”.

So, why do we need supply chain management?

If you properly implement supply chain management, then you will:

Increase sales
Decrease frauds and overhead costs
Improve the quality of improvisation
Lead to accelerating production and distribution
Reduce the cost and complexity of the manufacturing process, especially when the process itself is extremely complex


**functionalities**

**1. Owner** -The account deploying the code on blockchain wil the the owner

**2. managecarriers()**  -The owner can authorise any account to be the carrier

**3. orderproduct()** -Customer can order the products and a unique id is generated everytime the order is been placed using the account address of the user to differentiate two differenet customers and a time stamp to differentiate between two orders placed by the same customer.
Both adddress and time ensures the formation of a unique id everytime the oredr is been placed.

**4 .cancelorder()**- To Cancel the ordered product.

THREE CARRIERS ARE USED HERE AS A MEDIATOR 

**CarrierReport**-The reports of the carriers are used here to track the product.

**Steps Involved**

Follow the steps: 

**step 1 :** download gitbash for easy installation of packages required 

mkdir Remix_tool //create a directory called Remix_tool 

cd Remix_tool //change directory to Remix_tool 

git clone https://github.com/ethereum/browser-solidity //downloading solidity 

browser Install npm: sudo apt-get install nodejs //installing node.js

sudo apt-get install npm // installing Node Package Manager sudo ln -s /usr/bin/nodejs /usr/bin/node //Create a symbolic link for node 

cd browser-solidity npm install npm run prepublish

**step 2:**  open the folder in gitbash now u need to install the packages , for that "npm install yarn" & "yarn init" commands are used install nodemon local server ("npm install nodemon")

**step 3:** run the solidity code in remix IDE and copy the ABI & contract Address and paste then in app.js now in the console run the server (nodemon app.js) open the browser and follow the link (http://127.0.0.1:3000/account)

**Private Block Chain:**

Install geth cli windows (download the .exe file from official site and install) ubuntu : Follow the commands: 1. sudo apt-get install software-properties-common 2. sudo add-apt-repository -y ppa:ethereum/ethereum 3. sudo apt-get update 4. sudo apt-get install ethereum

Open your gitbash and init the genesis file : geth --datadir "chain1" init "genesis.json"

Run the geth console in "8545" rpc port, geth --datadir "chain1" --port 30303 --networkid 1234 --rpc --rpcport "8545" --rpccorsdomain "*" console 2>console.log create few accounts personal.newAccount() //parsephrase (password) eth.setEtherbase(personal.listAccounts[0]) start mining miner.start(4) //parameter indicates no. of threads for mining

Inthe remix IDE change the environment to web3 provider frrom javaScript
