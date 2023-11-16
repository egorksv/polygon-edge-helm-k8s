helm upgrade --install -n dev supernets ./helm/supernets --values ./helm/envs/xx2-test-token/values-xx2.yaml

helm delete -n dev supernets

helm template -n dev supernets ./helm/supernets --values ./helm/envs/xx2-test-token/values-xx2.yaml

