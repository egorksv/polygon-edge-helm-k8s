#!/bin/sh
set -ex

VALIDATORS=$(cat {{ .Values.edge.data }}/secrets.json | jq -r 'keys[] as $i | "--validators \"/dns/validator-\($i+1)/tcp/30303/p2p/\(.[$i].node_id):\(.[$i].address):\(.[$i].bls_pubkey)\" \\"')
# Use 1st validator node as reward wallet
REWARD_WALLET_ADDR=$(cat {{ .Values.edge.data }}/secrets.json| jq -r '.[0].address')

cat <<EOF > {{ .Values.edge.data }}/run-genesis.sh
#!/bin/sh
set -ex

polygon-edge genesis --dir {{ .Values.edge.data }}/genesis.json --block-gas-limit 10000000 --epoch-size 10 \
  $VALIDATORS
  --consensus polybft \
  --premine "{{ .Values.token.premine }}" \
  --proxy-contracts-admin "{{ .Values.token.proxyContractsAdmin}}" \
  --native-token-config "{{ .Values.token.nativeTokenConfig }}" \
  --reward-wallet "${REWARD_WALLET_ADDR}:1000000" \
  --reward-token-code "{{ .Values.token.deployedBytecode }}" \
  > {{ .Values.edge.data }}/genesis.log
EOF

chmod +x {{ .Values.edge.data }}/run-genesis.sh


