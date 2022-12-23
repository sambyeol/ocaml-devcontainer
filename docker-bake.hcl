group "default" {
    targets = [
        "5_0_0_debian",
        "5_0_0_debian_root",
        "5_0_0_ubuntu",
        "5_0_0_ubuntu_root",
        "5_0_0_alpine",
        "5_0_0_alpine_root"
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

// built at 2022-12-23

target "5_0_0" {
    args = {
        OCAML_VERSION = "5.0.0"
    }
}

target "5_0_0_debian" {
    inherits = ["5_0_0", "debian", "cross_platform"]
    tags =[
        "sambyeol/ocaml-devcontainer:5.0.0-debian",
        "sambyeol/ocaml-devcontainer:5.0-debian",
        "sambyeol/ocaml-devcontainer:5-debian",
        "sambyeol/ocaml-devcontainer:debian",

        "sambyeol/ocaml-devcontainer:5.0.0",
        "sambyeol/ocaml-devcontainer:5.0",
        "sambyeol/ocaml-devcontainer:5",
        "sambyeol/ocaml-devcontainer:latest",
    ]
}

target "5_0_0_debian_root" {
    inherits = ["5_0_0", "debian", "root", "cross_platform"]
    tags = [
        "sambyeol/ocaml-devcontainer:5.0.0-debian-root",
        "sambyeol/ocaml-devcontainer:5.0-debian-root",
        "sambyeol/ocaml-devcontainer:5-debian-root",
        "sambyeol/ocaml-devcontainer:debian-root",

        "sambyeol/ocaml-devcontainer:5.0.0-root",
        "sambyeol/ocaml-devcontainer:5.0-root",
        "sambyeol/ocaml-devcontainer:5-root",
        "sambyeol/ocaml-devcontainer:root",
    ]
}

target "5_0_0_ubuntu" {
    inherits = ["5_0_0", "ubuntu", "cross_platform"]
    tags =[
        "sambyeol/ocaml-devcontainer:5.0.0-ubuntu",
        "sambyeol/ocaml-devcontainer:5.0-ubuntu",
        "sambyeol/ocaml-devcontainer:5-ubuntu",
        "sambyeol/ocaml-devcontainer:ubuntu",
    ]
}

target "5_0_0_ubuntu_root" {
    inherits = ["5_0_0", "ubuntu", "root", "cross_platform"]
    tags = [
        "sambyeol/ocaml-devcontainer:5.0.0-ubuntu-root",
        "sambyeol/ocaml-devcontainer:5.0-ubuntu-root",
        "sambyeol/ocaml-devcontainer:5-ubuntu-root",
        "sambyeol/ocaml-devcontainer:ubuntu-root",
    ]
}

target "5_0_0_alpine" {
    inherits = ["5_0_0", "alpine", "cross_platform"]
    tags =[
        "sambyeol/ocaml-devcontainer:5.0.0-alpine",
        "sambyeol/ocaml-devcontainer:5.0-alpine",
        "sambyeol/ocaml-devcontainer:5-alpine",
        "sambyeol/ocaml-devcontainer:alpine",
    ]
}

target "5_0_0_alpine_root" {
    inherits = ["5_0_0", "alpine", "root", "cross_platform"]
    tags = [
        "sambyeol/ocaml-devcontainer:5.0.0-alpine-root",
        "sambyeol/ocaml-devcontainer:5.0-alpine-root",
        "sambyeol/ocaml-devcontainer:5-alpine-root",
        "sambyeol/ocaml-devcontainer:alpine-root",
    ]
}

// built at 2022-11-04

target "4_14_0" {
    args = {
        OCAML_VERSION = "4.14.0"
    }
}

target "4_14_0_debian" {
    inherits = ["4_14_0", "debian", "cross_platform"]
    tags =[
        "sambyeol/ocaml-devcontainer:4.14.0-debian",
        "sambyeol/ocaml-devcontainer:4.14-debian",
        "sambyeol/ocaml-devcontainer:4-debian",
        "sambyeol/ocaml-devcontainer:debian",

        "sambyeol/ocaml-devcontainer:4.14.0",
        "sambyeol/ocaml-devcontainer:4.14",
        "sambyeol/ocaml-devcontainer:4",
        "sambyeol/ocaml-devcontainer:latest",
    ]
}

target "4_14_0_debian_root" {
    inherits = ["4_14_0", "debian", "root", "cross_platform"]
    tags = [
        "sambyeol/ocaml-devcontainer:4.14.0-debian-root",
        "sambyeol/ocaml-devcontainer:4.14-debian-root",
        "sambyeol/ocaml-devcontainer:4-debian-root",
        "sambyeol/ocaml-devcontainer:debian-root",

        "sambyeol/ocaml-devcontainer:4.14.0-root",
        "sambyeol/ocaml-devcontainer:4.14-root",
        "sambyeol/ocaml-devcontainer:4-root",
        "sambyeol/ocaml-devcontainer:root",
    ]
}

target "4_14_0_ubuntu" {
    inherits = ["4_14_0", "ubuntu", "cross_platform"]
    tags =[
        "sambyeol/ocaml-devcontainer:4.14.0-ubuntu",
        "sambyeol/ocaml-devcontainer:4.14-ubuntu",
        "sambyeol/ocaml-devcontainer:4-ubuntu",
        "sambyeol/ocaml-devcontainer:ubuntu",
    ]
}

target "4_14_0_ubuntu_root" {
    inherits = ["4_14_0", "ubuntu", "root", "cross_platform"]
    tags = [
        "sambyeol/ocaml-devcontainer:4.14.0-ubuntu-root",
        "sambyeol/ocaml-devcontainer:4.14-ubuntu-root",
        "sambyeol/ocaml-devcontainer:4-ubuntu-root",
        "sambyeol/ocaml-devcontainer:ubuntu-root",
    ]
}