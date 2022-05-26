#!/bin/bash

function head_install_mpv() {
    sudo add-apt-repository ppa:mc3man/mpv-tests
    sudo apt update
    sudo apt install mpv
}

function head_install_spotify() {
    # 1. Add the Spotify repository signing keys to be able to verify downloaded packages
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410

    # 2. Add the Spotify repository
    echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

    # 3. Update list of available packages
    sudo apt-get update

    # 4. Install Spotify
    sudo apt-get install spotify-client
}

function install_pip() {
    sudo apt-get install python-pip
    sudo apt-get install python3-pip
    sudo pip install setuptools
}

function install_ipython() {
    sudo apt-get install ipython
    sudo apt-get install ipython3
}

# Syntax checker for python
function install_flake8() {
    sudo python -m pip install flake8
    sudo python3 -m pip install flake8
}

function install_pipenv() {
    sudo pip3 install pew
    sudo pip install pipenv
}

function install_silver_searcher() {
    sudo apt-get install silversearcher-ag
}

function install_ctags() {
    sudo apt install exuberant-ctags
}

function install_tree() {
    sudo apt-get install tree
}

# Will need to change when new version arrives
# Isn't working anymore?
function install_python36() {
    sudo add-apt-repository ppa:jonathonf/python-3.6
    sudo apt update
    sudo apt install python3.6
    sudo apt install python3.6-dev
    wget https://bootstrap.pypa.io/get-pip.py
    sudo python3.6 get-pip.py
    rm get-pip.py
}

function install_openssh_server() {
    sudo apt-get install openssh-server
}

function install_latex_compiler() {
    sudo apt-get install texlive-latex-base
    sudo apt-get install lacheck
    sudo apt-get install latex-beamer
    sudo apt-get install texlive-full # This package is +3GB big. Use apt-get install texlive for lightweight version
}

function install_zathura() {
    sudo apt-get install zathura
}

function install_vim() {
    sudo apt-get install vim
    install_vundle
    install_you_complete_me
    install_ctags
}

# Remember that it is necessary to change .vimrc
function install_vundle() {
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

# The --all flag will probably fail due to dependencies. Fix as appropiate
function install_you_complete_me() {
    sudo apt-get install build-essential cmake
    sudo apt-get install python-dev python3-dev
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --all
    cd -
}

function install_fzf() {
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
}

function install_xclip() {
    sudo apt-get install xclip -y
}

function install_unzip() {
    sudo apt-get install unzip -y
}

function install_mosh() {
    sudo apt-get install mosh -y
}

# Installs both JDK and JRE
function install_java10() {
    echo oracle-java10-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
    sudo add-apt-repository ppa:linuxuprising/java
    sudo apt update
    sudo apt install oracle-java10-installer
    oracle-java10-set-default package
}

function head_install_telegram() {
    sudo add-apt-repository ppa:atareao/telegram
    sudo apt-get update
    sudo apt-get install telegram
}

function install_mono() {
    sudo apt-get install mono-complete
}

function install_nuget() {
    sudo apt install nuget
}

function install_skype() {
    sudo apt install apt-transport-https
    curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
    echo "deb https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skypeforlinux.list
    sudo apt update
    sudo apt install skypeforlinux
}

# Used mainly for vim airline fonts.
function install_powerline() {
    apt-get install python-pip
    sudo pip install git+git://github.com/Lokaltog/powerline
    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
    sudo mv PowerlineSymbols.otf /usr/share/fonts/
    # fc-cache builds font information. -v for verbose, -f for forcing even up to date cached builds.
    sudo fc-cache -vf /usr/share/fonts/
    sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
}

function install_docker() {
    # Taken from official page: https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository
    sudo apt install docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
}

function install_base_16(){
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
}

function install_tmux() {
    sudo apt-get install tmux
    # Install Tmux plugin manager. TPM
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

function install_git() {
	sudo apt-get install git
    # Sets a global gitignore
    git config --global core.excludesfile '~/.gitignore'
}

function copy_latest_configs() {
    git clone https://github.com/Danielhp95/configs.git
    cd configs/
    python setup.py
    cd ..
    rm -rf configs/
}


function install_flux() {
    sudo add-apt-repository ppa:nathan-renniewaldock/flux
    sudo apt-get update
    sudo apt-get install fluxgui
}

function install_pandoc() {
    sudo apt-get install pandoc
    sudo apt-get install pandoc-citeproc
}

function install_all() {
    install_git

    # Programming language tools
    install_pipenv
    install_pip	

    # Programming languages
    install_java10
    install_ipython
    install_latex_compiler
    install_mono # c# linux compiler
    install_nuget # c# kinda pip
    install_flake8 # python syntax checker
    # install_python36  Ubuntu 18 comes with this

    # Media programs
    head_install_telegram
    head_install_mpv
    head_install_spotify


    # Shell tools
    install_openssh_server
    install_mosh
    install_fzf
    install_xclip
    install_silver_searcher
    install_unzip
    install_base_16
    install_tmux
    install_powerline
    install_tree

    # Health
    install_flux

    # All hail
    install_vim
    install_zathura
    install_docker

    # Livestyle utilities
    install_pandoc

    # Config files
    copy_latest_configs

    # Untrusted key on repo. Won't work unless fixed
    # install_skype
}

install_all
