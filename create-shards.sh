rm shards.txt
rm -r shards
rm shards_untrimmed.txt
KEY=$(cat masterkey)
ssss-split -t 5 -n 11 < ~/masterkey > ~/shards_untrimmed.txt
#make target dir for shard files
mkdir ~/shards


#trim excess from the output of ssss split
sed -e '1d' ~/shards_untrimmed.txt > ~/shards.txt
FILE="shards.txt"
Lines=$(cat ~/$FILE)
X=1
declare -i X
for Line in $Lines
do

    echo $Line | cut -c 4- > ~/shards/shard$X.txt
    X+=1
done
