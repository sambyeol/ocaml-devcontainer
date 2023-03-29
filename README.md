# Devcontainer with OCaml
Pre-installed OCaml with OCaml package manager (`opam`) for [devcontainer](https://code.visualstudio.com/docs/remote/containers).
You can find the images in `ghcr.io/sambyeol/ocaml-devcontainer`.

## Quickstart
Make a devcontainer setting file at `.devcontainer/devcontainer.json` in your project.
```json
{
    "image": "ghcr.io/sambyeol/ocaml-devcontainer",
    "customizations": {
        "vscode": {
            "extensions": [
                "ocamllabs.ocaml-platform"
            ]
        }
    }
}
```
Then, reopen in container.

## Tags
Tags are named by `<version>-<distribution>[-root]`.
* Images are tagged with its OCaml version. For example, `latest` tags mean that the image is created with the latest version of OCaml.
* There are various base OS distributions. available distributions are as follows:
  * `debian`: latest Debian (default)
  * `ubuntu`: latest Ubuntu LTS
* `-root` images come without non-root user `sambyeol`.

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
