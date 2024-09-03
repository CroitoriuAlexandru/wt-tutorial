# Wt C++ tutorial 1 - Install things

Hello World, lets install things.

### Update and upgrade your system.
```
sudo apt-get update
sudo apt-get upgrade
```

### Install git to clone the Wt repository, cmake to build the Wt library, build-essential to compile the Wt library, libboost-all-dev is used by Wt.
```
sudo apt-get install -y git
sudo apt-get install -y cmake
sudo apt-get install -y build-essential 
sudo apt-get install -y libboost-all-dev 
```

### Create a folder for libraries and cd into it.
```
mkdir ~/libs
cd ~/libs
```


### Clone the Wt repository into a folder called wt in libs folder.
```
git clone https://github.com/emweb/wt.git ~/libs/wt
```

### Create a build directory for Wt.
```
cd ~/libs/wt/ && mkdir build
```

### Run cmake to configure the Wt library in the build folder.
```
cd ~/libs/wt/build/ && cmake ../ \
-DENABLE_SQLITE=ON \
-DENABLE_POSTGRES=ON \
-DBUILD_EXAMPLES=OFF \
-DBUILD_TESTS=OFF \
-DENABLE_LIBWTTEST=OFF
```

### Install the Wt library.
```
cd ~/libs/wt/build/ && make
cd ~/libs/wt/build/ && make install
```

### After installing the Wt library, for some reason the system is looking for the compiled files in the wrong place so we need to copy the files to the correct place.
```
cp /usr/local/lib/libwt*.so.* /usr/lib/
```

