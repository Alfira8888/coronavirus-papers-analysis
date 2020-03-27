FROM phenompeople/python:3.6.3
EXPOSE 8080
ARG APP_HOME=/opt/deployment
ARG PROJECT_NAME="scibert-server"
ENV APP_HOME=${APP_HOME} \
    PROJECT_NAME=${PROJECT_NAME} \
    PROJECT_HOME=${APP_HOME}/${PROJECT_NAME}
ADD requirements.txt /
RUN yum install -y -q unzip && \
	pip3 install -r requirements.txt && \
    mkdir -p ${PROJECT_HOME}/models && \
    mkdir -p ${PROJECT_HOME}/tmp && \
    mkdir -p ${PROJECT_HOME}/logs
COPY start-server.sh ${PROJECT_HOME}/start-server.sh
ADD https://s3-us-west-2.amazonaws.com/ai2-s2-research/scibert/tensorflow_models/scibert_scivocab_uncased.tar.gz ${PROJECT_HOME}/models
RUN tar -C ${PROJECT_HOME}/models/ -xzf ${PROJECT_HOME}/models/scibert_scivocab_uncased.tar.gz && \
	chmod a+x  ${PROJECT_HOME}/start-server.sh
RUN ls -la ${PROJECT_HOME}/models/scibert_scivocab_uncased/
WORKDIR ${PROJECT_HOME}
ENTRYPOINT ["./start-server.sh"]
