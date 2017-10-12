# SSHFS


SSHFS is a tool that uses `SSH` to enable mounting of a remote filesystem on a local machine; 
the network is (mostly) transparent to the user. Because SSHFS authenticates connections, you 
can be sure that only those who should have access to remote directories can mount them (as 
long as everything is configured properly). ([see more](https://help.ubuntu.com/community/SSHFS))

## Install & Usage

```bash
# install
sudo apt install -y sshfs

# usage
# 1. create a directory for mount
mkdir ~/sshmnt
# 2. mount remote directory
sshfs <user>@<remote ip>:<remote directory> ~/sshmnt
# 3. unmount
fusermount -u ~/sshmnt
```

see more:
 * __[Mount with SSHFS](<https://www.server-world.info/en/note?os=Ubuntu_16.04&p=sshfs>)__
 * __[Ubuntu 15.10 no fuse group](https://stackoverflow.com/questions/35635631/ubuntu-15-10-no-fuse-group)__
 
 ## Within Windows, MaxOS
 
 see [How To Use SSHFS to Mount Remote File Systems Over SSH](https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh)
 

