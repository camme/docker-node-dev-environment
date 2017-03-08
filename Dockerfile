FROM ubuntu:16.04
#node:7.6.0

#ARG VERSION=0-DEV
#ENV VERSION=${VERSION}
RUN export TERM=dumb
RUN apt-get update


RUN apt-get install software-properties-common python-software-properties curl cmake -y
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get update 

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install nodejs -y

RUN apt-get install -y git build-essential
RUN apt-get install -y neovim tmux
RUN apt-get install -y curl
RUN apt-get install -y python-dev python-pip python3-dev python3-pip 


WORKDIR /root
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN git    clone https://github.com/camme/.configs.git

RUN sed -i "s/set-option -g default-command \"reattach-to-user-namespace -l zsh\"/  /g" .configs/.tmux.conf

RUN mkdir -p ~/.config/nvim/
RUN ln -s /root/.configs/.nvimrc /root/.config/nvim/init.vim
RUN ln -s .configs/.tmux.conf

ENV TERM=screen-256color
RUN pip3 install --upgrade neovim
RUN script -c "nvim +PlugInstall +qall"

RUN mkdir -p ~/.vim/backup

RUN mkdir -p /app/src

WORKDIR /app/src

RUN ln -s /usr/bin/nvim /usr/bin/vim

RUN npm i tern -g

RUN (cd ~/.vim/plugged/YouCompleteMe/ &&  ./install.py --tern-completer)

#RUN npm i gulp -g
#RUN npm i webpack -g
RUN npm init -y

CMD ["tmux"]
