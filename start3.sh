cd /home/www/domain
wp post list --post_type=post --fields=ID --format=csv --allow-root | sed -e 's/ID//g' -e '/^$/d' -e 's/"/ > /home/ebay/attachment/data/id.txt
