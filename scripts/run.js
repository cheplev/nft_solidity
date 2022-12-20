const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory('MyEpicNFT');
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("contract deployed to:", nftContract.address);

    let txn = await nftContract.makeAnEpicNFT()

    await txn.wait()

    let txn1 = await nftContract.makeAnEpicNFT()

    await txn1.wait()

    let txn2 = await nftContract.makeAnEpicNFT()

    await txn2.wait()

    let txn3 = await nftContract.makeAnEpicNFT()

    await txn3.wait()

    let totalNFT = await nftContract.getTotalNumberNFTMinted();

    console.log('total NFT', totalNFT);
};

const runMain = async () => {
        try{
            await main();
            process.exit(0);
        } catch(error) {
            console.log(error);
            process.exit(1);
        }

};

runMain();