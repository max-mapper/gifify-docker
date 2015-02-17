# gifify-docker

A docker container for [gifify](https://github.com/vvo/gifify)

![docker-badge](http://dockeri.co/image/maxogden/gifify)

## installation

1. install docker
2. run `docker run -it --rm -v $(pwd):/data maxogden/gifify source.mov -o output.gif`

When you run `docker run maxogden/gifify` it executes the `gifify` command in `/data` inside the docker ubuntu VM, so in order for this to work you must mount your current working directory as `/data` in the volume. This is what `-v $(pwd):/data` does in the command above.
