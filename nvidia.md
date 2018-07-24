# NVIDIA Driver

## Check Nvidia graphic card

<https://askubuntu.com/questions/524242/how-to-find-out-which-nvidia-gpu-i-have>

Update the PCI info

```bash
sudo update-pciids
```

Show graphic card info

```bash
lspci -nn | grep '\[03'

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP104 [GeForce GTX 1070] [10de:1b81] (rev a1)
```

> NOTE: If it's ambiguous, you could search the PCI ID (something like [10de:11bc]) 
on the Internet for the corrent model name.

## Check the Nvidia Driver Version

1. Check __Linux x86_64/AMD64/EM64T__ in the `Unix Driver Archive` list
    
    <http://www.nvidia.com/object/unix.html>
    
    ![nvidia-driver-list](images/nvidia_driver_list.png)

1. Check if the driver is supported by the graphic card.

    <http://www.nvidia.com/Download/driverResults.aspx/123103/en-us>
    
    ![nvidia-dirver-supported](images/nvidia_driver_supported.png)

## Instal Nvidia Driver

### Install using Software & Updates

<https://linuxhint.com/install-nvidia-drivers-on-ubuntu/>

1. Launch **Software & Updates**
1. Make sure all of theseboxes are marked  
  ![nvidia-driver-download_paramenters](images/nvidia_dirver_download_parameters0.png)
1. Swtich to **Additional Drivers** Tab
1. Change the **Nvidia Corporation** from **using X.Org X server** (open source) to **using Nvidia binary driver**  
  ![nvidia-driver-download_paramenters](images/nvidia_dirver_download_parameters.png)
1. Click **Apply Changes** and wait for a while till it's complete.
1. When the installation is complete 
  _ a green mark right beside **vidia Corporation**
  _ *1 proprietary driver in use* in the bottom
  ![nvidia-driver-install_complete](images/nvidia_dirver_install_complete0.png)
1. Reboot  
  ![nvidia-driver-install_complete](images/nvidia_dirver_install_complete0.png)

### Install using package

<http://www.nvidia.com/Download/driverResults.aspx/118290/en-us>

![nvidia-driver-download](images/nvidia_dirver_download.png)

1. NOT RECOMMAND

### Install using PPA 

<http://www.linuxandubuntu.com/home/how-to-install-latest-nvidia-drivers-in-linux> 

1. Check if the latest driver supported by the PPA is available for the graphic card

    <https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa>

1. Remove older driver
    
    ```bash
    sudo apt purge nvidia*
    ```
    
1. Add the PPA
    
    ```bash
    sudo add-apt-repository ppa: graphics-drivers
    sudo apt update
    ```
    
1. Install the latest dirver

    ```bash
    sudo apt install nvidia-375.66
    ```

1. Reboot and check the installation status

    ```bash
    lsmod | grep nvidia
    ```
    
    If there is no output then your installation has probably failed. It is also possible that the driver is not 
    available in your system's driver database. You can run the following command to check if your system is running 
    on the open source driver nouveau. If the output is negative for nouveau, then all is well with your installation.
     
    ```bash
    lsmod | grep nouveau
    ```

1. Prevent automatic updates
    
    ```bash
    sudo apt-mark hold nvidia-375.66
    ```

1. Removal
    1. Remove above PPA
    1. Rmove Driver
    ```bash
    sudo apt purge nvidia*
    ```
    1. Reboot PC
    
    