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

today = date.today()
todayform = today.strftime("%Y/%m/%d")
todayform = '2013/09/10'
printedheader = False
for tr in soup.find_all('tr'):
    td = tr.find_all('td')
    if len(td) != 6:
        continue
    else:
        try:
            setdate = td[1].find('div').string
            if setdate == todayform:
                if not printedheader:
                    print "\nNew charges on %s" % todayform
                    print "-"*25
                    printedheader = True
                origindate = td[0].find('div').string.encode('utf-8')
                chargename = ' '.join(td[2].find('div').string.split()).encode('utf-8')
                chargevalue = td[5].find('div').string.encode('utf-8')
                print "%s | TWD%s | %s".encode('utf-8') %(origindate, chargevalue, chargename)
        except:
            raise



