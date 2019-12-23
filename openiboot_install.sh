GREEN='\033[1;32m'
NC='\033[0m'

printf "\n${GREEN}Installing Prerequisites...${NC}\n"
apt-get install -y g++ git scons libtool m4 automake autoconf libxml2-dev python2.7-dev libusb-dev libusb-1.0-0-dev libssl-dev libreadline-dev libzip-dev libbz2-dev libcurl4-openssl-dev libpng-dev texinfo cmake

printf "\n${GREEN}Installing libplist...${NC}\n"
git clone https://github.com/libimobiledevice/libplist
cd libplist
./autogen.sh
make 
make install 
cd ..

printf "\n${GREEN}Installing libusbmuxd...${NC}\n"
git clone https://github.com/libimobiledevice/libusbmuxd
cd libusbmuxd
./autogen.sh 
make 
make install 
cd ..

printf "\n${GREEN}Installing libmobiledevice...${NC}\n"
git clone https://github.com/libimobiledevice/libimobiledevice
cd libimobiledevice
./autogen.sh 
make 
make install 
cd ..

printf "\n${GREEN}Installing usbmuxd...${NC}\n"
git clone https://github.com/libimobiledevice/usbmuxd
cd usbmuxd
./autogen.sh 
make 
make install 
cd ..

printf "\n${GREEN}Installing libirecovery...${NC}\n"
git clone https://github.com/libimobiledevice/libirecovery
cd libirecovery
./autogen.sh 
make 
make install 
cd ..

printf "\n${GREEN}Installing idevicerestore...${NC}\n"
git clone https://github.com/libimobiledevice/idevicerestore
cd idevicerestore
./autogen.sh 
make 
make install 
cd ..

printf "\n${GREEN}Installing xpwn...${NC}\n"
git clone https://github.com/planetbeing/xpwn
cd xpwn
mkdir xpwn-build
cd xpwn-build
cmake ../
make
cd ../..

printf "\n${GREEN}Installing syringe...${NC}\n"
git clone https://github.com/Chronic-Dev/syringe
cd syringe 
make 
cd ..

printf "\n${GREEN}Installing OpeniBoot toolchain, this may take a while...${NC}\n"
git clone https://github.com/idroid-project/openiboot-toolchain
cd openiboot-toolchain
./build-toolchain.sh make
make 
cd ..

printf "\n${GREEN}Installing OpeniBoot...${NC}\n"
git clone https://github.com/idroid-project/openiBoot
cd openiBoot 
cp ../xpwn/xpwn-build/common/libcommon.a ../xpwn/xpwn-build/ipsw-patch/libxpwn.a mk8900image/x86
cd ..

printf "\n${GREEN}Installing OIBC...${NC}\n"
git clone https://github.com/idroid-project/oibc
cd oibc 
make 
cd ..

printf "\n${GREEN}Done.${NC}\n"
