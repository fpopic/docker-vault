#!/usr/bin/env sh

set +x
set -e

vault operator init > /vault/file/keys

vault operator unseal "$(grep 'Key 1:' /vault/file/keys | awk '{print $NF}')"
vault operator unseal "$(grep 'Key 2:' /vault/file/keys | awk '{print $NF}')"
vault operator unseal "$(grep 'Key 3:' /vault/file/keys | awk '{print $NF}')"

export ROOT_TOKEN=$(grep 'Initial Root Token:' /vault/file/keys | awk '{print $NF}')
vault login "$ROOT_TOKEN"

vault token create -id "$MY_VAULT_TOKEN"

vault status > /vault/file/status
