FROM ubuntu:latest

USER root

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        git \
        gpg \
        locales \
        m4 \
        opam \
        ssh-client \
        sudo \
        zsh \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/list/*

ARG LOCALE=en_US.UTF-8
RUN locale-gen ${LOCALE}
ENV LC_ALL ${LOCALE}

ARG USERNAME=sambyeol
ARG USE_OMZ=true
COPY script-library/debian-*.sh /tmp/script-library/
RUN /tmp/script-library/debian-create-user.sh ${USERNAME} \
    && su ${USERNAME} -c /tmp/script-library/debian-oh-my-zsh.sh ${USE_OMZ} \
    && rm -rf /tmp/script-library

USER ${USERNAME}
RUN opam init --disable-sandbox --yes --compiler=${OCAML_VERSION} && echo "eval \$(opam config env)" >> ~/.bashrc

RUN opam install --yes \
        dune \
        ocaml-lsp-server \
        ocamlformat \
        ocamlformat-rpc
