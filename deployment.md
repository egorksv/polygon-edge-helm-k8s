# Deployment log

### Executed by helm
```bash 

# Successful
polygon-edge polybft-secrets --insecure \
--data-dir ./edge/test-chain- --num 4 --json > ./edge/secrets.json

# Successful
polygon-edge genesis --dir ./edge/genesis.json --block-gas-limit 10000000 --epoch-size 10   \
--validators "/dns/validator-1/tcp/30303/p2p/16Uiu2HAkums3UyNw61h1Cv1TWUekbFfvJ3A6VqFJ7Uyw6CK9pGn6:0xB9704b977DA34F4A48B0DdEE16D86d8C7688449B:0c587cd895e05246fbadd1811c74e7872e821ce186ce678ed6185baf5b3fd1ad279085867f047053d5b0b7b92aa97a7862502f7267ae644c0a5174d5b9819a2f11627a04c2ee589b74ed8e39f3295bcf031c9be6feec8e772e4c06f720cfd5de0e084787303791c94a0189c696faac98e6b975ef62e0427b6f27d851f18459d3" \
--validators "/dns/validator-2/tcp/30303/p2p/16Uiu2HAkySfkNeTXdjrYzTAwxZhSVT1mknP1hJWDgwFpKwZP8xVd:0xb41b65a665f0008E6944201033D0BeD95f24122d:100639e2bc02d66e65d6ae1e47581d18f2f1c8276bc8ea36feaac77a7428258e0d1eb6ddfd64a26cc8955f00e1d998cae4766c8a77c5fa8e9b95aa602bace69d2610e44393bfe115dce3e049aafb14d5fdc54d9ea029ab2ddc0e34b03e7ab40e00581f693ec4775af106149b691b9ae69ef8ef4f6a12a8136ea412762c3c994d" \
--validators "/dns/validator-3/tcp/30303/p2p/16Uiu2HAkuT1T3v1kSqzQgC3mN6igXMvAkgyieGA1StCuyquopNnq:0xb1c681f0008FeaC913bCF0389334522D839c886e:1de2039fc05b073478af54562aeaf7ad2401fd5a28f8390e9b08ddee5548ed201c6758c6b019088ae5f9cee0cf959b9092627d44c85f7ec11badbe98e28588a610079cf25ecd7062a7bb0cc960e0844630f9a450bf93c981be24301bce67bd63050573ad9adff97349fd5fcdd3bde449c8c0242a3881c7d7ec1e830c3a3f2aa9" \
--validators "/dns/validator-4/tcp/30303/p2p/16Uiu2HAm1QWVEvoA8DgNE4peuXjAkfTeJFuEoHFTEYhi8ngT7rpN:0x4c603E53150720719B2560c6Cc7C68c1131c40c8:2d8097816c6444407aa4a07b95f775f7d6a34fa43494dabd8e19c60b39b3c0be0483de70e79cc0f5a5c005ea3adc6f0f6ad5c1f2303a21f17040596b68d23d41003ccd81c4352d8b0efe520f797b92b236474244341824ea1414ee5cb02553d32720b45307782259f406c0ba000987d12747daf852cc175105234e16e0f663ed" \
--proxy-contracts-admin "0xeCD88c24fD8Ce4df39836a6088832D350d3CA1B9"   \
--consensus polybft   --premine "0x0:1000000000000000000000000000"   \
--native-token-config "XX2TestToken:XX2:18:false"   \
--reward-wallet "0xB9704b977DA34F4A48B0DdEE16D86d8C7688449B:1000000"  >  ./edge/genesis.log
```

### Executed manually, `$PWD=/home/edge/polygon/edge`
```bash
# Successful
polygon-edge polybft stake-manager-deploy \
--proxy-contracts-admin 0x71d7684aF0CC12B8C2fb48A393E8A4D3dAcEDDc0 \
--private-key ${PVT_KEY} \
--genesis ./genesis.json \
--jsonrpc https://polygon-mumbai.g.alchemy.com/v2/JPxV0ktDGv24NhRucZs0I8s3gvDaclZn \
--stake-token 0x5C6F868585f14DBc296B17224776704A80454FA9

# Successful
polygon-edge polybft stake-manager-deploy \
--proxy-contracts-admin 0xeCD88c24fD8Ce4df39836a6088832D350d3CA1B9 \
--private-key ${PVT_KEY} \
--genesis ./edge/genesis.json \
--jsonrpc https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u \
--stake-token 0xc392D0Aa0fD4922416721b03eb268Bf5C40f732b

# Successful
# Stake manager is taken from the genesis.json
polygon-edge rootchain deploy \
--deployer-key ${PVT_KEY} \
--stake-manager 0x7282d1c4892517ED6Ab8F6D0f36a5A89EB0194C8 \
--stake-token 0xc392D0Aa0fD4922416721b03eb268Bf5C40f732b \
--proxy-contracts-admin 0xeCD88c24fD8Ce4df39836a6088832D350d3CA1B9 \
--genesis ./edge/genesis.json \
--json-rpc https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u \

# Successful
polygon-edge rootchain fund --addresses 0xB9704b977DA34F4A48B0DdEE16D86d8C7688449B --amounts 100000000000000000 \
--private-key ${PVT_KEY} \
--json-rpc https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u

# Successful
polygon-edge rootchain fund --addresses 0xb41b65a665f0008E6944201033D0BeD95f24122d --amounts 10000000000000000 \
--private-key ${PVT_KEY} \
--json-rpc https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u

# Successful
polygon-edge rootchain fund --addresses 0xb1c681f0008FeaC913bCF0389334522D839c886e --amounts 100000000000000000 \
--private-key ${PVT_KEY} \
--json-rpc https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u \
--stake-token 0xc392D0Aa0fD4922416721b03eb268Bf5C40f732b

# Successful
polygon-edge rootchain fund --addresses 0x4c603E53150720719B2560c6Cc7C68c1131c40c8 --amounts 10000000000000000 \
--private-key ${PVT_KEY} \
--json-rpc https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u

# Validators must be registered before whitelisting

# Successful
polygon-edge polybft register-validator \
--data-dir ./edge/test-chain-1 \
--jsonrpc https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u \
--supernet-manager 0xC0b0cB39885e34e70F1f8176b717188E61e89Eaa

# Successful
polygon-edge polybft register-validator \
--data-dir ./edge/test-chain-2 \
--jsonrpc https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u \
--supernet-manager 0xC0b0cB39885e34e70F1f8176b717188E61e89Eaa

# Successful
polygon-edge polybft register-validator \
--data-dir ./edge/test-chain-3 \
--jsonrpc https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u \
--supernet-manager 0xC0b0cB39885e34e70F1f8176b717188E61e89Eaa

# Successful
polygon-edge polybft register-validator \
--data-dir ./edge/test-chain-4 \
--jsonrpc https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u \
--supernet-manager 0xC0b0cB39885e34e70F1f8176b717188E61e89Eaa

# Successful
polygon-edge polybft whitelist-validators \
--private-key ${PVT_KEY} \
--jsonrpc https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u \
--addresses 0xB9704b977DA34F4A48B0DdEE16D86d8C7688449B,0xb41b65a665f0008E6944201033D0BeD95f24122d,0xb1c681f0008FeaC913bCF0389334522D839c886e,0x4c603E53150720719B2560c6Cc7C68c1131c40c8 \
--supernet-manager 0xC0b0cB39885e34e70F1f8176b717188E61e89Eaa

# Show validator info to ensure it is whitelisted
polygon-edge polybft validator-info \
--data-dir ./edge/test-chain-1 \
--jsonrpc https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u \
--stake-manager 0x7282d1c4892517ED6Ab8F6D0f36a5A89EB0194C8 \
--supernet-manager 0xC0b0cB39885e34e70F1f8176b717188E61e89Eaa \

```

### None of the following commands were able to execute successfully

```bash
# This results in the following error:
#     failed to estimate gas: {"code":-32000,"message":"execution reverted"}
polygon-edge polybft stake \
--data-dir ./edge/test-chain-1 \
--jsonrpc https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u \
--supernet-id 1 \
--amount 100 \
--stake-manager 0x7282d1c4892517ED6Ab8F6D0f36a5A89EB0194C8 \
--stake-token 0xC0b0cB39885e34e70F1f8176b717188E61e89Eaa


# This results in error:
#   could not get finalized stake for validator: 0xB9704b977DA34F4A48B0DdEE16D86d8C7688449B. Error: could not parse
polygon-edge polybft supernet \
--private-key ${PVT_KEY} \
--jsonrpc https://polygon-mumbai.g.alchemy.com/v2/2yM83Wvw9OhhSqc5uOpi8AGomw6ecu1u \
--genesis ./edge/genesis.json \
--supernet-manager 0xC0b0cB39885e34e70F1f8176b717188E61e89Eaa \
--finalize-genesis-set --enable-staking

# This is ran by Helm in validator-X deployments generating the following errors:
#│ 2023-11-16T16:28:20.615Z [ERROR] polygon.server.polybft: failed to run sequence - validator manager init: height=1 error="total voting power is zero or less"                                                                    │
polygon-edge server \
--data-dir ./edge/test-chain-1 \
--chain ./edge/genesis.json \
--grpc-address 0.0.0.0:10000 \
--libp2p 0.0.0.0:30301 --jsonrpc 0.0.0.0:10002 --seal --log-level DEBUG
```