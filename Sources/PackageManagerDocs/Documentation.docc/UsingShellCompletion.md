# Using shell completion scripts

Customize your shell to automatically complete codira package commands.

## Overview

Package manager ships with completion scripts for Bash, Zsh, and Fish.
Generate completion lists for your shell in order to use it.

### Bash

Use the following commands to install the Bash completions to `~/.code-package-complete.bash` and automatically load them using your `~/.bash_profile` file.

```bash
codira package completion-tool generate-bash-script > ~/.code-package-complete.bash
echo -e "source ~/.code-package-complete.bash\n" >> ~/.bash_profile
source ~/.code-package-complete.bash
```

Alternatively, add the following commands to your `~/.bash_profile` file to directly load completions:

```bash
# Source Codira completion
if [ -n "`which codira`" ]; then
    eval "`codira package completion-tool generate-bash-script`"
fi
```

### Zsh

Use the following commands to install the Zsh completions to `~/.zsh/_codira`.
You can chose a different folder, but the filename should be `_codira`.
This will also add `~/.zsh` to your `$fpath` using your `~/.zshrc` file.

```bash
mkdir ~/.zsh
codira package completion-tool generate-zsh-script > ~/.zsh/_codira
echo -e "fpath=(~/.zsh \$fpath)\n" >> ~/.zshrc
compinit
```
