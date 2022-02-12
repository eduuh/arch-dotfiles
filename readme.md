## Eduuh's Dotfiles

## Neovim DockerContainer

Neovim as IDE in docker container. The idea is to create comfy programming environment for various languages with usage of Docker.

On the `host machine` there should be the least of dependencies connected with development environment. Only docker should ce required, so developmented envirment can be used `on any computer (work, private, even vps)`. Base image will contain Git and Neovim installation with basic configuration for itself and extensions like `file explorer, git intergration, support for files`.


All images build with this repository will be available on docker hub.


## Images

How to run images? For testing it could be:

```
docker run -it eduuh/nvim:[tag] /bin/bash
```

For working in the container with your code on the host machine. using a `docker-compose.yml` file wher configuration will be more tidy. Programming projects be mounted from host to /root/workspace/ directory.

```yml
version: '3.8'

services:
  nvim:
    image: eduuh/nvim:[tag]
    deploy:
      replicas: 1
      resources:
        limits:
          memory: 2G
    volumes:
      - [path_to_projects]:/root/workspace
```

### Nvim

Base Neovim image. Software installed:

1. **Curl** - For downloading stuff.
2. **fzf** - for fast files search.
3. **ripgrep** - for farst text occurence search.
4. **tree** - files tree visualization.
5. **Git** - Git support inside container.
6. **LazyGit** - Git visualization inside terminal.
7. **xclip** - clipboard handling.
8. **Python3-** - for neovim plugins (defx).
9. **Pip** - for python 3.
10. **NodeJs** - For proper Neovim work.
11. **npm** -  Package manager for NodeJs projects
12. **tzdata** - For default container timezones settings.
13. Everthing needed to install Neovim from Source.
