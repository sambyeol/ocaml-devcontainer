FROM ubuntu:latest

USER root

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        git \
        gpg \
        m4 \
        opam \
        sudo \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/list/*

ARG USERNAME=sambyeol
ARG USE_OMB=true
COPY script-library/debian-*.sh /tmp/script-library/
RUN /tmp/script-library/debian-create-user.sh ${USERNAME} \
    && su ${USERNAME} -c /tmp/script-library/debian-oh-my-bash.sh ${USE_OMB} \
    && rm -rf /tmp/script-library

USER ${USERNAME}
RUN opam init --disable-sandbox --yes --compiler=${OCAML_VERSION} && echo "eval \$(opam config env)" >> ~/.bashrc
