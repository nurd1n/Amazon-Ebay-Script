# tambah awalan & akhiran
sed -i -e '1i<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:mobile="http://www.google.com/schemas/sitemap-mobile/1.0" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">\' /home/ebay/attachment/sitemap-attachment.xml
sed -i -e '1i<?xml version="1.0" encoding="UTF-8"?>\' /home/ebay/attachment/sitemap-attachment.xml
cat /home/ebay/attachment/sitemap-attachment.xml | sed '$ a </urlset>' > /home/www/domain/sitemap-attachment.xml
