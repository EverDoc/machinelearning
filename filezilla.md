# ![fillezilla](images/filezilla_24.png) Filezilla

## Client Installation

1. Add GetDeb repository

    ```bash
    sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb ap
    ps" >> /etc/apt/sources.list.d/getdeb.list'
    
    # install the key to make ubuntu trust the packages
    wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-ke
    y add -
    ```

1. Install client

    ```bash
    sudo apt update
    sudo apt install filezilla
    ```