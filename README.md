# Docker node.js Development Environment for the TMUX + (neo)VIM user in you

This docker image will start a tmux session and have everything ready to begin to code directly inside the image.
I created it so I could quickly begin to code on whatever ssh session i'm in, as long as it has docker.

The image is based on Ubuntu 16.04 and has tmux and vim with a coupe of plugins:

- [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)
- [mattn/emmet-vim](https://github.com/mattn/emmet-vim)
- [wavded/vim-stylus](https://github.com/wavded/vim-stylus)
- [pangloss/vim-javascript](https://github.com/pangloss/vim-javascript)
- [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
- [ternjs/tern_for_vim](https://github.com/ternjs/tern_for_vim)
- [scrooloose/syntastic](https://github.com/scrooloose/syntastic)
- [ervandew/supertab](https://github.com/ervandew/supertab)
- [xolox/vim-misc](https://github.com/xolox/vim-misc)
- [rking/ag.vim](https://github.com/rking/ag.vim)
- [wesQ3/vim-windowswap](https://github.com/wesQ3/vim-windowswap)
- [Lokaltog/vim-easymotion](https://github.com/Lokaltog/vim-easymotion)
- [kshenoy/vim-signature](https://github.com/kshenoy/vim-signature)
- [vim-scripts/TaskList.vim](https://github.com/vim-scripts/TaskList.vim)
- [digitaltoad/vim-jade](https://github.com/digitaltoad/vim-jade)
- [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
- [jistr/vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
- [Shutnik/jshint2.vim](https://github.com/Shutnik/jshint2.vim)
- [mxw/vim-jsx](https://github.com/mxw/vim-jsx)
- [paradigm/vim-multicursor](https://github.com/paradigm/vim-multicursor)
- [mxw/vim-xhp](https://github.com/mxw/vim-xhp)
- [sjl/gundo.vim](https://github.com/sjl/gundo.vim)
- [vim-scripts/loremipsum](https://github.com/vim-scripts/loremipsum)
- [XadillaX/json-formatter.vim](https://github.com/XadillaX/json-formatter.vim)
- [terryma/vim-expand-region](https://github.com/terryma/vim-expand-region)
- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
- [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
- [marchelzo/ircnvim](https://github.com/marchelzo/ircnvim)
- [vim-scripts/VimIRC.vim](https://github.com/vim-scripts/VimIRC.vim)
- [elzr/vim-json](https://github.com/elzr/vim-json)
- [tpope/vim-jdaddy](https://github.com/tpope/vim-jdaddy)
- [jaxbot/semantic-highlight.vim](https://github.com/jaxbot/semantic-highlight.vim)
- [altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)

As you might have guess, its prepared for javascript and node develpoment.

## RUN

Just type:

```
docker run -it --rm -v $PWD/src:/app/src camme/node-dev-environment
```

(in this example it will map ./src on your computer to /app/src inside the docker container).

