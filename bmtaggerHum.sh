
bamDir=$(ls -d *_fastq_to_ubam)
bamFile=$(cat sample.txt).bam

miniwdl run \
https://raw.githubusercontent.com/broadinstitute/viral-ngs-staging/master/pipes/WDL/workflows/deplete_only.wdl \
deplete_taxa.raw_reads_unmapped_bam="$bamDir"/out/unmapped_bam/"$bamFile" \
deplete_taxa.bmtaggerDbs=/home/ubuntu/viral-ngs/databases/database.list \
deplete_taxa.blastDbs=/home/ubuntu/viral-ngs/databases/metag_v3.ncRNA.mRNA.mitRNA.consensus.tar.gz

