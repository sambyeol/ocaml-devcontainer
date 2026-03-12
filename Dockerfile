FROM debian:forky

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
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/list/*

ARG LOCALE=en_US.UTF-8
RUN export FORMAT=$(echo ${LOCALE} | cut -f2 -d.) \
    && export INPUT=$(echo ${LOCALE} | cut -f1 -d.) \
    && localedef -f ${FORMAT} -i ${INPUT} ${LOCALE}
ENV LC_ALL ${LOCALE}

ARG USERNAME=sambyeol
RUN useradd -G sudo -m -d /home/${USERNAME} -k /etc/skel ${USERNAME} \
    && sed -i -e 's/%sudo.*/%sudo\tALL=(ALL:ALL)\tNOPASSWD:ALL/g' /etc/sudoers \
    && su ${USERNAME} -s /bin/sh -c "touch /home/${USERNAME}/.sudo_as_admin_successful"

USER ${USERNAME}
ARG OCAML_VERSION=
RUN opam init --disable-sandbox --yes --compiler=${OCAML_VERSION}
ENV OPAM_SWITCH_PREFIX="/home/${USERNAME}/.opam/${OCAML_VERSION}"
ENV CAML_LD_LIBRARY_PATH="${OPAM_SWITCH_PREFIX}/lib/stublibs:${OPAM_SWITCH_PREFIX}/lib/ocaml/stublibs:${OPAM_SWITCH_PREFIX}/lib/ocaml"
ENV OCAML_TOPLEVEL_PATH="${OPAM_SWITCH_PREFIX}/lib/toplevel"
ENV MANPATH="${MANPATH}:${OPAM_SWITCH_PREFIX}/man"
ENV PATH="${OPAM_SWITCH_PREFIX}/bin:${PATH}"

RUN opam install --yes \
        dune \
        ocaml-lsp-server \
        ocamlformat
