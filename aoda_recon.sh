#!/bin/bash

# colors define
RESET='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'

# Print the ASCII art banner
figlet aoda
echo -e "${RED}${RESET}"

sleep 5

echo "Hii $(whoami)"

sleep 2

echo "Enter the domain :"
read domain

mkdir -p "$domain"
cd "$domain" || { echo "Failed to enter directory $domain"; exit 1; }

sleep 3

# Subdomain enumeration

echo -e "${GREEN}[👹] Subdomains Enumeration ${RESET}"

echo -e "${GREEN}Subdomain from tool Subfinder${RESET}"
subfinder -d "$domain" -all -recursive > subdomain1.txt

echo -e "${GREEN}Subdomain from web Crt.sh${RESET}"
curl -s "https://crt.sh/?q=%25.$domain&output=json" | jq -r '.[].name_value' | sort -u > subdomain2.txt

echo -e "${GREEN}Subdomain from tool Findomain${RESET}"
findomain -t "$domain" -u subdomain3.txt

cat subdomain1.txt subdomain2.txt subdomain3.txt > subdomain4.txt

echo "Tolat subdomain found scan one"
cat subdomain4.txt | wc -l

# Subdomain of Subdomain enumeration

echo -e "${GREEN} Subdomain of Subdomain Enumeration ${RESET}"
subfinder -dL subdomain4.txt -all -recursive > subdomain5.txt

# Fileing all Subdomain in one file
cat subdomain4.txt subdomain5.txt > subdomains

sleep 1

echo -e "${BLUE}[👹] Subdomain Enumeration Done${RESET}"

sleep 3

# removeing duplicate subdomain flie from directory
rm -r subdomain1.txt
rm -r subdomain2.txt
rm -r subdomain3.txt
rm -r subdomain4.txt
rm -r subdomain5.txt

sleep 1

echo -e "${BLUE}[👹] Duplicate Subdomain File's removed  ${RESET}"

sleep 2

# Httpx-toolkit to check alive subdomains

echo -e "${GREEN}[👹] Checking For Alive Subdomains ${RESET}"
cat subdomains | httpx-toolkit -ports 80,443,8080,8000,8888 -threads 200 > subdomains_alive

echo -e "${RED}[👹] Total Alive Subdomain : ${RESET}"
cat subdomains_alive | wc -l

echo -e "${BLUE}[👹] Checking for Alive Subdomain Done ${RESET}"

sleep 2

# Step 3: Crawling..

echo -e "${GREEN}[👹] Crawling Endpoints ${RESET}"

echo -e "${GREEN}Endpoints from tool Katana${RESET}"
katana -u subdomains -d 5 -ps -pss waybackarchive,commoncrawl,alienvault -kf -jc -fx -ef woff,css,png,svg,jpg,woff2,jpeg,gif,svg -o url1.txt

echo -e "${GREEN}Endpoints from tool Waybackurl${RESET}"
waybackurls "$domain" > url2.txt

echo -e "${GREEN}Endpoints from site archive.org${RESET}"
curl -s 'https://web.archive.org/cdx/search/cdx?url=komoot.com/*&output=text&fl=original&collapse=urlkey' | awk '{print $1}' > url3.txt

cat url1.txt url2.txt url3.txt > allurls

echo -e "${BLUE}Total Endpoints ${RESET}"
cat allurls | wc -l

echo -e "${BLUE}[👹] Crawling Endpoints Done ${RESET}"

# removeing crawled urls from directory
rm -r url1.txt
rm -r url2.txt
rm -r url3.txt
echo -e "${BLUE}[👹] DUPLICATE CRAWLED URL FILE REMOVED !! ${RESET}"

sleep 2

# Grep for sensitive file types
echo -e "${GREEN}[👹] Filtering Endpoints of  sensitive file types...${RESET}"
cat allurls | grep -E "\.txt|\.log|\.cache|\.secret|\.db|\.backup|\.yml|\.json|\.gz|\.rar|\.zip|\.config" >sensitiveurls
echo -e "${BLUE}[👹]sensitive Endpoints saved to Sensitive ${RESET}"

sleep 2

# Grep for JavaScript files
echo -e "${GREEN}[👹] Filtering Endpoints of JavaScript files...${RESET}"
cat allurls | grep -E "\.js$" >> js
echo -e "${BLUE}[👹] JavaScript Endpoints saved to js${RESET}"

sleep 2

# Grep for xss files
echo -e "${GREEN}[👹] Filtering Endpoints for Xss ${RESET}"
cat allurls | grep -E "=$" >> xss
echo -e "${BLUE}[👹] Xss Endpoints saved to xss${RESET}"

sleep 3

# Grep for admin logins
echo -e "${GREEN}[👹] Finding admin logins from subdomain ${RESET}"
cat subdomains_alive | httpx-toolkit -ports 80,443,8080,8443 -path /admin -mr "admin" > adminlogins
echo -e "${BLUE} [👹] Admin Endpoints saved to adminlogins ${RESET}"

sleep 3

# ShodanX ip gathering
echo -e "${GREEN}[👹] Ip's emum by useing Shodanx${RESET}"
shodanx domain -d "$domain"

sleep 2

# Fuzzing on main domain
echo -e "${GREEN}Fuzzing on $domain${RESET}"
dirsearch  -u https://www."$domain".com -e conf,config,bak,backup,swp,old,db,sql,asp,aspx,aspx~,asp~,py,py~,rb,rb~,php,php~,bak,bkp,cache,cgi,conf,csv,html,inc,jar,js,json,jsp,jsp~,lock,log,rar,old,sql,sql.gz,http://sql.zip,sql.tar.gz,sql~,swp,swp~,tar,tar.bz2,tar.gz,txt,wadl,zip,.log,.xml,.js.,.json

sleep 4

echo -e "${BLUE} Recon result are saved in $domain ${RESET}"
