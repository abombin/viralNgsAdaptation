conda activate miniwdl

cd /home/ubuntu/viral-ngs/myPipe/patient288/metaSeq

Rscript --vanilla ./programs/inputFile.R

for i in $(cat samples.txt); do mkdir -p process_files/"$i"; mv ./input/"$i"* ./process_files/"$i";
echo "$i" >process_files/"$i"/sample.txt;
done

cd process_files
# convert fastq to bam. takes 2 cpus 3G ram per sample reserved 
for i in $(cat ../samples.txt); do cd "$i"; sh ../../programs/uBam.sh; cd ../; done

# clean with bmtagger
# human reads 8 cpus (max at the moment) 14GB ram per samples reserved, appears to use less than half
for i in $(cat ../samples.txt); do cd "$i"; sh ../../programs/bmtaggerHum.sh; cd ../; done



