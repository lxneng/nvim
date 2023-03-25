# docker build -t nvim .
# alias nvim='docker run --rm -it -v $(pwd):/src nvim'
FROM alpine:edge

RUN apk add --no-cache \
    build-base \
    neovim \
    git \
    npm \
    py3-pip \
    curl \
    && rm -rf /var/cache/apk/*

ENV NEOVIM_USER nvim
ENV NEOVIM_UID 1000
ENV HOME /home/$NEOVIM_USER
ENV TERM screen-256color

RUN npm i -g pyright
RUN pip install black isort
RUN adduser -h $HOME -s /sbin/nologin -u $NEOVIM_UID -D ${NEOVIM_USER} && \
    mkdir -p /src && \
    chown $NEOVIM_USER /src

USER $NEOVIM_USER

RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY ./init.vim $HOME/.config/nvim/init.vim
RUN nvim +PlugInstall +qa
RUN nvim +"TSInstallSync python" +qall

WORKDIR /src

ENTRYPOINT ["nvim"]
