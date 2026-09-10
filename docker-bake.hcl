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
        OCAML_VERSION = "5.5.0"
    }
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:5.5.0",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.5",
        "ghcr.io/sambyeol/ocaml-devcontainer:5",
        "ghcr.io/sambyeol/ocaml-devcontainer:latest",
    ]
}
