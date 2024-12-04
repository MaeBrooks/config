# Config Files For Mae!

# Requirements

- guix

## Debian based
```sh
sudo apt-get install -y guix && \
guix pull && guix package -u && \
. $HOME/.guix-profile/etc/profile
```

# Setup


## Step 1 - Updating Your .profile

This line is needed to source the guix profile on startup
```sh
. $HOME/.guix-profile/etc/profile
```

If you also want to remap `caps lock` to `ctrl` as well, consider also adding:

```sh
setxkbmap -option ctrl:nocaps
```

## Step 2 - Install guix packages

Ensure the guix profile is in your path
```sh
. $HOME/.guix-profile/etc/profile
```

And for every package in: `.guix-packages` run:
```sh
guix package -i $(cat .guix-packages | tr '\n' ' ')
```

This should take a moment

## Step 4 - All Done!
