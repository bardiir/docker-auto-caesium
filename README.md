# auto-caesium
Docker container that uses caesium to auto-optimize a full directory of files, ignoring non optimizable and failed files

## Usage
```
$ docker run -v /path/to/your/image/files:/caesium bardiir/auto-caesium in out
```

This will mount the folder `/path/to/your/image/files` into the docker image and convert all files within the folder `in` within that folder or copy them if not convertable. `out` will be a 1:1 duplication of `in` just with the images optimized. For not Quality is fixed at `-q80` for caesium.
