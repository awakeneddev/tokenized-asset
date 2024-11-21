const hre = require("hardhat");

async function main() {
    // Deploy RealEstateNFT
    const RealEstateNFT = await hre.ethers.getContractFactory("RealEstateNFT");
    const realEstateNFT = await RealEstateNFT.deploy();
    await realEstateNFT.waitForDeployment();
    console.log("RealEstateNFT deployed to:", realEstateNFT.target);

    // Deploy FractionalRealEstate
    const FractionalRealEstate = await hre.ethers.getContractFactory("FractionalRealEstate");
    const fractionalRealEstate = await FractionalRealEstate.deploy(realEstateNFT.target, 0);
    await fractionalRealEstate.waitForDeployment();
    console.log("FractionalRealEstate deployed to:", fractionalRealEstate.target);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
