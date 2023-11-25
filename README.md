# docker-vault

Cool videos
- https://www.youtube.com/playlist?list=PLzZ2RIhyht-P8eT_hO7rdlTdbfWBNeCwK

Option A
- use `vault server -dev` and have an init script that creates secrets every run on-fly
  - a) https://stackoverflow.com/questions/72944271/hashicorp-vault-container-dont-save-my-secrets-on-local-volume-when-i-restart-d
    - uses `transit`
    ```shell
    $ docker compose -f docker-compose-vault-dev.yml up --remove-orphans    
    # go to http://localhost:8200/ui/vault/auth?with=token (token is "root")      
    $ docker compose -f docker-compose-vault-dev.yml down --remove-orphans --volumes
    ```
