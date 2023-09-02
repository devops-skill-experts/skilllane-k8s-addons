#!/bin/bash

export $(xargs <.env)

cd "01-init"

helm dependency update
helm upgrade -i init . -f values-${ENV}.yaml -n argocd --create-namespace
