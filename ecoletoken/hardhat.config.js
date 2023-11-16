require("@nomiclabs/hardhat-waffle");
require('dotenv').config();

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.20",
  networks: {
    mumbai: {
      url: 'https://polygon-mumbai.g.alchemy.com/v2/JPxV0ktDGv24NhRucZs0I8s3gvDaclZn',
      accounts: [`0x${process.env.PRIVATE_KEY}`],
      tokenContractAddress: "0x5C6F868585f14DBc296B17224776704A80454FA9"
    },
    xx3token: {
      url: 'https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u',
      accounts: [`0x${process.env.PRIVATE_KEY}`],
      tokenContractAddress: "0xc392D0Aa0fD4922416721b03eb268Bf5C40f732b"
    }


  }
};
