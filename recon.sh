purple="\033[0;35m"
blue="\033[0;34m"
red="\033[31m"
green="\033[0;32m"
yellow="\033[0;33m"
cyan="\033[0;36m"
nc="\033[0m"
echo "${blue}"
figlet "Welcome"
echo "Please enter your domain name: "
read domain
echo 
sublist3r -v -d $domain -o output.txt
echo "${green}"
echo ===========================
echo "${yellow}"
figlet "Subdomains"
echo 
cat output.txt
echo 
echo ===========================
echo "${green}"
figlet "Ip Resolution"
echo
for ip in $(cat output.txt)
do
host $ip | grep "has address" | cut -d " " -f4 | sort -u
done
echo
echo ===========================
echo "${red}"   
figlet "Brute Force"
echo
#I've also attached subdomain.txt file 
#here we are using dnsrecon tool for subdomain brute host
sudo dnsrecon -t brt -d $domain -D /home/kali/Desktop/practice/subdomains-top1million-5000.txt -f -c /home/kali/Desktop/practice/output.csv
echo "${cyan}"
figlet "Results"
echo 
#The following command will print the entire output.csv file like cat
echo 
awk '{ print $1 } ' output.csv | sort -u | uniq -c
echo
#we are going to scan our subdomains in loop using Nmap
echo "${blue}"
figlet "Scanning"
echo "${green}"
for scan in $(cat output.txt)
do
sudo nmap -sV -O $scan -oN /home/kali/Desktop/practice/output.txt
done 
echo ===========================
echo "${yellow}" 
figlet "The End"
