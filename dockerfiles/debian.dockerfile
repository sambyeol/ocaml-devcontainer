FROM debian:latest

LABEL org.opencontainers.image.source=https://github.com/sambyeol/ocaml-devcontainer

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
RUN export FORMAT=$(echo ${LOCALE} | cut -f2 -d.) \
    && export INPUT=$(echo ${LOCALE} | cut -f1 -d.) \
    && localedef -f ${FORMAT} -i ${INPUT} ${LOCALE}
ENV LC_ALL ${LOCALE}

ARG USERNAME=sambyeol
ARG USE_OMZ=true
COPY script-library/debian-*.sh /tmp/script-library/
RUN /tmp/script-library/debian-create-user.sh ${USERNAME} \
    && su ${USERNAME} -c /tmp/script-library/debian-oh-my-zsh.sh ${USE_OMZ} \
    && rm -rf /tmp/script-library

USER ${USERNAME}
ARG OCAML_VERSION=
RUN opam init --disable-sandbox --yes --compiler=${OCAML_VERSION} && echo "eval \$(opam config env)" >> ~/.zshrc

RUN opam install --yes \
        dune \
        ocaml-lsp-server \
        ocamlformat
