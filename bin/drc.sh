#!/bin/bash

echo " ( ＾∀＾）／Welcome to use docker-run-command＼( ＾∀＾）"
echo ""
echo " choose a start way:"
echo " 1: start from a exists container with its name"
echo " 2: start from a image id"


function startWithContainerName(){
    docker container ls -a -l

    echo "-----------Start from a container----------------" 
    echo "Choose a container to start:"

    read containerName
    if [ ! ${containerName} ]; then
        echo "exit without choose... :) "
        exit 1
    fi
    docker start ${containerName} && docker exec -it ${containerName} /bin/bash
}

function startWithImageId(){
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

}

# ------------------------------ Main Entry ----------------------------------

read choice
if [ $choice == '1' ]; then
    startWithContainerName
elif [ $choice == '2' ]; then
    startWithImageId
else
    echo "Unknown choice"
    exit 1
fi