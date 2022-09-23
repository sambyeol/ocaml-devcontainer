# Devcontainer with OCaml
Pre-installed OCaml with OCaml package manager (`opam`) for [devcontainer](https://code.visualstudio.com/docs/remote/containers).
You can find the images in [Docker Hub](https://hub.docker.com/r/sambyeol/ocaml-devcontainer).

## Quickstart
Make a devcontainer setting file at `.devcontainer/devcontainer.json` in your project.
```json
{
    "image": "sambyeol/ocaml-devcontainer:nonroot",
    "customizations": {
        "vscode": {
            "extensions": {
                "ocamllabs.ocaml-platform"
            }
        }
    }
}
```
Then, reopen in container.

## Cross-compile Images
All images are cross-compiled with `docker-buildx`.
### Requirements
Some system libraries for emulation are needed.
```sh
$ sudo apt-get update
$ sudo apt-get install -y binfmt-support qemu qemu-user-static
```

### Compile
You can build images for `linux/amd64` and `linux/arm64` architectures with the following command.
```sh
$ docker buildx bake --push
```
