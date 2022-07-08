for i in $(cat sample.txt)
do 
r1=$(ls "$i"*R1*)
r2=$(ls "$i"*R2*)
miniwdl run \
https://raw.githubusercontent.com/broadinstitute/viral-ngs-staging/master/pipes/WDL/workflows/fastq_to_ubam.wdl \
FastqToUBAM.fastq_1="$r1" \
FastqToUBAM.fastq_2="$r2" \
FastqToUBAM.library_name="L" \
FastqToUBAM.sample_name="$i"
done
