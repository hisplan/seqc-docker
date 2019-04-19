#!/bin/bash -e

version="0.2.3-alpha.2"
s3_dest="s3://dp-lab-home/software"

path_workdir=`mktemp -d`

tar cvzf ${path_workdir}/seqc-${version}.tar.gz \
    seqc-submit.sh seqc_submit_mjobs.py config/jobs.template.yml

aws s3 cp ${path_workdir}/seqc-${version}.tar.gz ${s3_dest}/

rm -rf ${path_workdir}