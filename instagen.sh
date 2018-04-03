#!/bin/bash
# Instagram Generator
# Don't copy this code without give me the credits, bitch!
# Coded by: github.com/thelinuxchoice
# Instagram: @thelinuxchoice


string4=$(openssl rand -hex 32 | cut -c 1-4)
string8=$(openssl rand -hex 32  | cut -c 1-8)
string12=$(openssl rand -hex 32 | cut -c 1-12)
string16=$(openssl rand -hex 32 | cut -c 1-16)
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"
hmacdevice=$(echo -n "$string4" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2 | cut -c 1-16)
device="android-$hmacdevice"
uuid=$(openssl rand -hex 32 | cut -c 1-32)
phone="$string8-$string4-$string4-$string4-$string12"
guid="$string8-$string4-$string4-$string4-$string12"





banner() {

printf "\e[1;92m  _____              _                               \e[0m\n"
printf "\e[1;92m |_   _|            | |                              \e[0m\n"
printf "\e[1;92m   | |   _ __   ___ | |_   __ _   __ _   ___  _ __   \e[0m\n"
printf "\e[1;92m   | |  | '_ \ / __|| __| / _\` | / _\` | / _ \| '_ \  \e[0m\n"
printf "\e[1;77m  _| |_ | | | |\__ \| |_ | (_| || (_| ||  __/| | | | \e[0m\n"
printf "\e[1;77m |_____||_| |_||___/ \__| \__,_| \__, | \___||_| |_| \e[0m\n"
printf "\e[1;77m                                  __/ |              \e[0m\n"
printf "\e[1;77m                                 |___/               \e[0m\n"
printf "\e[1;45m  Instagram generator v1.0 Author: @thelinuxchoice  \e[0m\n"
printf "\n"
}

function start() {

read -p $'\e[1;92mUsername account: \e[0m' user
read -s -p $'\e[1;92mPassword: \e[0m' pass
printf "\n"
read -p $'\e[1;92mName: \e[0m' name
read -p $'\e[1;92mEmail: \e[0m' email
gen1
}

function gen1() {


header='"Host":"i.instagram.com", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)", "Accept-Language": "en-US", "Accept-Encoding":"gzip", "Cookie2": "$Version=1", "X-IG-Connection-Type": "WIFI", "X-IG-Capabilities": "BQ=="'
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"


data='{"username":"'$user'", "first_name":"'$name'", "password":"'$pass'", "email": "'$email'", "device_id":"'$device'", "guid":"'$guid'"}'


hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

cookies=cookies
var3=$(curl -s -b $cookies -c $cookies --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' "https://instagram.com" && curl -c $cookies -b $cookies  -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/create/")

if [[ "$var3" == *"spam"* ]]; then
printf "\e[1;91m [!] Your IP was blocked due Spam\e[0m\n"
exit 1
elif [[ "$var3" == *"account_created"* ]]; then
printf "\e[1;92m[*] Account has been created successfully!\e[0m\n"
exit 1
else 
printf "\e[1;91m[!] Error! Check output:\e[0m\n"
echo $var3
exit 1
fi
rm -rf cookies
}


#function changeip() {

#killall -HUP tor

#}
banner
start
gen1



