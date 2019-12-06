# Geth

Geth is an implementation of an Ethereum node in the Go programming language.
In simpler terms, Geth is a program which serves as a node for the Ethereum blockchain, and via which a user can mine Ether and create software which runs on the EVM – the Ethereum Virtual Machine.

Install Geth and other development tools:

**1.Geth**(Refer the installation command folder here)

**2.Ganache**

   Ganache is a personal blockchain for Ethereum development you can use to deploy contracts, develop your applications, and run tests. It is available as both a desktop application as well as a command-line tool (formerly known as the TestRPC). Ganache is available for Windows, Mac, and Linux.
Simply go to this site: https://www.trufflesuite.com/ganache and download ganache for your system(windows/linux (P.S. I have used windows system here and all instructions are for Windows)
Ganache gives us 10 accounts each having 100 ethers. So, we do not need to mine ethers like we have to do in case of Geth

**3.Truffle**

 Now that we have our very own private blockchain, we need a development environment for our project. For that I have used Truffle. But there are some requirements for Truffle. It needs nodejs and npm to be installed first.
To install go to: https://www.npmjs.com/get-npm All information related to what is npm and why we need it is given there.

To setup a private blockchain,steps are as follows:

Used **puppeth** to manually create an Etherum proof of work/proof of Authority (Clique) Neywork.

-Do the pre-works to get the network up and running as desired and create the genesis block.(Here the network id i am using is 4224)

![Screenshot from 2019-12-04 20-55-29](https://user-images.githubusercontent.com/39323310/70155687-bd209e80-16d8-11ea-92b1-62448cca88bd.png)

(in chanskill.json file attached)

Let me explain the contents of the Genesis block  in brief:

**config:** This is the main blockchain configuration and it has the following properties

**chainId:** The chain identifier, it has to be an integer. It is also used to protect against replay attack. I will not be going into replay attach in this tutorial.
There are a host of other properties like homesteadBlock and eip155Block that can be added to the config but they are only/mostly relevant to the main network, so we’ll ignore them for now. This link provides more details.

**alloc:** This is used to allocate ETH to addresses i.e. to pre-fund accounts.

**coinbase:** also known as etherbase is the default primary account. You will get a warning if this value is not set but that can be safely ignored for now, you can set it later.

**difficulty:** This determines how difficult it is to mine a block. For a private blockchain it is better to set it to a low number to ensure blocks are mined quickly which utlimately translates to faster transactions.

**extraData:** Block extra data, it defaults to the client version if not provided.

**gasLimit:** This dictates the maximum amount of gas that can be used in each block. The higher the value the more transactions can be squeezed into a block.

**mixHash:** Not relevant to a new private network, set to 0

**parentHash:** Not relevant to a new private network, set to 0.

For Firing the setup-

  **geth --datadir . init chainskill.json**
  
For ceating new command(using geth console)

  **geth --datadir . account new**
  
  Then start the startnode.sh script file.(Attached)

**To Eliminate error- "Fatal: Account unlock with HTTP access is forbidden! "**

    "--allow-insecure-unlock" 
  
   
![Screenshot from 2019-12-04 19-16-41](https://user-images.githubusercontent.com/39323310/70161033-71262780-16e1-11ea-9e06-e4ce35f613cd.png)

wait for the completion of first epoch:
Mining process will start as shown here-

![Screenshot from 2019-12-04 19-20-43](https://user-images.githubusercontent.com/39323310/70161155-9e72d580-16e1-11ea-8d01-7afe60b38ad6.png)

Finally attach to geth console from other terminal -

  The console has a number of libraries you can use to interact with the blockchain. The first library we will be using is eth.
Here are a subset of the functionality the eth library provides. Try them on your console.

**eth.accounts // returns the list of accounts on this blockchain**

**eth.getBalance(eth.accounts[0]) // returns the balance of the  first account**

**eth.blockNumber // returns the current block number. 0 for a new blockchain**


If you check the balance of any accounts you have created thus far you will notice they all have balances of 0 but to do anything interesting on an ethereum blockchain you need ether. So lets go mining.

**Mining**

To mine, you’ll use the miner library. 
To start mining run

miner.start(1) // 1 means run one mining thread

to stop mining run

miner.stop()

**Sending Ether**

If you only created one account, then create a second account. Confirm the balance of this account running eth.getBalance(‘address’) then send some ether using

**eth.sendTransaction({from:”address”, to:”address”, value: web3.toWei(amount, "ether")})**

**eth.sendTransaction({from:eth.accounts[0], to:eth.accounts[1], value: web3.toWei(10, "ether")})**


If you try running the example, you will get an authentication error. Before you transfer ether from an account, for obvious reasons you need to unlock the account first. To unlock the sender account in this scenario, we will use the personal library. Run the command below

**personal.unlockAccount(eth.accounts[0], "password")**

That should return true if the account was successfully unlocked. Attempt to send ether again and check the balance of both accounts.

**eth.sendTransaction({from:eth.accounts[0], to:eth.accounts[1], value: web3.toWei(10, "ether")})**

The last command should return a hash of the transaction.Later you can check the ether balance of each accounts for transaction verification.

![Screenshot from 2019-12-04 22-02-54](https://user-images.githubusercontent.com/39323310/70162098-1e4d6f80-16e3-11ea-9374-f807a8a13f54.png)

