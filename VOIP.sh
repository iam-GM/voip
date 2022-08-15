#!/bin/sh
echo "sdr" | sudo -S apt-get update -y
echo "sdr" | sudo -S apt-get upgrade -y
echo "sdr" | sudo -S apt update -y 
echo "sdr" | sudo -S apt upgrade -y
echo "sdr" | sudo -S apt autoremove -y
echo "sdr" | sudo -S apt autoclean -y
echo "sdr" | sudo -S apt-get -y install git swig cmake doxygen build-essential libboost-all-dev libtool libusb-1.0-0 libusb-1.0-0-dev libudev-dev libncurses5-dev libfftw3-bin libfftw3-dev libfftw3-doc libcppunit-1.14-0 libcppunit-dev libcppunit-doc ncurses-bin cpufrequtils python-numpy python-numpy-doc python-numpy-dbg python-scipy python-docutils qt4-bin-dbg qt4-default qt4-doc libqt4-dev libqt4-dev-bin python-qt4 python-qt4-dbg python-qt4-dev python-qt4-doc python-qt4-doc libqwt6abi1 libfftw3-bin libfftw3-dev libfftw3-doc ncurses-bin libncurses5 libncurses5-dev libncurses5-dbg libfontconfig1-dev libxrender-dev libpulse-dev swig g++ automake autoconf libtool python-dev libfftw3-dev libcppunit-dev libboost-all-dev libusb-dev libusb-1.0-0-dev fort77 libsdl1.2-dev python-wxgtk3.0 git libqt4-dev python-numpy ccache python-opengl libgsl-dev python-cheetah python-mako python-lxml doxygen qt4-default qt4-dev-tools libusb-1.0-0-dev libqwtplot3d-qt5-dev pyqt4-dev-tools python-qwt5-qt4 cmake git wget libxi-dev gtk2-engines-pixbuf r-base-dev python-tk liborc-0.4-0 liborc-0.4-dev libasound2-dev python-gtk2 libzmq3-dev libzmq5 python-requests python-sphinx libcomedi-dev python-zmq libqwt-dev libqwt6abi1 python-six libgps-dev libgps23 gpsd gpsd-clients python-gps python-setuptools libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev net-tools
echo "sdr" | sudo -S apt -y install libgmp-dev python3-numpy python3-mako python3-sphinx python3-lxml libqwt-qt5-dev libqt5opengl5-dev python3-pyqt5 liblog4cpp5-dev python3-yaml python3-click python3-click-plugins python3-zmq python3-scipy socat kazam asterisk libpcsclite-dev libboost-system-dev libboost-test-dev libboost-thread-dev qtbase5-dev
echo "sdr" | sudo -S cp $HOME/sdr/voip/cpufrequtils /etc/default/
echo "sdr" | sudo -S systemctl disable ondemand.service 
cd /etc/asterisk/
echo "sdr" | sudo -S mv sip.conf sip.conf.backup
echo "sdr" | sudo -S mv voicemail.conf voicemail.conf.backup
echo "sdr" | sudo -S mv extensions.conf extensions.conf.backup
cd $HOME/sdr/voip/
echo "sdr" | sudo -S cp $HOME/sdr/voip/sip.conf /etc/asterisk/
echo "sdr" | sudo -S cp $HOME/sdr/voip/voicemail.conf /etc/asterisk/
echo "sdr" | sudo -S cp $HOME/sdr/voip/extensions.conf /etc/asterisk/
mkdir $HOME/sdr/src/
cd $HOME/sdr/src/
git clone https://github.com/ettusresearch/uhd
mkdir $HOME/sdr/src/uhd/host/build/
cd $HOME/sdr/src/uhd/host/build/
git checkout v4.0.0.0
cmake ../
make
echo "sdr" | sudo -S make install
echo "sdr" | sudo -S ldconfig
echo "sdr" | sudo -S uhd_images_downloader
cd $HOME/src/uhd/host/utils/
echo "sdr" | sudo -S cp uhd-usrp.rules /etc/udev/rules.d/
echo "sdr" | sudo -S udevadm control --reload-rules
echo "sdr" | sudo -S udevadm trigger
cd $HOME/sdr/src/
git clone https://github.com/srsran/srsGUI.git
mkdir $HOME/sdr/src/srsGUI/build/
cd $HOME/sdr/src/srsGUI/build/
cmake ../
make
echo "sdr" | sudo -S make install
echo "sdr" | sudo -S ldconfig
cd $HOME/sdr/src/
git clone https://github.com/srsRAN/srsRAN.git
mkdir $HOME/sdr/src/srsRAN/build/
cd $HOME/sdr/src/srsRAN/build/
cmake ../
make
echo "sdr" | sudo -S make install
echo "sdr" | sudo -S ldconfig	
echo "sdr" | sudo -S srsran_install_configs.sh user
cd $HOME/sdr/voip/
echo "sdr" | sudo -S cp $HOME/sdr/voip/user_db.csv $HOME/sdr/.config/srsran/
cd $HOME/sdr/
