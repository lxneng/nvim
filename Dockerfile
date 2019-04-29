# docker build -t nvim .
# docker run --rm -it -v $(pwd):/src nvim
# alias nvim='docker run --rm -it -v $(pwd):/src nvim'
FROM ubuntu:18.04

ENV TERM screen-256color
ENV DEBIAN_FRONTEND noninteractive

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
      # For Youcompleteme
      cmake

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install Neovim
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update && apt-get install -y \
      neovim

RUN pip3 install -U neovim

COPY . /root/.config/nvim
RUN nvim +PlugInstall +qa
RUN /root/.config/nvim/plugged/YouCompleteMe/install.py

WORKDIR /src

ENTRYPOINT ["/usr/bin/nvim"]
