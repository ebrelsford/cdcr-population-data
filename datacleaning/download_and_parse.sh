#!/bin/sh
mkdir -p data/raw_monthly_pdfs/
python ./datacleaning/scrape_from_cdcr.py
python ./datacleaning/bulk_parse_pdfs.py
aws s3 mv data/monthly_cdcr_population.csv s3://healthatlas-data
