# Polygon Edge - Minikube

## Running on M1 Mac
### Prerequisites
- [Docker Desktop](https://docs.docker.com/desktop/mac/apple-silicon/)

### Installation

```bash
brew install kubernetes-cli
brew install helm
brew install minikube

mkdir -p ./volumes/polygon-edge

# Start minikube with pre-configured volumes for polygon-edge
minikube start --mount=true \
  --mount-string=$(PWD)/volumes/polygon-edge:/polygon-edge \
  --mount-uid='100' --mount-gid='101'

kubectl create ns dev

helm upgrade --install -n dev supernets ./helm/supernets
```