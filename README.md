# A docker container for nodejs apps

This is simply a Dockerfile for building a simple docker container that runs
nodejs apps.

> Current Node.js version: 0.10.28

The container does not contain anything else.

## Usage

By default, everything runs under an unprivileged user called default, with the
working directory set to /home/default. This user has passwordless sudo access.

If you just want a bash prompt:

    docker run -t -i d11wtq/nodejs /bin/bash

If you want to work in the REPL temporarily:

    docker run -t -i d11wtq/nodejs node

If you want to load and run an app with npm:

    docker run -d \
      -v ~/projects/foo:/apps/foo \
      -w /apps/foo \
      -p 3000:3000 \
      d11wtq/nodejs \
      npm start

The above command mounts your copy of ~/projects/foo to /apps/foo in the
container, then sets the working directory to /apps/foo and performs
`npm start` to start the app running. It also exposes the container's port 3000
to the host as port 3000.
