# Convert CRLF to LF(options)

Convert all files under a directory

```bash
cd tf_face/tf/face_extract
find . -type f -print0 | xargs -0 dos2unix
```