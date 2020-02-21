#!/bash/bin

echo "1.a : profit terminim"

region=$(awk -F $'\t' '
         FNR == 1 {next}
         {arr[$13]+=$21}
         END {for (i in arr) {printf "%s %.2f\n", i, arr[i]}}
         ' Sample-Superstore.tsv | sort -nk2 | awk '{print $1}' | head -1)
echo "$region"


echo -e  "\n1.b : 2 state profit terminim"

state=$(awk -v region="$region" -F $'\t' '
        FNR == 1 {next}
        ($13~region) {arr[$11]+=$21}
        END {for (i in arr) {printf "%s %.2f\n", i, arr[i]}}
        ' Sample-Superstore.tsv | sort -nk2 | awk '{print $1}' | head -2)
echo "$state"

state1=$(echo -e "$state" | sed -n '1p')
state2=$(echo -e "$state" | sed -n '2p')

#echo "$state1"
#echo "$state2"


echo -e "\n1.c : 10 produk profit terminim :v"

product=$(awk -v state1="$state1" -v state2="$state2" -F '\t' '
        FNR == 1 {next}
        ($11~state1) || ($11~state2) {arr[$17]+=$21}
        END {for (i in arr) {printf "%s:%.2f\n", i, arr[i]}}
        ' Sample-Superstore.tsv | sort -t $":" -nk2 | awk -F: '{print $1}' | head -10 )
echo "$product"

#awk -F: '{print $1}' $product

