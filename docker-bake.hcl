group "default" {
    targets = [
        "4_14_0_ubuntu",
        "4_14_0_ubuntu_nonroot"
    ]
}

target "cross_platform" {
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
}

target "nonroot" {
    args = {
        USERNAME = "sambyeol"
    }
}

target "debian" {
    dockerfile = "./dockerfiles/debian.dockerfile"
}

target "ubuntu" {
    dockerfile = "./dockerfiles/ubuntu.dockerfile"
}

target "4_14_0_debian" {
    inherits = ["cross_platform", "debian"]
    tags =[
        "sambyeol/ocaml-devcontainer:4.14.0-debian",
        "sambyeol/ocaml-devcontainer:4.14.0",
        "sambyeol/ocaml-devcontainer:latest-debian",
        "sambyeol/ocaml-devcontainer:latest"
    ]
}

target "4_14_0_debian_nonroot" {
    inherits = ["cross_platform", "debian", "nonroot"]
    tags = [
        "sambyeol/ocaml-devcontainer:4.14.0-debian-nonroot",
        "sambyeol/ocaml-devcontainer:4.14.0-nonroot",
        "sambyeol/ocaml-devcontainer:latest-debian-nonroot",
        "sambyeol/ocaml-devcontainer:latest-nonroot"
    ]
}

target "4_14_0_ubuntu" {
    inherits = ["cross_platform", "ubuntu"]
    tags =[
        "sambyeol/ocaml-devcontainer:4.14.0-ubuntu",
        "sambyeol/ocaml-devcontainer:4.14.0"
    ]
}

target "4_14_0_ubuntu_nonroot" {
    inherits = ["cross_platform", "ubuntu", "nonroot"]
    tags = [
        "sambyeol/ocaml-devcontainer:4.14.0-ubuntu-nonroot",
        "sambyeol/ocaml-devcontainer:4.14.0-nonroot"
    ]
}