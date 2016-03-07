IFS=';'
while read f1; do
    echo "sed -e 's/asin1/$f1/g' build.sh > build2.sh" | bash -
    echo "chmod 755 build2.sh" | bash -
    echo "./build2.sh" | bash -
    echo "rm -f build2.sh" | bash -
done < data/asin.txt
