if [ $(echo "$(cat imageamazon.py)" | sed 's/asin2/asin1/g' | python - |wc -l) -gt "0" ]; then
 echo "echo \"\$(cat titleamazon.py)\" | sed 's/asin2/asin1/g' | python - | tr -cd '[[:alnum:]] ' | sed -e 's/   / /g' -e 's/   / /g' -e 's/  / /g' -e 's/  / /g' | sed 's/.*/\L&/; s/[a-z]*/\u&/g' | cut -c -150 | sed 's/.*/$(printf "Best Buy New \nBest Price New \nBest Cheap New \nBest Compare New \nNew Best Buy \nNew Best Price \nNew Best Cheap \nNew Best Compare" | shuf -n 1)&$(printf " On Sale 2016\n Review 2016\n Discount 2016" | shuf -n 1)/' > deletetitleamazon.txt" | bash -
 echo "$(cat titleamazon.py)" | sed 's/asin2/asin1/g' | python - | tr -cd '[[:alnum:]] .,&:' | sed 's/.*/\L&/; s/[a-z]*/\u&/g' > deletetitleamazon2.txt
 echo "echo \"\$(cat urlebay.py)\" | sed 's/keyword/$(cat deletetitleamazon2.txt | tr -cd '[[:alnum:]] ' | sed 's/ /+/g')/g' | python -" | bash - | sed -n 1,5p > deleteebayurl.txt
 cat deleteebayurl.txt | while read line; do
    echo "cat a.sh | sed 's|urla|$line|g' > deletea.sh" | bash -
    echo "chmod 755 deletea.sh && ./deletea.sh" | bash -
 done
 echo "awk 'FNR==1{print \"<div style=\\\"text-align: center;\\\">\"}{print}' deletegalleryebay.txt | sed '$ a </div>' | tr '\n' ' '> deletegalleryebay2.txt" | bash -
 echo "$(cat imageamazon.py)" | sed 's/asin2/asin1/g' | python - > deleteimageamazon.txt
 #Scrape image
 echo "ffmpeg -i $(cat deleteimageamazon.txt) -vf \"crop=iw/1.02:ih/1.02,scale='if(gt(a,16/9),1104,-1)':'if(gt(a,16/9),-1,621)',colorbalance=bh=.1\" $(cat deletetitleamazon.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's| |-|g').jpg" | bash -
 # shuffle author
echo "$(shuf -n 1 data/author.txt)" | sed 's/.*/\L&/; s/[a-z]*/\u&/g' > deleteauthor1.txt
cat deleteauthor1.txt | sed -e 's/Milley/2/g' -e 's/Martha/3/g' -e 's/Edward/4/g' -e 's/Samuel/5/g' -e 's/Daniel/6/g' -e 's/Cason/7/g' -e 's/Vandiver/8/g' -e 's/Teresa/9/g' -e 's/Collins/10/g' -e 's/Carole/11/g' -e 's/Tomlin/12/g' -e 's/Sharoon/13/g' -e 's/Issac/14/g' -e 's/Samantha/15/g' -e 's/Turner/16/g' > deleteauthor2.txt
 # shuffle tanggal dan waktu
echo "$(shuf -i 2012-2015 -n 1)-$(shuf -i 1-12 -n 1 | sed 's/.*/0&/' | tail -c 3)-$(shuf -i 1-28 -n 1 | sed 's/.*/0&/' | tail -c 3)" > deletetanggal.txt
echo "$(shuf -i 1-23 -n 1 | sed 's/.*/0&/' | tail -c 3):$(shuf -i 1-59 -n 1 | sed 's/.*/0&/' | tail -c 3):$(shuf -i 1-59 -n 1 | sed 's/.*/0&/' | tail -c 3)" > deletewaktu.txt
 # tanggalwaktu
echo "shuf -n 1 spin/tanggal | sed -e 's/tanggal/$(cat deletetanggal.txt)/g' -e 's/waktu/$(cat deletewaktu.txt)/g'" | bash - | bash - > deletetanggalwaktu.txt
 echo "$(cat descriptionamazon.py)" | sed 's/asin2/asin1/g' | python - | tr -cd '[[:alnum:]] .,/"&()%:!-+=' | sed -e 's/a/ä/g' -e 's/    Product Description//g' > deletedescriptionamazon.txt
 echo "$(cat detailamazon.py)" | sed 's/asin2/asin1/g' | python - | awk 1 ORS='<br/>' | tr -cd '[[:alnum:]] .,/"&()%:!-+=<>' | sed -e 's|a|ä|g' -e 's|<br/>  <br/>  ||g' -e 's|<br/><br/>||g' -e 's|Product Detäils<br/>  <br/>|Product Detäils :<br/>|g' -e 's|  Feätures|Feätures :<br/>|g' > deletedetailamazon.txt
 echo "$(cat reviewamazon.py)" | sed 's/asin2/asin1/g' | python - | awk 1 ORS='<br/>' | tr -cd '[[:alnum:]] .,/"&()%:!-+=<>' | sed -e 's|a|ä|g' -e 's|<br/>  <br/>  ||g' -e 's|<br/><br/>||g' > deletereviewamazon.txt
 echo "echo \"\$(cat ask.py)\" | sed 's/deleteask/$(cat deletetitleamazon.txt | tr -cd '[[:alnum:]] ' | sed 's/ /+/g')/g' | python -" | bash - | sed -e '/^$/d' -e 's|,||g' | awk 1 ORS=',' | tr -cd '[[:alnum:]] ,' | sed -e 's|,,,|,|g' -e 's|,,|,|g' -e 's/.$//' > deleteask.txt
  # exiftool
echo "exiftool -Title=\"$(cat deletetitleamazon.txt)\" -Author=\"$(cat deleteauthor1.txt)\" -Description=\"The picture/image of $(cat deletetitleamazon.txt)\" -Keyword=\"$(cat deletetitleamazon.txt), $(cat deleteask.txt)\" -Copyright=\"Source http://www.domain.ekstension/wp-content/uploads/$(cat deletetitleamazon.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's| |-|g').jpg\" $(cat deletetitleamazon.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's| |-|g').jpg" | bash -
 #description
 echo "<h3>$(cat deletetitleamazon.txt)</h3><br/><div style=\"text-align: center;\"><img src=\"http://www.domain.ekstension/wp-content/uploads/$(cat deletetitleamazon.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's| |-|g').jpg\" width=\"500\" heigh=\"auto\" alt=\"$(cat deletetitleamazon.txt)\" /><br/><br/><a $(printf "eyabayanes\ntulkanoli\njasunamikon\nkolpokloij\ngulanjuikolpo\npalasantoliong\ndongkelapolik\ndasmutyuki" | shuf -n 1)$(cat deletetitleamazon2.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's/ /+/g')\" title=\"Click this button to check product on ebay\" target=\"_blank\" class=\"fasc-button fasc-size-xlarge fasc-type-glossy fasc-rounded-medium fasc-ico-before dashicons-cart\" style=\"background-color: #db0d44; color: #ffffff;\" data-fasc-style=\"background-color:#db0d44;color:#ffffff;\">Check Product On Ebay</a></div><br/><div style=\"text-align: justify;\">$(cat deletedescriptionamazon.txt)<br/>$(cat deletedetailamazon.txt)<br/><br/><center><a $(printf "eyabayanes\ntulkanoli\njasunamikon\nkolpokloij\ngulanjuikolpo\npalasantoliong\ndongkelapolik\ndasmutyuki" | shuf -n 1)$(cat deletetitleamazon2.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's/ /+/g')\" title=\"Click this button to check best price on ebay\" target=\"_blank\" class=\"fasc-button fasc-size-xlarge fasc-type-glossy fasc-rounded-medium fasc-ico-before dashicons-cart\" style=\"background-color: #db0d44; color: #ffffff;\" data-fasc-style=\"background-color:#db0d44;color:#ffffff;\">Check Best Price On Ebay</a></center><br/>$(cat deletegalleryebay2.txt)<br/>$(cat deletereviewamazon.txt)<br/>$(cat deleteask.txt)<br/><center><a $(printf "eyabayanes\ntulkanoli\njasunamikon\nkolpokloij\ngulanjuikolpo\npalasantoliong\ndongkelapolik\ndasmutyuki" | shuf -n 1)$(cat deletetitleamazon2.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's/ /+/g')\" title=\"Click this button to buy on ebay\" target=\"_blank\" class=\"fasc-button fasc-size-xlarge fasc-type-glossy fasc-rounded-medium fasc-ico-before dashicons-cart\" style=\"background-color: #db0d44; color: #ffffff;\" data-fasc-style=\"background-color:#db0d44;color:#ffffff;\">Buy Now On Ebay</a></center></div>" > deletedescription.txt
 #upload youtube
 echo "wget -qO- --header=\"Accept: text/html\" --user-agent=\"Googlebot-Image/1.0\" \"http://www.bing.com/videos/search?scope=video&pq=$(cat deletetitleamazon2.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's/ /+/g')&sc=1-30&sp=-1&sk=&q=$(cat deletetitleamazon2.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's/ /+/g')&qft=+filterui:msite-youtube.com\" | grep -o '<a href=['\"'\"'\"][^\"'\"'\"']*['\"'\"'\"]' | grep 'watch?v' | sed -e 's/^<a href=[\"'\"'\"']//' -e 's/[\"'\"'\"']$//' -e 's/https:\\/\\/www.youtube.com\\/watch?v=//g' | shuf -n 1 > deleteyoutube.txt" | bash -
 echo "<br/><style>.embed-container { position: relative; text-align: center; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='embed-container'><iframe type=\"text/html\" width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/$(cat deleteyoutube.txt)?autohide=1&rel=0&controls=0&modestbranding=1&disablekb=1&theme=light&enablejsapi=1\" frameborder=\"0\"></iframe></div>" > deleteyoutube1.txt
 echo "$(cat deletedescription.txt)$(cat deleteyoutube1.txt)" >> deletedes.txt
 # sql file 1
echo "cat data/sql1 | sed -e 's|author2|$(cat deleteauthor2.txt)|g' -e 's|tanggal|$(cat deletetanggal.txt)|g' -e 's|waktu|$(cat deletewaktu.txt)|g' >> deletesql.txt" | bash -
 # input description
echo "cat deletedes.txt | sed \"s/'/''/g\" >> deletesql.txt" | bash -
 # shuffle id post
echo "$(cat data/id.txt | shuf -n 1)" > deleteidpost.txt
 # upload image
cd /home/www/domain
echo "wp media import /home/ebay/attachment/$(cat /home/ebay/attachment/deletetitleamazon.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's| |-|g').jpg --post_id=$(cat /home/ebay/attachment/deleteidpost.txt | shuf -n 1) --porcelain --allow-root > /home/ebay/attachment/deleteid.txt" | bash -
 # sql file 2
cd /home/ebay/attachment
echo "cat data/sql2 | sed -e 's|judul2|$(cat deletetitleamazon.txt | tr -cd '[[:alnum:]] ')|g' -e 's|judulstrip2|$(cat deletetitleamazon.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's| |-|g')|g' -e 's|gantiparent|$(cat deleteidpost.txt)|g' -e 's|gantiid|$(cat deleteid.txt)|g' >> deletesql.txt" | bash -
 # mysql
echo "$(cat deletesql.txt)" | awk 1 ORS='' | sed '$a\' > deletemysql.sql
 # mysql query
cd /home/www/domain
wp db query --allow-root < /home/ebay/attachment/deletemysql.sql
cd /home/ebay/attachment
else
 clear
fi
find . -maxdepth 1 -type f -name "delete*" -delete
find . -maxdepth 1 -type f -name "*.jpg" -delete
find . -maxdepth 1 -type f -name "*.jpg_original" -delete
history -c
clear
