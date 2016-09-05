FROM tomcat:8-jre8

ARG OPENAM_VERSION
ENV OPENAM_VERSION ${OPENAM_VERSION:-13.0.0}

RUN addgroup --gid 1001 openam && \
    adduser --system --home "/home/openam" --shell /bin/bash --uid 1001 --ingroup openam  --disabled-password openam && \
    mkdir -p /openam /home/openam/conf /home/openam/admintools && \
    chown openam:openam -R /openam /usr/local/tomcat /home/openam

ADD bin/* /bin/
RUN chmod +x /bin/*.sh

USER openam

RUN cd /tmp && \
    curl -sS http://maven.forgerock.org/repo/releases/org/forgerock/openam/openam-distribution-kit/${OPENAM_VERSION}/openam-distribution-kit-${OPENAM_VERSION}.zip > /tmp/openam.zip && \
    unzip /tmp/openam.zip && \
    cp -p openam/OpenAM-${OPENAM_VERSION}.war /usr/local/tomcat/webapps/openam.war && \
    unzip openam/SSOAdminTools-${OPENAM_VERSION}.zip -d /home/openam/admintools && \
    unzip openam/SSOConfiguratorTools-${OPENAM_VERSION}.zip -d /home/openam/conf && \
    rm -rf /tmp/openam/ /tmp/openam.zip && \
    touch /usr/local/tomcat/webapps/ROOT/version && \
    echo ${OPENAM_VERSION} | cut -d '.' -f 1 > /usr/local/tomcat/webapps/ROOT/version

EXPOSE 8080

CMD ["/bin/run_me.sh"]
