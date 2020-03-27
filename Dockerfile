FROM jupyter/scipy-notebook:latest

# Install curl as root
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
USER $NB_UID

# Create the directory structure for data
USER root
RUN mkdir -p /data
RUN chown "$NB_UID:$NB_UID" /data
USER $NB_UID

# Download the CORD-19 dataset
RUN mkdir -p /data/cord19
WORKDIR /data/cord19
ADD ./scripts/download-cord-19.sh /data/cord19/download-cord-19.sh
RUN bash /data/cord19/download-cord-19.sh
RUN rm download-cord-19.sh

# Install all the packages required by the project
WORKDIR /app
ADD ./requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
ADD . /app

# Make a volume and start the Jupyter from the notebooks
VOLUME ["/notebooks"]
ENTRYPOINT ["start-notebook.sh", "--NotebookApp.notebook_dir=/notebooks", \
    "--NotebookApp.token=''"]
