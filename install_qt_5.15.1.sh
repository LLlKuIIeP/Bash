#!/bin/bash

cd  /tmp

wget http://download.qt.io/official_releases/qt/5.15/5.15.1/single/qt-everywhere-src-5.15.1.tar.xz
tar -xf qt-everywhere-src-5.15.1.tar.xz
cd qt-everywhere-src-5.15.1

apt-get install -y bison flex gperf libgstreamer-plugins-base1.0-dev libasound2-dev libatkmm-1.6-dev libbz2-dev libcap-dev libcups2-dev libdrm-dev libegl1-mesa-dev libfontconfig1-dev libfreetype6-dev libgcrypt20-dev libglu1-mesa-dev libgstreamer1.0-dev libicu-dev libnss3-dev libpci-dev libpulse-dev libssl-dev libudev-dev libx11-dev libx11-xcb-dev libxcb-composite0 libxcb-composite0-dev libxcb-cursor-dev libxcb-cursor0 libxcb-damage0 libxcb-damage0-dev libxcb-dpms0 libxcb-dpms0-dev libxcb-dri2-0 libxcb-dri2-0-dev libxcb-dri3-0 libxcb-dri3-dev libxcb-ewmh-dev libxcb-ewmh2 libxcb-glx0 libxcb-glx0-dev libxcb-icccm4 libxcb-icccm4-dev libxcb-image0 libxcb-image0-dev libxcb-keysyms1 libxcb-keysyms1-dev libxcb-present-dev libxcb-present0 libxcb-randr0 libxcb-randr0-dev libxcb-record0 libxcb-record0-dev libxcb-render-util0 libxcb-render-util0-dev libxcb-render0 libxcb-render0-dev libxcb-res0 libxcb-res0-dev libxcb-screensaver0 libxcb-screensaver0-dev libxcb-shape0 libxcb-shape0-dev libxcb-shm0 libxcb-shm0-dev libxcb-sync-dev libxcb-sync-dev libxcb-sync1 libxcb-util-dev libxcb-util0-dev libxcb-util1 libxcb-xv0 libxcb-xv0-dev libxcb-xf86dri0 libxcb-xf86dri0-dev libxcb-xfixes0 libxcb-xfixes0-dev libxcb-xinerama0 libxcb-xinerama0-dev libxcb-xkb-dev libxcb-xkb1 libxcb-xtest0 libxcb-xtest0-dev libxcb-xv0 libxcb-xv0-dev libxcb-xvmc0 libxcb-xvmc0-dev libxcb1 libxcb1-dev libxcomposite-dev libxcursor-dev libxdamage-dev libxext-dev libxfixes-dev libxi-dev libxrandr-dev libxrender-dev libxslt1-dev libxss-dev libxtst-dev perl python2 python3 ruby libgl1-mesa-dev libglu1-mesa-dev libwayland-dev 
chmod a+x configure
./configure -prefix /usr/local -release -platform linux-g++-64 -opensource -confirm-license -make libs -nomake tests -nomake examples -skip qtserialport

#rm -f config.cache && ./configure -prefix /usr/local -release -platform linux-g++-64 -opensource -confirm-license -make libs -nomake tests -nomake examples -skip qtserialport -make tools -v 2>&1 1>/dev/null | grep "pkg-config did not find package" -B 3


make -j8

make install
