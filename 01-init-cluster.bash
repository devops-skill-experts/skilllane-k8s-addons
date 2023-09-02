#!/bin/bash

if [[ ${KUBECONFIG} == "" ]]
then
    echo "Please export KUBECONFIG env variable before running script!!!"
    exit 1
fi

export $(xargs <.env)

cd "01-init"

helm dependency update
helm upgrade -i init . -f values-${ENV}.yaml -n argocd --create-namespace
