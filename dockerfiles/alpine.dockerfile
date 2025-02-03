FROM alpine:3.21

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
ARG HOMEDIR=/home
ARG USE_OMZ=true
COPY script-library/alpine-*.sh /tmp/script-library/
RUN /tmp/script-library/alpine-create-user.sh ${USERNAME} \
    && su ${USERNAME} -c /tmp/script-library/alpine-oh-my-zsh.sh ${USE_OMZ} \
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
