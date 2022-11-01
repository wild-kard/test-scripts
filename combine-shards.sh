rm shards.txt

PLACEHOLDER=$(ls shards)
strarr=($PLACEHOLDER)
X=1
Y=6
declare -i X
for val in "${strarr[@]}";
do
    if [ $X -ne $Y ]; 
    then
    Line=$(cat shards/$val)
    echo 0$X-$Line >> shards.txt
    X+=1
    else
    echo passing 
    fi
done


ssss-combine -t 5 < shards.txt 2> masterkey_untrimmed
FILE=$(cat masterkey_untrimmed)
echo $FILE | cut -c 19- > masterkey_reconstituted


