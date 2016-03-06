#!/usr/bin/env python
from mechanize import Browser
from bs4 import BeautifulSoup
import urllib2,cookielib
import re
import codecs
import sys
import ssl

ssl._create_default_https_context = ssl._create_unverified_context
UTF8Writer = codecs.getwriter('utf8')
sys.stdout = UTF8Writer(sys.stdout)
site= "http://www.amazon.com/product-reviews/asin2/"
hdr = {'User-Agent': 'Mozilla/5.0 (Windows; U; Windows CE 5.1; rv:1.8.1a3) Gecko/20060610 Minimo/0.016',
       'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
       'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
       'Accept-Encoding': 'none',
       'Accept-Language': 'en-US,en;q=0.8',
       'Connection': 'keep-alive'}

req = urllib2.Request(site, headers=hdr)

try:
    page = urllib2.urlopen(req)
except urllib2.HTTPError, e:
    print e.fp.read()

content = page.read()
soup = BeautifulSoup(content)
for div in soup.findAll(attrs={"aria-expanded": "false"}):
    print div.text
