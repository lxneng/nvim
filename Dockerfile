# docker build -t nvim .
# alias nvim='docker run --rm -it -v $(pwd):/src nvim'
FROM ubuntu:18.04

# Update and install
RUN apt-get update && apt-get install -y \
      curl \
      wget \
      git \
      software-properties-common \
      python-dev \
      python3-dev \
      python3-pip \
      ctags \
      locales \

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install Neovim
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update && apt-get install -y \
      neovim

RUN pip3 install -U neovim

ENV NEOVIM_USER nvim
ENV NEOVIM_UID 1000
ENV HOME /home/$NEOVIM_USER

RUN useradd -m -s /bin/bash -u $NEOVIM_UID $NEOVIM_USER && \
    mkdir -p /src && \
    chown $NEOVIM_USER /src && \
    mkdir -p $HOME/.config/nvim && \
    chown $NEOVIM_USER $HOME/.config/nvim

USER $NEOVIM_USER

ENV TERM screen-256color
ENV DEBIAN_FRONTEND noninteractive

COPY . $HOME/.config/nvim
RUN nvim +PlugInstall +qa

WORKDIR /src

ENTRYPOINT ["/usr/bin/nvim"]
