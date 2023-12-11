#!/bin/bash

# Gera o hash do conteúdo do ConfigMap ou Secret
HASH=$(kubectl get secret rabbitmq -o json | sha256sum | cut -d' ' -f1)
echo "Hash: $HASH"

# Atualiza o valor do hash no arquivo values.yaml
sed -i "s/hashLabel:.*/hashLabel: \"$HASH\"/g" values/values-rabbitmq.yaml

echo "Hash atualizado no values-rabbitmq.yaml"