#!/bin/bash

docker images

echo "-----------Start from a image----------------" 
echo "Choose a image to start:"

read imageName
if [ ! ${imageName} ]; then
    echo "exit without choose... :) "
    exit 1
fi

# start with a name
echo "Start with a name?"
read containerName

# start with binding custom folder...
yourBinding=""
echo "Binding custom folder just assign a local path. like: ~/docker"
read bingding
if [ ${bingding} ]; then
    yourBinding=${bingding}
    echo "==binding local folder ${yourBinding} to container /home=="
fi

#docker run -itd --name webx --net=none -h webx ubt1604:v1.1.2 /bin/bash

if [ ! ${containerName} -a ! ${yourBinding} ]; then
    echo "docker run --network=bridge -p 80:80 -p 443:443 --expose 80 --expose 443 -it ${imageName} /bin/bash"
    docker run --network=bridge -p 80:80 -p 443:443 --expose 80 --expose 443 -it ${imageName} /bin/bash
elif [ ${containerName} ]; then
    if [ ${yourBinding} ]; then
        echo "docker run --network=bridge --name ${containerName} -h ${containerName} -p 80:80 -p 443:443 --expose 80 --expose 443 -itv ${yourBinding}:/home ${imageName} /bin/bash"
        docker run --network=bridge --name ${containerName} -h ${containerName} -p 80:80 -p 443:443 --expose 80 --expose 443 -itv ${yourBinding}:/home ${imageName} /bin/bash
    else
        echo "docker run --network=bridge --name ${containerName} -h ${containerName} -p 80:80 -p 443:443 --expose 80 --expose 443 -it ${imageName} /bin/bash"
        docker run --network=bridge --name ${containerName} -h ${containerName} -p 80:80 -p 443:443 --expose 80 --expose 443 -it ${imageName} /bin/bash
    fi
fi