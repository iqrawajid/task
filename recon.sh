echo 
figlet "Welcome"
echo "Please enter your domain name: "
read domain
echo
sublist3r -v -d $domain -o output.txt
echo ===========================
echo
figlet "Subdomains"
echo
cat output.txt
echo 
echo ===========================
echo
figlet "Ip Resolution"
echo
#here we use forloop for ip resolution
for ip in $(cat output.txt)
do
host $ip | grep "has address" | cut -d " " -f4 | sort
done
echo 
figlet "Brute Force"
echo
#I've also attached subdomain.txt file 
#here we are using dnsrecon tool for subdomain brute host
sudo dnsrecon -t brt -d $domain -D /home/kali/Desktop/practice/subdomains-top1million-5000.txt -f -c /home/kali/Desktop/practice/output.csv
echo
figlet "Results"
echo 
#The following command will print the entire output.csv file like cat
awk '{ print $1 } ' output.csv | sort -u | uniq -c
echo
figlet "The End"
