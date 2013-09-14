
#echo "Credentials into USERNAME/USERID/PASSWORD"

URL1="https://anz.tw/zh/personal/online-remote/index.jsp?to_page=2"
URL2="https://twcardsonline.anz.com/TW/out_index.jsp"
URL3="https://twcardsonline.anz.com/TW/login/login_process.jsp"
URL4="https://twcardsonline.anz.com/TW/statement/unbill_statement.jsp?m=2"

OUT1=url1.html
OUT2=url2.html
OUT3=url3.html
FINAL=final.html

if [ -f cookies.txt ]; then
  rm cookies.txt
fi

USERAGENT="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17"

# main page to get cookie
curl \
     -ss \
     --location \
     --user-agent "${USERAGENT}" \
     -b cookies.txt \
     -c cookies.txt \
     ${URL1} > ${OUT1}

# logging in
curl \
     -ss \
     --location \
     --user-agent "${USERAGENT}" \
     -b cookies.txt \
     -c cookies.txt \
     --referer ${URL1} \
     --data "username=${USERNAME}&userid=${USERID}&password=${PASSWORD}" \
     ${URL2} > ${OUT2}

# actual data
curl \
     -ss \
     --location \
     --user-agent "${USERAGENT}" \
     -b cookies.txt \
     -c cookies.txt \
     --referer ${URL2} \
     ${URL3} > ${OUT3}

# actual data
curl \
     -ss \
     --location \
     --user-agent "${USERAGENT}" \
     -b cookies.txt \
     -c cookies.txt \
     --referer ${URL3} \
     ${URL4} > ${FINAL}

./parsing.py ${FINAL}
