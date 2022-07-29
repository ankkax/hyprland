#/bin/bash
weather=`curl -sf "http://api.openweathermap.org/data/2.5/weather?APPID="6764fd617d1468b8f5927d49bed21c79"&id="640999"&units="metric"" | jq ".name" | cut -d "." -f 1 |tr -d '"'`
echo ${weather}
