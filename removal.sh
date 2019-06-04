file=`(find . -maxdepth 1 -name "chk*" -printf '%P\n')`
pltfile=`(find . -maxdepth 1 -name "plt*" -printf '%P\n')`
#module load intel/compiler/64/16.0/2016.1.056.XXX
# module load intel/compiler/64/2018/18.0.0 
#module load intel/compiler/64/16.0/2016.1.056.XXX
j=0
#for i in $pltfile

#do
#cp /gpfs/scratch/taryu/sync_folder/Mac_Lired/code/*f90 $i/                                             
#j=$((j+1))
#a$j=${i//[^0-9]/}
#echo a$j
#done

a=100000
b=109000
echo $i

for ((i=$a;i<$b;i=i+100));

do

 rm -r 'chk'$i
 echo 'chk'$i, $a
done
ls