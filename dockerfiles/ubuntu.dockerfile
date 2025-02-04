FROM ubuntu:noble

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
RUN locale-gen ${LOCALE}
ENV LC_ALL ${LOCALE}

ARG USERNAME=sambyeol
ARG HOMEDIR=/home
ARG USE_OMZ=true
COPY script-library/debian-*.sh /tmp/script-library/
RUN /tmp/script-library/debian-create-user.sh ${USERNAME} \
    && su ${USERNAME} -c /tmp/script-library/debian-oh-my-zsh.sh ${USE_OMZ} \
    && rm -rf /tmp/script-library

USER ${USERNAME}
ARG OCAML_VERSION=
RUN opam init --disable-sandbox --yes --compiler=${OCAML_VERSION}
ENV OPAM_SWITCH_PREFIX="${HOMEDIR}/${USERNAME}/.opam/${OCAML_VERSION}"
ENV CAML_LD_LIBRARY_PATH="${OPAM_SWITCH_PREFIX}/lib/stublibs:${OPAM_SWITCH_PREFIX}/lib/ocaml/stublibs:${OPAM_SWITCH_PREFIX}/lib/ocaml"
ENV OCAML_TOPLEVEL_PATH="${OPAM_SWITCH_PREFIX}/lib/toplevel"
ENV MANPATH="${MANPATH}:${OPAM_SWITCH_PREFIX}/man"
ENV PATH="${OPAM_SWITCH_PREFIX}/bin:${PATH}"

RUN opam install --yes \
        dune \
        ocaml-lsp-server \
        ocamlformat
