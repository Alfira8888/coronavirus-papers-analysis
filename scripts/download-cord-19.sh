#!/bin/bash
set -e

# Download metadata infomation
curl "https://ai2-semanticscholar-cord-19.s3-us-west-2.amazonaws.com/2020-03-13/all_sources_metadata_2020-03-13.csv" \
  -o "all_sources_metadata_2020-03-13.csv"

# Download JSON schema of the articles
curl "https://ai2-semanticscholar-cord-19.s3-us-west-2.amazonaws.com/2020-03-13/json_schema.txt" \
  -o "json_schema.txt"

# Download the articles
curl "https://ai2-semanticscholar-cord-19.s3-us-west-2.amazonaws.com/2020-03-13/comm_use_subset.tar.gz" \
  -o "comm_use_subset.tar.gz"
curl "https://ai2-semanticscholar-cord-19.s3-us-west-2.amazonaws.com/2020-03-13/noncomm_use_subset.tar.gz" \
  -o "noncomm_use_subset.tar.gz"
curl "https://ai2-semanticscholar-cord-19.s3-us-west-2.amazonaws.com/2020-03-13/pmc_custom_license.tar.gz" \
  -o "pmc_custom_license.tar.gz"
curl "https://ai2-semanticscholar-cord-19.s3-us-west-2.amazonaws.com/2020-03-13/biorxiv_medrxiv.tar.gz" \
  -o "biorxiv_medrxiv.tar.gz"

# Extract archives
tar zxvf "comm_use_subset.tar.gz"
tar zxvf "noncomm_use_subset.tar.gz"
tar zxvf "pmc_custom_license.tar.gz"
tar zxvf "biorxiv_medrxiv.tar.gz"
