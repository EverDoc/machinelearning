# Python

## Check python

```bash
python
```

## Install the letest version of pip

```bash
sudo apt install -y --no-install-recommends python-pip
sudo pip install --upgrade pip
```

## Python 3.5

For convenience, alisas (but don't sym-link) python & pip to python3 & pip3 as recommended in:
<http://askubuntu.com/questions/351318/changing-symlink-python-to-python3-causes-problems>

```bash
sudo apt-get install -y --no-install-recommends python3.5 python3.5-dev python3-pip
sudo pip3 install --no-cache-dir --upgrade pip setuptools
sudo echo "alias python='python3'" >> /root/.bash_aliases
sudo echo "alias pip='pip3'" >> /root/.bash_aliases
```

### Pillow and it's dependencies

```bash
sudo apt-get install -y --no-install-recommends libjpeg-dev zlib1g-dev
sudo pip3 install --no-cache-dir Pillow
```

### Common libraries

```bash
sudo pip3 --no-cache-dir install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com \
    numpy scipy sklearn scikit-image pandas matplotlib
```