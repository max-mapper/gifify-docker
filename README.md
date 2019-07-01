# gifify-docker

A docker container for [gifify](https://github.com/vvo/gifify). Based on the work of [maxogden](https://github.com/maxogden/gifify-docker) and [STRML](https://github.com/STRML/gifify-docker).

![docker-badge](http://dockeri.co/image/dersimn/gifify)

## installation

1. install docker
2. run `docker run -it --rm -v $(pwd):/data dersimn/gifify source.mov -o output.gif`

When you run `docker run dersimn/gifify` it executes the `gifify` command in `/data` inside the docker ubuntu VM, so in order for this to work you must mount your current working directory as `/data` in the volume. This is what `-v $(pwd):/data` does in the command above.

## usage examples

    docker run -it --rm -v "$(pwd)":/data dersimn/gifify source.mov -o output.gif

Fit video in a 350x350 rectangle and don't scale up if it's smaller:

    docker run -it --rm -v "$(pwd)":/data dersimn/gifify source.mov -o output.gif --resize w=350:h=350:force_original_aspect_ratio=decrease

## build

    docker build -t dersimn/gifify .

Use specific gifsicle branch for build:

    docker build --build-arg GIFSICLE_BRANCH="master" -t dersimn/gifify .