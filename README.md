## What's open-clt

`open-clt` is a shell collection box for both macOS and Linux development.

It contains quick `ssh login`,`manual ipa packaging` for iOS,`docker` quick start,`npm upgrade`,node uninstall,`cocoapods quick install`,`react native offline packaging`,`google host tool` and so on.

I will share my usefull and important shell tools on this repository all the time

## How to use

1.download and put them on your home directory like this:

```
cd ~
git clone https://github.com/tangkunyin/open-clt.git 
```

2.config environment path in your operating system

```
vi /etc/profile

# paste this in your system profile or user profile 
PATH=$PATH:~/open-clt/bin
export PATH

```

3.make it effect

```
source /etc/profile
```

4.try a host update test

```
# notice: before this command,please backup your current hosts file first. 
sudo host.sh git
```


## Others

All kinds of contributions (enhancements, new features, documentation & code improvements, issues & bugs reporting) are welcome.


