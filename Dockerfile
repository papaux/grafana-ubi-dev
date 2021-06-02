FROM registry.access.redhat.com/ubi8/go-toolset

USER root

# Install Nodejs environmnet with yarn
RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash - \
   && curl -sL https://dl.yarnpkg.com/rpm/yarn.repo -o /etc/yum.repos.d/yarn.repo \
   && yum install -y yarn

USER default

ARG GRAFANA_VERSION=7.5.7

RUN curl -L https://github.com/grafana/grafana/archive/refs/tags/v${GRAFANA_VERSION}.tar.gz | tar -xz \
   && ls -alh \
   && cd grafana-$GRAFANA_VERSION \
   && make
