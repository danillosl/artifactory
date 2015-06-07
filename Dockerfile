FROM danillosl/oracle_java:latest 

MAINTAINER Danillo Lisboa <danillosl@gmail.com>

ENV ARTIFACTORY_HOME /opt/artifactory

# Http port
EXPOSE 8081

RUN yum install unzip -y
RUN cd /opt \
&& curl curl -L https://bintray.com/artifact/download/jfrog/artifactory/artifactory-3.8.0.zip > artifactory.zip \
&& unzip artifactory.zip \
&& mv artifactory-3.8.0 artifactory \
&& rm artifactory.zip \
&& yum remove unzip -y \
&& yum clean all -y

WORKDIR $ARTIFACTORY_HOME
ENTRYPOINT ["./bin/artifactory.sh"]
