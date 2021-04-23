# .zsh_config

#### Themes

<a href="https://github.com/ohmyzsh/ohmyzsh/wiki/Themes">https://github.com/ohmyzsh/ohmyzsh/wiki/Themes</a>

---

### Powerlevel10k Theme

#### Configure

<a href="https://github.com/romkatv/powerlevel10k#oh-my-zsh">https://github.com/romkatv/powerlevel10k#oh-my-zsh</a>

---

### Link Configs

Run the following and then restart your shell.

```
$ cd ~
$ mv .zprofile .zprofile.bak #mv ${CONFIG_YAML}{,.disabled}
$ mv .zshrc .zshrc.bak #mv ${CONFIG_YAML}{,.disabled}
$ ln -s ~/.zsh_configs/src/.zprofile .zprofile
$ ln -s ~/.zsh_configs/src/.zshrc .zshrc
$ source ~/.zprofile
```

---

### Resources

<a href="https://github.com/ohmyzsh/ohmyzsh/wiki/Code-Style-Guide">OhMyZSH Style Guide</a>
<a href="https://google.github.io/styleguide/shellguide.html">Shell Style Guide</a>
