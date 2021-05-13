# template-container-image

Template for k8s-at-home containers. You can use it to as base to create your container.

The [.github](.github) folder will get PRs from the template so you get the latest workflows.

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


