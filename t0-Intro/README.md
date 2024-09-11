# Wt C++ tutorial serries intro


Hello World my name is Alex and in this tutorial series I'll show you how to build and deploy web applications written in C++. [Wt (WebToolkit)](https://www.webtoolkit.eu/wt) is the framework we'll be using for developing widget based web applications. I sugest to take 5 min read of the [introduction](https://www.webtoolkit.eu/wt/doc/tutorial/wt.html) section of the getting started guide of [Wt]((https://www.webtoolkit.eu/wt)) to get a general understanding of the framework.

I'v decided to create this tutorial series because there's a lack of tutorials on the topic and it makes starting with it harder than it should be.

For development we'll use Ubuntu, and if you are like me and use Windows you will need to install Ubuntu in WSL, so lets get that set up.
...

##### install necessary packages
apt-get update 
apt-get install -y git
apt-get install -y cmake
apt-get install -y build-essential 
apt-get install -y libboost-all-dev 
<!-- apt-get install -y libssl-dev  -->
<!-- apt-get install -y libcrypto++-dev -->

##### Install Wt
git clone --branch 4.10-release https://github.com/emweb/wt.git wt
cd wt
mkdir build
cd build
cmake ../ \
-DENABLE_SQLITE=ON \
-DENABLE_POSTGRES=ON \
-DBUILD_EXAMPLES=OFF \
-DBUILD_TESTS=OFF \
-DENABLE_LIBWTTEST=OFF
make
make install
cp /usr/local/lib/libwt*.so.* /usr/lib/
cd ../..
mkdir github-repos
cd github-repos

##### Install Caddy
apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
apt update
apt install caddy

Now that we have a development environment, in the next tutorial we'll install all the necessary things.

https://www.jenkins.io/doc/book/installing/linux/


sudo systemctl start <service-name>
sudo systemctl stop <service-name>
sudo systemctl restart <service-name>
sudo systemctl enable <service-name>
sudo systemctl disable <service-name>

sudo systemctl restart jenkins

git config --global user.name "Alexandru Croitoriu" 
git config --global user.email "croitoriu.alexandru.code@gmail.com"


 ssh-keygen -t rsa -b 4096 -C "croitoriu.alexandru.code@gmail.com"

 ssh-keyscan github.com >> /var/lib/jenkins/.ssh/known_hosts



 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


### add jenkins to docker group
sudo usermod -aG docker jenkins

getent group docker


### Portainer
sudo docker run -d -p 8000:8000 -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.21.1
