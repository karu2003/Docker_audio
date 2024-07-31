# Docker template for working with tensorflow and keras audio.

### Build Docker

    docker build . -t docker_audio
    docker run --rm -it -v `pwd`:/app signal_ai:latest bash
