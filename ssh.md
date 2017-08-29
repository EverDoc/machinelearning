# Connecting to GitHub with SSH

Reference: [Connecting to GitHub with SSH](https://help.github.com/articles/connecting-to-github-with-ssh/)

## Checking for existing SSH keys

```bash
ls -al ~/.ssh
# Lists the files in your .ssh directory, if they exist
# by default, the filenames of the public keys are one of the following:
id_dsa.pub
id_ecdsa.pub
id_ed25519.pub
id_rsa.pub
```

## Generating a new SSH key and adding it to the ssh-agent

```bash
# Generating a new SSH key
ssh-keygen -t rsa -b 4096 -C "baikangwang@hotmail.com"

Generating public/private rsa key pair.

Enter a file in which to save the key (/home/bkwang/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase):
Enter same passphrase again:

# Adding your SSH key to the ssh-agent
# 1. start the ssh-agent in background
eval "$(ssh-agent -s)"
Agent pid 59566

# 2. add your SSH private key to the ssh-agent.
ssh-add ~./ssh/id_rsa
```
For more information, see "[Working with SSH key passphrase](https://help.github.com/articles/working-with-ssh-key-passphrases)"


## Adding a new SSH key to your GitHub account

1. Copy the SSH key to your clipboard
    ```bash
    # Downloads and installs xclip
    sudo apt install -y --no-install-recommends xclip
    
    # Copies the contents of the id_rsa.pub file to your clipboard
    xclip -sel clip < ~/.ssh/id_rsa.pub
    ```
1. Go to github > click profile photo > __Settings__ > __SSH and GPG keys__
1. Click __New SSH key__
1. Gives a descriptive label to __Title__ and paste the key into __Key__
1. Click __Add SSH key__

## Testing your SSH connection

```bash
# Attempts to ssh to Github
ssh -T git@github.com

Warning: Permanently added the RSA host key for IP address '192.30.253.112' to the list of known hosts.
Hi baikangwang! You've successfully authenticated, but GitHub does not provide shell access.
```