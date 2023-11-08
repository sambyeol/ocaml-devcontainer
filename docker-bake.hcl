group "default" {
    targets = [
        "latest",
        "support"
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
        OCAML_VERSION = "5.1.0"
    }
}

target "latest_debian" {
    inherits = ["latest_version", "debian", "cross_platform"]
    tags =[
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.0-debian",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1-debian",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-debian",
        "ghcr.io/sambyeol/ocaml-devcontainer:debian",

        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.0",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1",
        "ghcr.io/sambyeol/ocaml-devcontainer:5",
        "ghcr.io/sambyeol/ocaml-devcontainer:latest",
    ]
}

target "latest_debian_root" {
    inherits = ["latest_version", "debian", "root", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.0-debian-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1-debian-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-debian-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:debian-root",

        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.0-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:root",
    ]
}

target "latest_ubuntu" {
    inherits = ["latest_version", "ubuntu", "cross_platform"]
    tags =[
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.0-ubuntu",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1-ubuntu",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-ubuntu",
        "ghcr.io/sambyeol/ocaml-devcontainer:ubuntu",
    ]
}

target "latest_ubuntu_root" {
    inherits = ["latest_version", "ubuntu", "root", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.0-ubuntu-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1-ubuntu-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-ubuntu-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:ubuntu-root",
    ]
}

target "latest_alpine" {
    inherits = ["latest_version", "alpine", "cross_platform"]
    tags =[
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.0-alpine",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1-alpine",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-alpine",
        "ghcr.io/sambyeol/ocaml-devcontainer:alpine",
    ]
}

target "latest_alpine_root" {
    inherits = ["latest_version", "alpine", "root", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1.0-alpine-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.1-alpine-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:5-alpine-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:alpine-root",
    ]
}


group "support" {
    targets = [
        "support_debian",
        "support_debian_root",
        "support_ubuntu",
        "support_ubuntu_root",
        "support_alpine",
        "support_alpine_root"
    ]
}

target "support_version" {
    args = {
        OCAML_VERSION = "4.14.1"
    }
}

target "support_debian" {
    inherits = ["support_version", "debian", "cross_platform"]
    tags =[
        "ghcr.io/sambyeol/ocaml-devcontainer:4.14.1-debian",
        "ghcr.io/sambyeol/ocaml-devcontainer:4.14-debian",
        "ghcr.io/sambyeol/ocaml-devcontainer:4-debian",

        "ghcr.io/sambyeol/ocaml-devcontainer:4.14.1",
        "ghcr.io/sambyeol/ocaml-devcontainer:4.14",
        "ghcr.io/sambyeol/ocaml-devcontainer:4",
    ]
}

target "support_debian_root" {
    inherits = ["support_version", "debian", "root", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:4.14.1-debian-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:4.14-debian-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:4-debian-root",

        "ghcr.io/sambyeol/ocaml-devcontainer:4.14.1-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:4.14-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:4-root",
    ]
}

target "support_ubuntu" {
    inherits = ["support_version", "ubuntu", "cross_platform"]
    tags =[
        "ghcr.io/sambyeol/ocaml-devcontainer:4.14.1-ubuntu",
        "ghcr.io/sambyeol/ocaml-devcontainer:4.14-ubuntu",
        "ghcr.io/sambyeol/ocaml-devcontainer:4-ubuntu",
    ]
}

target "support_ubuntu_root" {
    inherits = ["support_version", "ubuntu", "root", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:4.14.1-ubuntu-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:4.14-ubuntu-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:4-ubuntu-root",
    ]
}

target "support_alpine" {
    inherits = ["support_version", "alpine", "cross_platform"]
    tags =[
        "ghcr.io/sambyeol/ocaml-devcontainer:4.14.1-alpine",
        "ghcr.io/sambyeol/ocaml-devcontainer:4.14-alpine",
        "ghcr.io/sambyeol/ocaml-devcontainer:4-alpine",
    ]
}

target "support_alpine_root" {
    inherits = ["support_version", "alpine", "root", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:4.14.1-alpine-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:4.14-alpine-root",
        "ghcr.io/sambyeol/ocaml-devcontainer:4-alpine-root",
    ]
}
