# auto-caesium
Docker container that uses bardiir/caesium to auto-optimize a full directory of files, ignoring non optimizable and failing files

[![](https://images.microbadger.com/badges/version/bardiir/auto-caesium.svg)](https://microbadger.com/images/bardiir/auto-caesium "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/bardiir/auto-caesium.svg)](https://microbadger.com/images/bardiir/auto-caesium "Get your own image badge on microbadger.com") [![GitHub last commit](https://img.shields.io/github/last-commit/bardiir/auto-caesium.svg)](https://github.com/bardiir/auto-caesium) [![Docker Automated build](https://img.shields.io/docker/automated/bardiir/auto-caesium.svg)](https://hub.docker.com/r/bardiir/auto-caesium/builds/) [![Docker Build Status](https://img.shields.io/docker/build/bardiir/auto-caesium.svg)](https://hub.docker.com/r/bardiir/auto-caesium/builds/)

## Usage
```
$ docker pull bardiir/auto-caesium
$ docker run -v /path/to/your/image/files:/caesium bardiir/auto-caesium
```
`docker pull bardiir/auto-caesium` does update the instance image.  
`docker run...` will mount the folder `/path/to/your/image/files` into the docker image and convert all files within that folder replacing image files with optimized versions and leaving everything that cannot be optimized without errors as is.

## ToDo
- Don't optimize already optimized images again

## Disclaimer / Warning

The software used in this container is far from beeing stable. As this container does replace files inline make sure to keep a backup of all files at any time prior to using this as this can corrupt data and cause potential data loss on everything it is used on!
