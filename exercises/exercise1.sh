cd ~/bash_HandsOn #moved to bash_HandsOn
mkdir exercises # created a new directory called exercises
cd exercises # moved to exercises
nano exercise1.sh #created a file
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/exercises/bash/TAIR9_mRNA.bed # unable to download, i'll have to do it manually
cat ../../Desktop/TAIR9_mRNA.bed # to visualize the content
less -s ../../Desktop/TAIR9_mRNA.bed # to visualize the first part
# you could use less or if you compress it gzip ../../Desktop/TAIR9_mRNA.bed i would use
#gunzip ../../Desktop/TAIR9_mRNA.bed  so i would be able to visualize it normally just like we did with less or cat
wc <(grep + <(grep chr1 ../../Desktop/TAIR9_mRNA.bed)) # wc reports the number of lines that (grep + finds the lines that have a plus so the ones that are in the + and grep chr1 finds the ones that are in teh chr1)) the answer is 4366 transcripts
awk '{print$NF}' <(sed 's/,/ /g' <(head -n 10 <(awk '{print$11}' ../../Desktop/TAIR9_mRNA.bed)))
#head -n 10 gets de first 10 exons, sed removes the last coma, and awk lets you do multiple tasks at once. Print prints the results. so you get the sizes of the lenght of the 10 exons 
uniq <(sort -nr <(awk '{print$NF}' <(sed 's/,/ /g' <(head -n 10 <(awk '{print$11}' ../../Desktop/TAIR9_mRNA.bed))))) # the same that in the previous one but reordered so the first value is the 10 longest (sort) and also removing the repeated ones with uniq.
grep chr1 ../../Desktop/TAIR9_mRNA.bed | awk '{print$11}' | tr , "\n" | sort -nr | head
# to print the ten longest exons in chr 1,  grep prints the ones that are in chr 1, awk allows to do multiple tasks, it prints the 10 longest in order (sort).
grep chr1 ../../Desktop/TAIR9_mRNA.bed | awk '{print$4"\t"$10}' | sort -nr -k2,2 | uniq | head
# with awk you do multiple tasks, it prints the name of the transcripts but just the 10 genes in order, it prints the ones that have more exons and it doesn't print repetitions (uniq)
