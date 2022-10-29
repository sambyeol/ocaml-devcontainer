group "default" {
    targets = [
        "4_14_0_debian",
        "4_14_0_debian_root",
        "4_14_0_ubuntu",
        "4_14_0_ubuntu_root"
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

target "4_14_0" {
    args = {
        OCAML_VERSION = "4.14.0"
    }
}

target "debian" {
    dockerfile = "./dockerfiles/debian.dockerfile"
}

target "ubuntu" {
    dockerfile = "./dockerfiles/ubuntu.dockerfile"
}

target "4_14_0_debian" {
    inherits = ["4_14_0", "debian", "cross_platform"]
    tags =[
        "sambyeol/ocaml-devcontainer:4.14.0-debian",
        "sambyeol/ocaml-devcontainer:4.14.0",
        "sambyeol/ocaml-devcontainer:latest-debian",
        "sambyeol/ocaml-devcontainer:latest"
    ]
}

target "4_14_0_debian_root" {
    inherits = ["4_14_0", "debian", "root", "cross_platform"]
    tags = [
        "sambyeol/ocaml-devcontainer:4.14.0-debian-root",
        "sambyeol/ocaml-devcontainer:4.14.0-root",
        "sambyeol/ocaml-devcontainer:latest-debian-root",
        "sambyeol/ocaml-devcontainer:latest-root"
    ]
}

target "4_14_0_ubuntu" {
    inherits = ["4_14_0", "ubuntu", "cross_platform"]
    tags =[
        "sambyeol/ocaml-devcontainer:4.14.0-ubuntu",
        "sambyeol/ocaml-devcontainer:4.14.0"
    ]
}

target "4_14_0_ubuntu_root" {
    inherits = ["4_14_0", "ubuntu", "root", "cross_platform"]
    tags = [
        "sambyeol/ocaml-devcontainer:4.14.0-ubuntu-root",
        "sambyeol/ocaml-devcontainer:4.14.0-root"
    ]
}