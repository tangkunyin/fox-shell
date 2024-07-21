## What's tombro-shell

> tombro == thomas brother? perhaps it can be interpreted like this! 🤣

**tombro-shell** is an out of box shell-script collection for both macOS and Linux development, those scripts that I find useful and important in development, will be shared with all of you from time to time.

⚠️ Note: These scripts were written in many different ways and languages, also doesn't necessarily apply to everyone, if you mind this, don't use them!

## How to use

1.Clone and put them in your home directory like this:

```
cd ~

git clone https://github.com/tangkunyin/tombro-shell.git
```

2.Config env-variables path under your system

```bash
vim ~/.bash_profile

# paste this to your profile 
PATH=$PATH:~/tombro-shell/bin

export PATH
```

3.Make it effect

```
source ~/.bash_profile
```

4.Try a git test

```
gitc.sh
```

## For development

> List some of the relatively useful

- `pmt_global.sh`: for fe-developer all in one intallation
- `drc.sh`: for docker use


## For development tools

### homebrew

Backup your brew installed packages in a standalone file, when you move to another dev-env, you can recover it directly and fast

```
brew bundle dump
brew bundle --file="./Brewfile"
```

### vscode

Clear unused vscode plugins which were waste the storage in your computer.

// TODO...


