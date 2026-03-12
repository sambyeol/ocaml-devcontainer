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

target "latest" {
    inherits = ["cross_platform"]
    dockerfile = "./Dockerfile"
    args = {
        OCAML_VERSION = "5.4.2"
    }
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:5.4.2",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.4",
        "ghcr.io/sambyeol/ocaml-devcontainer:5",
        "ghcr.io/sambyeol/ocaml-devcontainer:latest",
    ]
}
