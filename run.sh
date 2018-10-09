#Aythor:Julia
#Date:17/09/2018
#Bash Hands-On
#Task 1
mkdir bash_HandsOn #crear la carpeta
cd bash_HandsOn # nos movemos dentro
mkdir bin #tb es pot fer mkdir bin input output logs trash
mkdir input
mkdir output
mkdir logs
mkdir trash
ls -la #amb espai
cp -r trash trash2 #copiamos a trash2
mv trash trash1 #lo movemos a trash1
rm -rf trash2 #rmdir podies fer-ho ja que esta buit
#TASK 2
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/sample-groups.tsv # unable to download it in my virtual machine using wget
mv ~/Desktop/sample-groups.tsv ~/bash_HandsOn/input/input.tsv # lo movemos a imput
cd ..
ln -s ~/bash_HandsOn/input/input.tsv ~/bash_HandsOn/trash1/input_symlink # hacemos el link
cp ~/bash_HandsOn/input/input.tsv ~/bash_HandsOn/trash1/input_copy.tsv # lo copiamos
mkdir ~/bash_HandsOn/trash1/IAmLearningSomeBash # nueva carpeta
rm -rf ~/bash_HandsOn/trash1 # eliminamos trash1
#TASK 3
mkdir ~/bash_HandsOn/output/task_3 
cd ~/bash_HandsOn/input
head input.tsv -n 100 > ../output/task_3/top100.tsv
tail input.tsv -n 50 > ../output/task_3/last50.tsv
cd ../output/task_3
wc top100.tsv
wc last50.tsv
cat top100.tsv last50.tsv > 150together.tsv
cut -f1 150together.tsv > 150firstcolumn.tsv
paste 150firstcolumn.tsv 150firstcolumn.tsv > 150firstcX2.tsv
#TASK 4
mkdir ../task_4
cd ../..
cut -f2 input/input.tsv | sort -r | egrep "Adipose|Artery" -v | uniq > output/task_4/unique.tissues2.txt
cd ~/bash_HandsOn/output/task_4
ls
cd ../..
cut -f3 input/input.tsv | sort -r | egrep "Adipose|Artery" -v | uniq > output/task_4/unique.tissues3.txt 
cd output/task_4
diff unique.tissues2.txt unique.tissues3.txt > differences #pregunta mal formulada
less differences
#TASK 5
cd ../..
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/scripts.tar.gz # unable to download
cd ../
cd ~/Downloads/
gunzip scripts.tar.gz
tar -xf scripts.tar
mv ~/Downloads/usage.sh ../bash_HandsOn/bin
cd ../bash_HandsOn/bin
less usage.sh #----
nano /usage.sh # argument=$1 #echo "The script usage.sh has recieved the argument $argument"
PATH="$PATH:/Home/bash_HandsOn/bin"
chmod +x /usage.sh #sample run

#TASK 6
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/unknown.samples.tsv #unable to download
#fer el join
join -t $'\t' <(sort -k1,1 ../input/input.tsv) <(sort -k1,1 ../../Desktop/unknown.samples.tsv) > ../output/joint.tsv
awk '{print $4,$3,$2,$1}' ../output/joint.tsv | sed 's/_/ /g' > joint.tsv
#TASK 7
nano usage.sh
./usage.sh AGTC
./usage.sh
#argument=$1
#if [  "$argument" != "" ]; then
#  echo "The script usage.sh has recieved the argument $argument"
#  echo "The script usage.sh has recieved the argument $argument"
#  echo "The script usage.sh has recieved the argument $argument"
#  echo "The script usage.sh has recieved the argument $argument"
#else
#  echo "No argument was provided"
#fi
#------------------------------------------------------EXERCISE 1--------------------------
cd ~/bash_HandsOn #moved to bash_HandsOn
mkdir exercises # created a new directory called exercises
cd exercises # moved to exercises
nano exercise1.sh #created a file
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/exercises/bash/TAIR9_mRNA.bed # unable to download, i'll have to do it manually
cat ../../Desktop/TAIR9_mRNA.bed # to visualize the content
less ../../Desktop/TAIR9_mRNA.bed # to visualize the first part
# if you compress it gzip ../../Desktop/TAIR9_mRNA.bed i would use
#gunzip ../../Desktop/TAIR9_mRNA.bed  so i would be able to visualize it normally just like we did with less or cat
wc <(grep + <(grep chr1 ../../Desktop/TAIR9_mRNA.bed)) # wc reports the number of lines that (grep + finds the lines that have a plus so the ones that are in the + and grep chr1 finds the ones that are in teh chr1)) the answer is 4366 transcripts
awk '{print$NF}' <(sed 's/,/ /g' <(head -n 10 <(awk '{print$11}' ../../Desktop/TAIR9_mRNA.bed)))
#head -n 10 gets de first 10 exons, sed removes the last coma, and awk lets you do multiple tasks at once. Print prints the results. so you get the sizes of the lenght of the 10 exons 
uniq <(sort -nr <(awk '{print$NF}' <(sed 's/,/ /g' <(head -n 10 <(awk '{print$11}' ../../Desktop/TAIR9_mRNA.bed))))) # the same that in the previous one but reordered so the first value is the 10 longest (sort) and also removing the repeated ones with uniq.
grep chr1 ../../Desktop/TAIR9_mRNA.bed | awk '{print$11}' | tr , "\n" | sort -nr | head
# to print the ten longest exons in chr 1,  grep prints the ones that are in chr 1, awk allows to do multiple tasks, it prints the 10 longest in order (sort).
grep chr1 ../../Desktop/TAIR9_mRNA.bed | awk '{print$4"\t"$10}' | sort -nr -k2,2 | uniq | head
# with awk you do multiple tasks, it prints the name of the transcripts but just the 10 genes in order, it prints the ones that have more exons and it doesn't print repetitions (uniq)

