FROM quay.io/kairos/ubuntu:24.04-standard-amd64-generic-v3.1.3-k3sv1.31.0-k3s1
WORKDIR /var/lib/rancher/k3s/server/manifests/
RUN curl -L -O https://raw.githubusercontent.com/dragonflydb/dragonfly-operator/v1.1.7/manifests/dragonfly-operator.yaml
RUN echo "---\napiVersion: v1\nkind: Namespace\nmetadata:\n  name: prometheus-operator\n" > prometheus-operator.yaml
RUN curl -L https://github.com/prometheus-operator/prometheus-operator/releases/download/v0.76.2/bundle.yaml | sed -e 's/namespace: default/namespace: prometheus-operator/g' >> prometheus-operator.yaml
RUN curl -L -O https://raw.githubusercontent.com/metallb/metallb-operator/v0.14.2/bin/metallb-operator.yaml
RUN curl -L -O https://github.com/jetstack/cert-manager/releases/download/v1.15.3/cert-manager.yaml
