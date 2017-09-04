# Jupyter

## Jupyter Notebook


```bash
sudo pip3 --no-cache-dir install jupyter
```
Allow access from outside the container, and skip trying to open a browser.

__NOTE: disable authentication token for convenience. DON'T DO THIS ON A PUBLIC SERVER.__

```bash
sudo mkdir .jupyter
sudo echo "c.NotebookApp.ip = '*'" \
         "\nc.NotebookApp.open_browser = False" \
         "\nc.NotebookApp.token = ''" \
         > .jupyter/jupyter_notebook_config.py
```

## Jupyter notebook extension

```bash
sudo pip3 --no-cache-dir install jupyter_contrib_nbextensions

# install javscript and css files
jupyter contrib nbextension install --user
```

### enable Code Prettifier

```bash
# Prerequisites
sudo pip3 --no-cache-dir install yapf
# enable
jupyter nbextension enable code_prettify/code_prettify
```

## 28 Jupyter Notebook tips, tricks and shortcuts
<https://www.dataquest.io/blog/jupyter-notebook-tips-tricks-shortcuts/>