#!/bin/bash
if [ "$(id -u)" != "0" ]; then
    echo "Sorry, you are not root."
    exit 1
fi

VER=$(curl -s https://needrp.net/updater/ver.txt)
echo 
echo 
echo Newest artifacts version is $VER
read -r -p "Do you want install this version? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 

        echo 
        echo 
        echo Getting link for newest artifacts
        LINK=$(curl -s https://needrp.net/updater/link.txt)
        VER=$(curl -s https://needrp.net/updater/ver.txt)
        echo 
        echo 
        echo Deleting old artifacts...
        echo 
        echo 
        echo fx.tar.gz
        rm -r fx.tar.xz 2> /dev/null
        echo run.sh
        rm -r run.sh 2> /dev/null
        echo alpine/
        rm -r alpine 2> /dev/null
        echo vmenufix.zip
        rm -r vmenufix.zip 2> /dev/null
        echo 
        echo 
        echo Downloading fivem artifacts version: $VER ...
        echo 
        echo 
        wget -q $LINK
        echo Unpacking fivem artifacts...
        echo 
        echo 
        tar xf fx.tar.xz
        echo Removing artifacts package...
        echo 
        echo 
        rm -r fx.tar.xz
        echo Downloading Vmenu Fix...
        echo 
        echo 
        wget -q https://needrp.net/updater/vmenufix/vmenufix.zip
        echo Unzipping Vmenu Fix...
        echo 
        echo 
        unzip -q -o vmenufix.zip -d alpine/opt/cfx-server/citizen/clr2/lib/mono/4.5/
        echo Deleting Vmenu Fix...
        echo 
        echo 
        rm -r vmenufix.zip 2> /dev/null
        echo Done!
        ;;
    *)
        echo OK
        exit
        ;;
esac

### Script made by Bartixxx
### Discord: Bartixxx:1904
