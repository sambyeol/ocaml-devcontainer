FROM alpine:latest

LABEL org.opencontainers.image.source=https://github.com/sambyeol/ocaml-devcontainer

USER root

RUN apk add \
        bash \
        build-base \
        ca-certificates \
        curl \
        git \
        gpg \
        m4 \
        opam \
        openssh-client \
        sudo \
        zsh 

ARG USERNAME=sambyeol
ARG USE_OMZ=true
COPY script-library/alpine-*.sh /tmp/script-library/
RUN /tmp/script-library/alpine-create-user.sh ${USERNAME} \
    && su ${USERNAME} -c /tmp/script-library/alpine-oh-my-zsh.sh ${USE_OMZ} \
    && rm -rf /tmp/script-library

USER ${USERNAME}
ARG OCAML_VERSION=
RUN opam init --disable-sandbox --yes --compiler=${OCAML_VERSION} && echo "eval \$(opam config env)" >> ~/.zshrc

RUN opam install --yes \
        dune \
        ocaml-lsp-server \
        ocamlformat
