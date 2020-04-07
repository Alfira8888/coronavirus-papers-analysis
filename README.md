# Question answering system

This repository contains all the necessary files required to run the materials
of the "COVID-19: Automated NLP-based question answering" workshop. 

## Requirements

- [docker](https://www.docker.com)
- [docker-compose](https://docs.docker.com/compose/)

## Setting up the environment

The whole system requires to run 3 containers:
1. **JupyterLab** for the interactive notebooks
2. **bert-as-service** for hosting the BERT model server
3. **bert-as-service** for hosting the SciBERT model server

The process of setting up all the necessary dependencies requires to launch just
a single command in the console:

`docker-compose up`

This may take a while. The necessary BERT-based models have to be downloaded.
These heavy files are necessary to have working demo, but whole process is
automated.

As a result, three necessary services are going to be launched, and JupyterLab
will expose itself on http://localhost:8888. This is going to be one and the 
only gateway to the created system.
