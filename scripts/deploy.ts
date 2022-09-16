import { ethers } from "hardhat";

async function main() {
  const token = await ethers.getContractFactory("Ultratoken");
  const Token = await token.deploy();

  await Token.deployed();

  console.log(`Token deployed to ${Token.address}`);
}

//ContractCreator:  0x12896191de42EF8388f2892Ab76b9a728189260A
// ultraToken Address = 0xE0e76281EBEaAbf02A6F901A907A9Fed2F566fb6
// Proxy Address: 0xdfDE7998995E44B80161a3e0bd757FB0C737930D
// UpgradeAddress: 0x0A66BA44B9be802aa8575b2e5954504C2d859118


main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
