#! /bin/sh

set -e

export VAULT_ADDR=http://vault:8200

# give some time for Vault to start and be ready
sleep 3

# login with root token at $VAULT_ADDR
vault login root

# enable vault transit engine
vault secrets enable transit

# create key1 with type ed25519
vault write -f transit/keys/key1 type=ed25519

# create key2 with type ecdsa-p256
vault write -f transit/keys/key2 type=ecdsa-p256

###################

# Enable kv secret engine
vault secrets enable -path="my-kv" kv

# Enable userpass and add default user
vault policy write my-policy policies/my-policy.hcl
vault policy write my-read-policy policies/my-read-policy.hcl

# Add test value to my-secret
vault kv put my-kv/my-secret my-value=s3cr3t


# Enable userpass functionality
# https://developer.hashicorp.com/vault/tutorials/auth-methods/identity?variants=vault-deploy%3Aselfhosted
vault auth enable -path="userpass-test" userpass

# Create user and assign policies to it
vault write auth/userpass-test/users/my-read-user password=testtest policies=my-read-policy
