# gifify-docker

A docker container for [gifify](https://github.com/vvo/gifify)

![docker-badge](http://dockeri.co/image/maxogden/gifify)

## installation

1. install docker
2. run `docker run -it --rm -v $(pwd):/data maxogden/gifify source.mov -o output.gif`

When you run `docker run maxogden/gifify` it executes the `gifify` command in `/data` inside the docker ubuntu VM, so in order for this to work you must mount your current working directory as `/data` in the volume. This is what `-v $(pwd):/data` does in the command above.

## usage examples

    docker run -it --rm -v "$(pwd)":/data maxogden/gifify source.mov -o output.gif

Fit video in a 350x350 rectangle and don't scale up if it's smaller:

    docker run -it --rm -v "$(pwd)":/data maxogden/gifify source.mov -o output.gif --resize w=350:h=350:force_original_aspect_ratio=decrease

## build

    docker build -t maxogden/gifify .

Use specific gifsicle branch for build:

    docker build --build-arg GIFSICLE_BRANCH="master" -t maxogden/gifify .