RUN

` curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
`
ALSO need pip3 (`brew install python3`)

`
pip3 install --user neovim
`


finally run

```

nvim
:PlugInstall
:UpdateRemotePlugins
```
