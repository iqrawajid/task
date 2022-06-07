echo 
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
for ip in $(cat output.txt)
do
host $ip | grep "has address" | cut -d " " -f4
done
echo 
figlet "Brute Force"
echo
sudo dnsrecon -t brt -d $domain -D /home/kali/Desktop/practice/subdomains-top1million-5000.txt -f -c /home/kali/Desktop/practice/file.csv
echo
figlet "results"
echo 
cat file.csv
echo
