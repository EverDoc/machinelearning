# Ubuntu Initial

## Update apt index

```bash
sudo apt update
sudo apt install -y --no-install-recommends apt-utils
```

## Clean OS

```bash
# remove libreoffice
sudo apt remove libreoffice-common
# remove Amazon link
sudo apt remove unity-webapps-common
# remove other unused programs
sudo apt remove thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg \
aisleriot gnome-mines cheese transmission-common gnome-orca webbrowser-app gnome-sudoku \
landscape-client-ui-install \
onboard deja-dup
```

## Enable ssh

<http://ubuntuhandbook.org/index.php/2016/04/enable-ssh-ubuntu-16-04-lts/>

```bash
# 1. To install it, open terminal (Ctrl+Alt+T) or log in Ubuntu server and run command:
sudo apt install -y --no-install-recommends openssh-server
# 2. After that, you should have SSH service enabled in your system, you may check its status by running command:
sudo service ssh status
# *3. You may change some settings (e.g., the listening port, and root login permission) by editing the configuration file via command:
sudo nano /etc/ssh/sshd_config
## On Ubuntu desktop, you may use gedit instead of nano:
# Finally apply the changes by restarting or reloading SSH:
sudo service ssh restart
```

## Enable ftp

<https://help.ubuntu.com/lts/serverguide/ftp-server.html>

```bash
sudo apt install vsftpd
```

### configure

```bash
sudo vim /etc/vsftpd.conf
```

* Anonymous connection: 
    * `anonymous_enable=Yes`
    * `anon_upload_enable=YES` defaults not allow anonymous connection upload files
* Authenticated connection
    * `write_enable=YES`
* Securing FTP
    * `chroot_local_user=YES`
* SSL
    * `ssl_enable=Yes`
    * `rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem`
    * `rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key`

## Developer Essentials

```bash
sudo apt install -y --no-install-recommends git curl vim unzip wget
```

## Build tools

```bash
sudo apt install -y --no-install-recommends build-essential cmake
```

## OpenBLAS

```bash
sudo apt install -y --no-install-recommends libopenblas-dev
```

## Install FlashPLayer

```bash
sudo apt install -y --no-install-recommends flashplugin-installer
```

## Install Chrome

```bash
# download installation package <https://dl.google.com/Linux/direct/google-chrome-stable_current_amd64.deb>
sudo apt install -y --no-install-recommends libappindicator1 libindicator7
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -f install
```

## Configurate

### Set UTC time format

```bash
sudo vim /etc/default/rcS
# add or update line
# UTC=yes
```

### Instal ExFat file system driver

```bash
sudo apt install -y --no-install-recommends exfat-fuse
```

### Proxy

<https://askubuntu.com/questions/158557/setting-proxy-from-terminal>

`/etc/environment`

### Could not get lock /var/lib/dpkg/lock

<https://askubuntu.com/questions/15433/unable-to-lock-the-administration-directory-var-lib-dpkg-is-another-process>

```bash
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
```