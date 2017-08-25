# Install Google CloudPlatform SDK

1. add could.google.com to hosts

    ```bash
    sudo gedit /etc/hosts

    172.217.6.14 cloud.google.com
    172.217.6.14 packages.cloud.google.com
    172.217.6.14 www3.l.google.com
    ```
1. Install with apt if the network is available to access google
    ```bash
    # Create an environment variable for the correct distribution
    export CLOUD\_SDK\_REPO="cloud-sdk-$(lsb_release -c -s)"

    # Add the Cloud SDK distribution URI as a package source
    echo "deb http://packages.cloud.google.com/apt $CLOUD\_SDK\_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

    # Import the Google Cloud Platform public key
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

    # Update the package list and install the Cloud SDK
    sudo apt-get update && sudo apt-get install google-cloud-sdk
    ```
1. Install with offline-package. Dowload sdk packages Linux(x86_64) from <https://cloud.google.com/sdk/downloads>
    ```bash
    wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-160.0.0-linux-x86_64.tar.gz -O google-cloud-sdk.tar.gz
    mkdir google-cloud-sdk
    tar -xvf google-cloud-sdk.tar.gz google-cloud-sdk
    ```
1. Extract and install sdk
    ```bash
    ./google-cloud-sdk/install.sh
    ```
1. Optional. Install google cloud components
    ```bash
    # additional information is available at <https://cloud.google.com/sdk/usage-statistics>
    # install or remove components
    $ gcloud components install COMPONENT_ID
    $ gcloud components remove COMPONENT_ID
    ```

## Initialize the SDK

1. Run the following at a command prompt:
    ```bash
    gcloud init --skip-diagnostics
    ```
1. Accept the option to log in using your Google user account:
    ```bash
    To continue, you must log in. Would you like to log in (Y/n)? Y
    ```
1. In your browser, log in to your Google user account when prompted and click **Allow** to grant permission to access Google Cloud Platform resources.
1. At the command prompt, select a Cloud Platform project from the list of those where you have **Owner**, **Editor** or **Viewer** permissions:
    ```bash
    Pick cloud project to use:
     [1] [my-project-1]
     [2] [my-project-2]
     ...
    Please enter your numeric choice:
    ```
1. If you only have one project, `gcloud init` selects it for you.
1. If you have the Google Compute Engine API enabled, gcloud init allows you to choose a default Compute Engine zone:
    ```bash
    Which compute zone would you like to use as project default?
     [1] [asia-east1-a]
     [2] [asia-east1-b]
     ...
     [14] Do not use default zone
    Please enter your numeric choice:
    # You can change it by running [gcloud config set compute/zone **NAME**]
    ```
    `gcloud init` confirms that you have complete the setup steps successfully:
    ```bash
    gcloud has now been configured!
    You can use [gcloud config] to change more gcloud settings.

    Your active configuration is: [default]
    ```

## Training Sample

Training a model to serve using Tensorflow Serving

```bash
gcloud ml-engine local train --package-path=pubfig_export --module-name=pubfig_export.export \
--num_classes=33 \
--valid_batch_size=264
```

* __ValueError: Only call `softmax_cross_entropy_with_logits` with named arguments (labels=..., logits=..., ...)__
    ```python
    tf.nn.softmax_cross_entropy_with_logits(logits = yPredbyNN, labels=Y)
    ```

## check model

```bash
$> ls /tmp/model/00000001
checkpoint  export.data-00000-of-00001  export.index  export.meta
```