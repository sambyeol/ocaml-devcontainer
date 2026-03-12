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

group "latest" {
    inherits = ["cross_platform"]
    dockerfile = "./Dockerfile"
    args = {
        OCAML_VERSION = "5.4.0"
    }
    tags = [
        "ghcr.io/sambyeol/ocaml-devcontainer:5.4.0",
        "ghcr.io/sambyeol/ocaml-devcontainer:5.4",
        "ghcr.io/sambyeol/ocaml-devcontainer:5",
        "ghcr.io/sambyeol/ocaml-devcontainer:latest",
    ]
}
