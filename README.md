# docker-vault

A docker-compose playground to spin up vault on localhost.

Cool videos
- https://www.youtube.com/playlist?list=PLzZ2RIhyht-P8eT_hO7rdlTdbfWBNeCwK

## Option A
- use `vault server -dev` and have an init script that creates secrets every run on-fly
  - a) https://stackoverflow.com/questions/72944271/hashicorp-vault-container-dont-save-my-secrets-on-local-volume-when-i-restart-d
    - uses `transit`
    ```shell
    $ docker compose -f docker-compose-vault-dev.yml up --remove-orphans    
    # go to http://localhost:8200/ui/vault/auth?with=token (token is "root")      
    $ docker compose -f docker-compose-vault-dev.yml down --remove-orphans --volumes
    ```

## Option B
- use `vault server` (aka production mode) with docker-compose named volume
  - a) https://github.com/ahmetkaftan/docker-vault/blob/master/vault-init.sh
    - doesn't use anything 
      ```shell
      $ docker compose -f docker-compose-vault.yml up --remove-orphans    
      $ docker compose -f docker-compose-vault.yml down --remove-orphans --volumes
      ```

Another example
b) https://github.com/with-shrey/VaultDevSetup-Docker/blob/main/vault-config/vault-setup.sh
  - uses `transit` and `approle`
