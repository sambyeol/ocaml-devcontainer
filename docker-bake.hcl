group "default" {
    targets = [
        "debian",
        "debian_root",
        "ubuntu",
        "ubuntu_root",
        "alpine",
        "alpine_root"
    ]
}

target "cross_platform" {
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
}

target "root" {
    args = {
        USERNAME = "root"
    }
}

target "debian" {
    dockerfile = "./dockerfiles/debian.dockerfile"
}

target "ubuntu" {
    dockerfile = "./dockerfiles/ubuntu.dockerfile"
}

target "alpine" {
    dockerfile = "./dockerfiles/alpine.dockerfile"
}

target "version" {
    args = {
        OCAML_VERSION = "5.0.0"
    }
}

target "debian" {
    inherits = ["version", "debian", "cross_platform"]
    tags =[
        "ghcr.io/sambyeol/ocaml-devcontainer:5.0.0-debian",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.0-debian",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-debian",
        "ghcr.io/sambyeol/ocaml-devcontainer:debian",

        "ghcr.io/sambyeol/ocaml-devcontainer:5.0.0",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.0",
        "ghcr.io/sambyeol/ocaml-devcontainer:5",
        "ghcr.io/sambyeol/ocaml-devcontainer:latest",
    ]
}

target "debian_root" {
    inherits = ["version", "debian", "root", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:5.0.0-debian-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.0-debian-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-debian-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:debian-root",

        "ghcr.io/sambyeol/ocaml-devcontainer:5.0.0-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.0-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:root",
    ]
}

target "ubuntu" {
    inherits = ["version", "ubuntu", "cross_platform"]
    tags =[
        "ghcr.io/sambyeol/ocaml-devcontainer:5.0.0-ubuntu",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.0-ubuntu",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-ubuntu",
        "ghcr.io/sambyeol/ocaml-devcontainer:ubuntu",
    ]
}

target "ubuntu_root" {
    inherits = ["version", "ubuntu", "root", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:5.0.0-ubuntu-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.0-ubuntu-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-ubuntu-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:ubuntu-root",
    ]
}

target "alpine" {
    inherits = ["version", "alpine", "cross_platform"]
    tags =[
        "ghcr.io/sambyeol/ocaml-devcontainer:5.0.0-alpine",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.0-alpine",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-alpine",
        "ghcr.io/sambyeol/ocaml-devcontainer:alpine",
    ]
}

target "alpine_root" {
    inherits = ["version", "alpine", "root", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:5.0.0-alpine-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.0-alpine-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-alpine-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:alpine-root",
    ]
}
