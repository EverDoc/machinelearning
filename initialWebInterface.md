# Initial Web Interface

## install prerequisites

```bash
cd tf_face/tf/web
pip install -t lib -r requirements.txt
```

## Bazel Build

```bash
cd serving
ln -s ~/tf_face tf_models
bazel build tf_models/tf_face/tf/web/predict_serving
```

Comments out the wrongly importing

See: the issue [#421 NotFoundError in mnist_export example](https://github.com/tensorflow/serving/issues/421)

`NotFoundError: _single_image_random_dot_stereograms.so: undefined symbol: _ZN6google8protobuf8internal10LogMessageC1ENS0_8LogLevelEPKci`

```python
#from tensorflow.contrib.image.python.ops.single_image_random_dot_stereograms import single_image_random_dot_stereograms
```

in bazel-bin/tf\_models/tf\_face/tf/web/predict\_serving.runfiles/org\_tensorflow/tensorflow/contrib/image/\_\_init\_\_.py

## Run predict server

```bash
serving>$ bazel-bin/tf_models/tf_face/tf/web/predict_serving &
serving>$ bazel-bin/tensorflow_serving/model_servers/tensorflow_model_server --port=9000 --model_name=pubfig --model_base_path=/home/bkwang/tf_face/sample_run/models
```

## Access Web interface

<http://localhost:8080>