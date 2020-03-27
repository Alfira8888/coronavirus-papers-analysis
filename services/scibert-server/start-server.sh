#!/usr/bin/env bash
#NUMBER_OF_PROCS=$(nproc)
#NUMBER_OF_PROCS=$(($NUMBER_OF_PROCS-1))
bert-serving-start -model_dir models/scibert_scivocab_uncased \
  -max_seq_len 512 \
  -pooling_layer -1 \
  -graph_tmp_dir ${PROJECT_HOME}/tmp  \
  -num_worker=${NUMBER_OF_PROCS} \
  -http_port 8080 \
  -http_max_connect 20 > ${PROJECT_HOME}/logs/bert-server.log
