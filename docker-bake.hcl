group "default" {
    targets = [
        "latest",
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
        HOMEDIR = ""
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

group "latest" {
    targets = [
        "latest_debian",
        "latest_debian_root",
        "latest_ubuntu",
        "latest_ubuntu_root",
        "latest_alpine",
        "latest_alpine_root"
    ]
}

target "latest_version" {
    args = {
        OCAML_VERSION = "5.1.1"
    }
}

target "latest_debian" {
    inherits = ["latest_version", "debian", "cross_platform"]
    tags =[
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.1-debian",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1-debian",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-debian",
        "ghcr.io/sambyeol/ocaml-devcontainer:debian",

        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.1",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1",
        "ghcr.io/sambyeol/ocaml-devcontainer:5",
        "ghcr.io/sambyeol/ocaml-devcontainer:latest",
    ]
}

target "latest_debian_root" {
    inherits = ["latest_version", "debian", "root", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.1-debian-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1-debian-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-debian-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:debian-root",

        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.1-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:root",
    ]
}

target "latest_ubuntu" {
    inherits = ["latest_version", "ubuntu", "cross_platform"]
    tags =[
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.1-ubuntu",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1-ubuntu",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-ubuntu",
        "ghcr.io/sambyeol/ocaml-devcontainer:ubuntu",
    ]
}

target "latest_ubuntu_root" {
    inherits = ["latest_version", "ubuntu", "root", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.1-ubuntu-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1-ubuntu-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-ubuntu-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:ubuntu-root",
    ]
}

target "latest_alpine" {
    inherits = ["latest_version", "alpine", "cross_platform"]
    tags =[
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.1-alpine",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1-alpine",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-alpine",
        "ghcr.io/sambyeol/ocaml-devcontainer:alpine",
    ]
}

target "latest_alpine_root" {
    inherits = ["latest_version", "alpine", "root", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.1-alpine-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1-alpine-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-alpine-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:alpine-root",
    ]
}
