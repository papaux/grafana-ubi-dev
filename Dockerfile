FROM registry.access.redhat.com/ubi8/go-toolset

ARG GRAFANA_VERSION=v7.5.7

USER root

# Install Nodejs environmnet with yarn
RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash - \
   && curl -sL https://dl.yarnpkg.com/rpm/yarn.repo -o /etc/yum.repos.d/yarn.repo \
   && yum install -y yarn

USER default

RUN git clone -b $GRAFANA_VERSION https://github.com/grafana/grafana.git --depth=1 \
   && cd grafana \
   && make
