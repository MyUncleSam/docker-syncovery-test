# TEST ONLY - DO NOT USE!!!

# Original work by hlince 
https://hub.docker.com/r/hlince/syncovery - I created This repository with updated SyncoveryCL versions to be up2date. Everything else is original work from hlince.

# Changes to original Image
- Moved from Centos to Ubuntu 18.04 as base distributions (about half the size).
- Update to newer versions of SyncoveryCL

# Docker compose

The following sample is running against an unraid host

    version: '3.8'
    services:
       syncovery:
           restart: unless-stopped
           image: stefanruepp/syncoverycl
           volumes:
               - /opt/docker/syncovery/config:/config
               - /opt/docker/syncovery/tmp:/tmp
           ports:
                - 8999:8999

1. Run Command docker-compose up -d
2. Go to http://your-docker-host:8999
3. Use the username default and the password pass

# Docker run

    docker run -d --name=syncovery -v /opt/docker/syncovery/config:/config -v /opt/docker/syncovery/tmp:/tmp -p 8999:8999 stefanruepp/syncoverycl

# Github
repository of this container: https://github.com/MyUncleSam/docker-syncovery

hlince original github repository: https://github.com/Howard3/docker-syncovery
