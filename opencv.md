# Initial

## Install opencv

* [install-opencv-2.x-in-ubuntu.sh](install-opencv-2.x-in-ubuntu.sh)
* [install-opencv-3.x-in-ubuntu.sh](install-opencv-3.x-in-ubuntu.sh)

Take version 2.4.13 for example

```bash
chmod +x install-opencv-2.x-in-ubuntu.sh
./install-opencv-2.x-in-ubuntu.sh
```

## Check if installation works

```bash
$ python
>>> import cv2
```

* __ImportError: No module named cv2__
    ```bash
    sudo apt-get install python-opencv
    ```
* __ImportError: libopencv_reg.so.3.1: cannot enable executable stack as shared object requires: Invalid argument__
    ```bash
    sudo apt-get install execstack
    sudo /usr/sbin/execstack -c /usr/local/lib/libopencv_*
    ```
* __libdc1394 error: Failed to initialize libdc1394__
    ```bash
    sudo ln -s /dev/null /dev/raw1394
    ```