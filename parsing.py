#!/usr/bin/env python2

from bs4 import BeautifulSoup
import sys
from datetime import date

html_data=open(sys.argv[1], "r")
html_doc=html_data.read()

soup = BeautifulSoup(html_doc)
parts = soup.find_all('div')

## Get balance
balancestr = parts[-1].string

def getInt(str):
    return int(str.replace(',', ''))

balance = getInt(balancestr)
print "Total balance: %d" % (balance)

# today = date.today()
# print today.strftime("%Y/%m/%d")
# # Get spending
# for p in soup.find_all('tr'):
#     print p
#     print 




