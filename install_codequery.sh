#!/bin/sh

sudo apt-get install g++ git cmake sqlite3 libsqlite3-dev qt5-default qttools5-dev-tools qttools5-dev cscope exuberant-ctags

git clone https://github.com/ruben2020/codequery.git

cd codequery

mkdir build
cd build

cmake -G "Unix Makefiles" -DBUILD_QT5=ON ..

make
sudo make install
