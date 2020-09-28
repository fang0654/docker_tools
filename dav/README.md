# dav

This docker image starts up a webdav server in the current folder, and spins up ngrok to make it available on the internet. It does all of this in tmux, with a third window spawned ready to tear it all down. Just press enter to kill it all.

# Build

```
cd dav
docker build -t dav .
```


# Alias

I use the following to run this:

```
alias dav='docker run -v `pwd`:/root/shared -it --rm dav'
```