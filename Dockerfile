# (c) Wong Hoi Sing Edison <hswong3i@pantarei-design.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM ubuntu:18.04

ENV BITBUCKET_VERSION            "6.5.2"
ENV BITBUCKET_OWNER              "bitbucket"
ENV BITBUCKET_GROUP              "bitbucket"
ENV BITBUCKET_HOME               "/var/atlassian/application-data/bitbucket"
ENV BITBUCKET_CATALINA           "/opt/atlassian/bitbucket"
ENV JAVA_HOME                    "/usr/lib/jvm/java-8-openjdk-amd64"
ENV JVM_MINIMUM_MEMORY           "512m"
ENV JVM_MAXIMUM_MEMORY           "1024m"
ENV CATALINA_CONNECTOR_PROXYNAME ""
ENV CATALINA_CONNECTOR_PROXYPORT ""
ENV CATALINA_CONNECTOR_SCHEME    "http"
ENV CATALINA_CONNECTOR_SECURE    "false"
ENV CATALINA_CONTEXT_PATH        ""
ENV JVM_SUPPORT_RECOMMENDED_ARGS "-Datlassian.plugins.enable.wait=300 -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=1"
ENV TZ                           "UTC"
ENV SESSION_TIMEOUT              "30"

VOLUME  $BITBUCKET_HOME
WORKDIR $BITBUCKET_HOME

EXPOSE 7990
EXPOSE 7999
EXPOSE 8006

ENTRYPOINT [ "dumb-init", "--" ]
CMD        [ "docker-entrypoint.sh" ]

# Explicitly set system user UID/GID
RUN set -ex \
    && groupadd -r $BITBUCKET_OWNER \
    && useradd -r -g $BITBUCKET_GROUP -d $BITBUCKET_HOME -M -s /usr/sbin/nologin $BITBUCKET_OWNER

# Prepare APT dependencies
RUN set -ex \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install ca-certificates curl gcc git libffi-dev libssl-dev make python python-dev sudo \
    && rm -rf /var/lib/apt/lists/*

# Install PIP
RUN set -ex \
    && curl -skL https://bootstrap.pypa.io/get-pip.py | python

# Copy files
COPY files /

# Bootstrap with Ansible
RUN set -ex \
    && cd /etc/ansible/roles/localhost \
    && pip install --upgrade --requirement requirements.txt \
    && molecule test \
    && rm -rf /var/cache/ansible/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /root/.cache/* \
    && rm -rf /tmp/*
