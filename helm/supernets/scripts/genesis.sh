#!/bin/sh

echo "polygon-edge genesis --dir {{ .Values.edge.data }}/genesis.json --block-gas-limit 10000000 --epoch-size 10 \
  --validators-path {{ .Values.edge.data }} --validators-prefix test-chain- \
  --consensus polybft \
  --premine "{{ .Values.token.premine }}" \
  --proxy-contracts-admin "{{ .Values.token.proxyContractsAdmin}}" \
  --native-token-config "{{ .Values.token.nativeTokenConfig }}" \
  --reward-wallet "{{ .Values.token.rewardWallet }}" \
  --reward-token-code "{{ .Values.token.deployedBytecode }}" \
  > {{ .Values.edge.data }}/genesis.log"