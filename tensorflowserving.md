# Initial TensorFlow Serving

## Install Bazel

### Using Bazel custom APT repository (recommended)

1. Add Bazel distribution URI as a package source (one time setup)
    ```bash
    echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
    curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
    ```
    If you want to install the testing version of Bazel, replace stable with testing.

1. Install and update Bazel
    ```bash
    sudo apt-get update && sudo apt-get install bazel
    ```
    Once installed, you can upgrade to a newer version of Bazel with:
    ```bash
    sudo apt-get upgrade bazel
    ```

### Install using binary installer

The binary installers are on Bazel's [GitHub releases page](https://github.com/bazelbuild/bazel/releases).

The installer contains the Bazel binary and the required JDK. Some additional libraries must also be installed for Bazel to work.

1. Install required packages
    ```bash
    sudo apt-get install pkg-config zip g++ zlib1g-dev unzip
    ```
1. Download Bazel
    Go to Bazel's [GitHub releases page](https://github.com/bazelbuild/bazel/releases).

    Download the binary installer `bazel-0.5.0-installer-linux-x86_64.sh`. This installer contains the Bazel binary and the required JDK, and can be used even if JDK is already installed.

    Note that two other versions of the installer exist:
    * bazel-0.5.0-without-jdk-installer-linux-x86_64.sh: version without embedded JDK 8. Only use this installer if you already have JDK 8 installed.
    * bazel-0.5.0-jdk7-installer-linux-x86_64.sh: last release compatible with JDK 7.
1. Run the installer
    ```bash
    chmod +x bazel-0.5.2-installer-linux-x86_64.sh
    ./bazel-0.5.0-installer-linux-x86_64.sh --user
    ```
    The `--user` flag installs Bazel to the `$HOME/bin` directory on your system and sets the .bazelrc path to `$HOME/.bazelrc`. Use the `--help` command to see additional installation options.

1. Set up your environment

    If you ran the Bazel installer with the `--user` flag as above, the Bazel executable is installed in your `$HOME/bin` directory. It's a good idea to add this directory to your default paths, as follows:
    ```bash
    echo "source /home/bkwang/.bazel/bin/bazel-complete.bash" > ~/.bashrc
    export PATH="$PATH:$HOME/bin"
    ```
    You can also add this command to your ~/.bashrc file.

    Once installed, you can upgrade to a newer version of Bazel with:
    ```bash
    sudo apt install --upgrade bazel
    ```

## Install gRPC

You can find the installation instructions here.

### From PyPI

```bash
sudo pip install grpcio
```

## Install Packages

To install TensorFlow Serving dependencies, execute the following:

```bash
sudo apt update && sudo apt install -y --no-install-recommends \
        build-essential \
        curl \
        libcurl3-dev \
        git \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python-dev \
        python-numpy \
        python-pip \
        software-properties-common \
        swig \
        zip \
        zlib1g-dev
```

## Clone TansorFlow Serving

### clone

```bash
git clone --recurse-submodules https://github.com/tensorflow/serving
```

### config

```bash
cd tensorflow
./configure
cd ..
```

### build

To build the entire tree, execute:

```bash
bazel build tensorflow_serving/...
```

Binaries are placed in the bazel-bin directory, and can be run using a command like:

```bash
bazel-bin/tensorflow_serving/model_servers/tensorflow_model_server
```

To test your installation, execute:

```bash
bazel test tensorflow_serving/...
```