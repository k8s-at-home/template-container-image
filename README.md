# template-container-image

Template for k8s-at-home containers. You can use it to as base to create your container.

The [.github](.github) folder will get PRs from the template so you get the latest workflows.

## Prereqs

You need to create the following secrets:
- GH_PAT # Needed for [PRs from template](https://github.com/marketplace/actions/repo-file-sync-action)
- GHCR_USER # Needed to upload container to the Github Container Registry
- GHCR_TOKEN # Needed to upload container to the Github Container Registry

## How to build

1. Build and test local
    ```bash
    make
    ```
2. Build the container
    ```bash
    make docker-build
    ```

Check the [Makefile] for other build targets


