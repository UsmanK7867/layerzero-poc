**LayerZero POC**

**Resources**




- <https://jamesbachini.com/layerzero-example/>
  - It has two examples. In the first example you send a message to the cross chain and in the second your burn token on one chain and mint on the other.
- <https://layerzero.gitbook.io/docs/technical-reference/testnet/testnet-addresses>
  - In the above example the cross chain connection is between optimism and goreili but you can change that you can select the chain of your choice using this link you can get the testnet endpoint addresses and their chainids. 
- <https://layerzero.gitbook.io/docs/technical-reference/mainnet/supported-chain-ids>.
  - For mainnet use this link
- <https://testnet.layerzeroscan.com/> 
  - When you send a payload you can use the tx hash in this layer zero testnet explorer  and find the status of your transaction status should  be delivered if the tx is successful
- <https://layerzeroscan.com/>.
  - For mainnet use this Explorer

**Interacting with Layer Zero**




- ` `I have passed an array of two addresses and token ids from fantom to polygon.
- Both Contracts work as a source and destination.
- After deploying the contracts we have to call the trustAddress function from both contracts and pass the address of contract A to contract B trustAddress function and address of contract B to contract A trustAddress function. 
- We can use the send function to send data to other chain.
- One more thing when sending a payload the function is payable you need to send some Native currency with it. For my example 0.1 eth work they will transfer back the eth if there are any left.

**Deployed Contracts**

**Mumbai:     <https://mumbai.polygonscan.com/address/0xA4b1824d9464E97d8a0E575921B4B156089dC919>** 

**Fantom:**

<https://testnet.ftmscan.com/address/0x41b5d465881c27ee0b754c4c9433eedc55aa22ab> 

**Layerzero tx: <https://testnet.layerzeroscan.com/10112/address/0x41b5d465881c27ee0b754c4c9433eedc55aa22ab/message/10109/address/0xa4b1824d9464e97d8a0e575921b4b156089dc919/nonce/1>**

**How to extract Message/data?**

Layer zero call this function ![https://lh4.googleusercontent.com/jGz7vhGEC8bmLqk9kohLsAUvn9ru0kjXCBDB72RF04DGsI3v8_KSDoI_Nz6dVMG6XwrNxCZCShVVW2qIj-vdZrwtrCWftZS59n3HR20c--lf3lUfCMqDzvk2aGzpTxeUcHEha0KRaHWdMN1Uwv4DPvs](Aspose.Words.74efa531-b1ae-4ee7-bc71-d7179e036dda.001.png)

- Payload will contain all the data you can extract and manipulate it accordingly like in the above case \_payload  contains an array of addresses and tokenIds so we store it in an array of addresses and ids.
- If there is NFT address and NFT id we can store payload as this
  - **(address,id) = abi.decode(\_payload, (address,uint));**

