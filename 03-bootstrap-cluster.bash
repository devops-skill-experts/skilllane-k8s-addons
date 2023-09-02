#!/bin/bash

export $(xargs <.env)

cd "02-bootstrap"
helm upgrade -i bootstrap . -f values-${ENV}.yaml -n argocd
