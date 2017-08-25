sudo apt install -y --no-install-recommends \
    libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libgtk2.0-dev \
    liblapacke-dev checkinstall

#sudo git clone https://github.com/opencv/opencv.git /usr/local/src/opencv
#sudo git clone https://github.com/opencv/opencv_contrib.git /usr/local/src/opencv_contrib
wget https://github.com/opencv/opencv/archive/3.3.0.tar.gz -O opencv-3.3.0.tar.gz && \
tar -xvf opencv-3.3.0.tar.gz && \
sudo mv opencv-3.3.0 /usr/local/src/opencv

wget https://github.com/opencv/opencv_contrib/archive/3.3.0.tar.gz -O opencv_contrib-3.3.0.tar.gz && \
tar -xvf opencv_contrib-3.3.0.tar.gz && \
sudo mv opencv_contrib-3.3.0 /usr/local/src/opencv_contrib

cd /usr/local/src/opencv
sudo mkdir build
cd build
sudo cmake -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D BUILD_TESTS=OFF \
        -D BUILD_opencv_gpu=OFF \
        -D BUILD_PERF_TESTS=OFF \
        -D WITH_IPP=OFF \
        -D OPENCV_EXTRA_MODULES_PATH=/usr/local/src/opencv_contrib/modules \
        -D OPENCV_EXTRA_MODULES_PATH=/usr/local/src/opencv_contrib/modules -D BUILD_opencv_xfeatures2d=OFF /usr/local/src/opencv \
        -D OPENCV_EXTRA_MODULES_PATH=/usr/local/src/opencv_contrib/modules -D BUILD_opencv_dnn_modern=OFF /usr/local/src/opencv \
        -D OPENCV_EXTRA_MODULES_PATH=/usr/local/src/opencv_contrib/modules -D BUILD_opencv_dnns_easily_fooled=OFF /usr/local/src/opencv \
        -D PYTHON_DEFAULT_EXECUTABLE=$(which python3) ..
sudo make -j $(($(nproc) + 1))
sudo make install

sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
sudo apt update

cd /usr/local/src/opencv
sudo rm -r build

# Reboot your machine and run following command to check installed version
# pkg-config --modversion opencv
# Uninstall
# sudo apt-get remove opencv