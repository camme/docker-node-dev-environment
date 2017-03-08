# Docker node.js Development Environment for the TMUX + (neo)VIM user in you

This docker image will start a tmux session and have everything ready to begin to code directly inside the image.
I created it so I could quickly begin to code on whatever ssh session i'm in, as long as it has docker.

The image is based on Ubuntu 16.04 and has tmux and vim with a coupe of plugins:

- [https://github.com/gmarik/Vundle.vim](gmarik/Vundle.vim)
- [https://github.com/kien/ctrlp.vim](kien/ctrlp.vim)
- [https://github.com/mattn/emmet-vim](mattn/emmet-vim)
- [https://github.com/wavded/vim-stylus](wavded/vim-stylus)
- [https://github.com/pangloss/vim-javascript](pangloss/vim-javascript)
- [https://github.com/Valloric/YouCompleteMe](Valloric/YouCompleteMe)
- [https://github.com/ternjs/tern_for_vim](ternjs/tern_for_vim)
- [https://github.com/scrooloose/syntastic](scrooloose/syntastic)
- [https://github.com/ervandew/supertab](ervandew/supertab)
- [https://github.com/xolox/vim-misc](xolox/vim-misc)
- [https://github.com/rking/ag.vim](rking/ag.vim)
- [https://github.com/wesQ3/vim-windowswap](wesQ3/vim-windowswap)
- [https://github.com/Lokaltog/vim-easymotion](Lokaltog/vim-easymotion)
- [https://github.com/kshenoy/vim-signature](kshenoy/vim-signature)
- [https://github.com/vim-scripts/TaskList.vim](vim-scripts/TaskList.vim)
- [https://github.com/digitaltoad/vim-jade](digitaltoad/vim-jade)
- [https://github.com/scrooloose/nerdtree](scrooloose/nerdtree)
- [https://github.com/jistr/vim-nerdtree-tabs](jistr/vim-nerdtree-tabs)
- [https://github.com/Shutnik/jshint2.vim](Shutnik/jshint2.vim)
- [https://github.com/mxw/vim-jsx](mxw/vim-jsx)
- [https://github.com/paradigm/vim-multicursor](paradigm/vim-multicursor)
- [https://github.com/mxw/vim-xhp](mxw/vim-xhp)
- [https://github.com/sjl/gundo.vim](sjl/gundo.vim)
- [https://github.com/vim-scripts/loremipsum](vim-scripts/loremipsum)
- [https://github.com/XadillaX/json-formatter.vim](XadillaX/json-formatter.vim)
- [https://github.com/terryma/vim-expand-region](terryma/vim-expand-region)
- [https://github.com/vim-airline/vim-airline](vim-airline/vim-airline)
- [https://github.com/terryma/vim-multiple-cursors](terryma/vim-multiple-cursors)
- [https://github.com/marchelzo/ircnvim](marchelzo/ircnvim)
- [https://github.com/vim-scripts/VimIRC.vim](vim-scripts/VimIRC.vim)
- [https://github.com/elzr/vim-json](elzr/vim-json)
- [https://github.com/tpope/vim-jdaddy](tpope/vim-jdaddy)
- [https://github.com/jaxbot/semantic-highlight.vim](jaxbot/semantic-highlight.vim)
- [https://github.com/altercation/vim-colors-solarized](altercation/vim-colors-solarized)

As you might have guess, its prepared for javascript and node develpoment.

## RUN

Just type:

```
docker run -it --rm -v $PWD/src:/app/src camme/node-dev-environment
```

(in this example it will map ./src on your computer to /app/src inside the docker container).

