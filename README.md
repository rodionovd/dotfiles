# My dotfiles

### Step 1

Grant Terminal.app full disk access via System Settings > Privacy > Full Disk Access. This is vital for [`macos.sh`](./macos.sh) as some apps (e.g. Safari) have a protected sandbox container.

> Don't forget to revoke it afterwards. Maybe.

### Step 2

```sh
mkdir -p ~/.dotfiles && cd $_
curl -fsSL https://github.com/rodionovd/dotfiles/archive/refs/heads/master.zip \
    | bsdtar --strip-components=1 -xf -
sh ./install.sh
```

### What's included

- set some vital macOS defaults
- install some software
- configure the terminal and shell
- configure code editors: VSCode, Xcode and vim (lol)
- may also do something else