#!/bin/bash

# For installing everything needed for razer keyboard
# Follow these instructions:
# https://github.com/openrazer/openrazer/wiki/Troubleshooting
# Installing kernel modules (check the dkms) section to know what linux kernel headers we need
# Openrazer-daemon: run "sudo gpasswd -a $USER plugdev" to add our user to plugdev grou.

function install_yay() {
    pacman -S yay
}

function install_bluetooth_related_packages() {
    yay -S bluez
    yay -S bluez-utils
}

function install_pulseaudio() {
    yay -S pulseaudio
    yay -S pulseaudio-bluetooth
    yay -S pavucontrol
}

function install_redshift() {
    yay -S redshift
}

function install_xclip() {
    yay -S xclip
}

function install_pandoc() {
    yay -S pandoc
}

function install_firefox() {
    yay -S firefox
}

function install_tmux() {
    # python-powerline-git is used for putting a fancy tmux prompt
    yay -S python-powerline-git
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    yay -S tmux
}

function install_ripgrep() {
    yay -S ripgrep
}

function install_fd() {
    yay -S fd
}

function install_oh_my_zsh() {
    # Install zsh
    yay -S zsh
    # Installs oh_my_zsh
    curl -L http://install.ohmyz.sh | sh
    # Makes zsh default terminal
    chsh -s $(which zsh)
}

function install_oh_my_zsh_plugins() {
    # Zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    # fzf-tab
    git clone https://github.com/Aloxaf/fzf-tab ~ZSH_CUSTOM/plugins/fzf-tab
}

function install_telegram() {
    yay -S telegram-desktop-bin
}

function install_spotify() {
    yay -S spotify
}

# Linux utility to configure modifier keys to act as other keys when pressed and released on their own.
function install_xcape() {
    yay -s xcape-git
}

function install_bat() {
    yay -S bat
}

# Nicer `ls`
function install_exa() {
    yay -S exa
}

function install_i3status_rust() {
    yay -S i3status-rust-git
}

function install_dunst() {
    yay -S dunst
}

function install_rofi() {
    yay -S rofi
    yay -S rofi-dmenu
    yay -S rofi-file-browser-extended-git
}

function install_mpv() {
    yay -S mpv
    yay -S youtube-dl
}

# Power (battery) management
function install_tlp() {
    yay -S tlp
    systemctl start tlp.service
    systemctl enable tlp.service
}

function install_zathura() {
    yay -S zathura
    yay -S zathura-pdf-mupdf
}

function install_pip() {
   yay -S python-pipenv
}

function install_ipython() {
   yay -S ipython
}

# Big package. 1.5GB
function install_latex() {
   yay -S texlive-most
}

# Syntax checker for python
function install_flake8() {
   sudo pip install flake8
}

function install_kitty_terminal() {
   yay -S kitty
}

function install_fzf() {
   yay -S fzf-git
}

function install_silver_searcher() {
   yay -S the_silver_searcher
}

function install_universal_ctags() {
   yay -S universal-ctags-git
}

function install_cmake() {
   yay -S cmake
}

function install_gotop_and_bashtop() {
    # System monitoring tool
    yay -S gotop
    yay -S bashtop
}

function install_neovim() {
    yay -S neovim-git
    # Required for coc.nvim
    yay -S npm
    yay -S nodejs
}

function install_base16_shell() {
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
    sudo pip install base16-shell-preview
}

function install_i3_alternating_layouts() {
    # NOT WORKING
    sudo pip install i3-py
    git clone https://github.com/olemartinorg/i3-alternating-layout ~/.config/i3/scripts/
}


function install_coc_vim_python() {
    pip install python-language-server
    pip install 'python-language-server[rope]'
}

#########
# Fonts #
#########
function install_fira_code_font() {
    yay -S otf-fira-code
}

function install_font_awesome() {
    yay -S ttf-font-awesome-4
}

#####################
# Images / Pictures #
#####################
function install_feh() {
    yay -S feh
}

function install_maim() {
    yay -S maim
}

function install_compton_tryone() {
    yay -S compton-tryone-git
}

function install_omnipause() {
    yay -S python2-dbus
    git clone https://github.com/mel00010/OmniPause
    cd OmniPause/
    sudo make install
    cd ..
    rm -rf OmniPause/
}

function install_entr() {
    yay -S entr
}

function install_jekyll() {
    yay -S rubygems
    gem update
    gem install jekyll
    gem install bundler
    bundle update --bundler
    # remember that it is needed to extend $PATH
    # PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
}

function install_all() {
    install_yay
    install_oh_my_zsh
    install_oh_my_zsh_plugins
    install_rofi
    install_tmux
    install_i3status_rust
    install_bluetooth_related_packages

    # Fonts
    install_fira_code_font
    install_font_awesome

    # Aesthetics
    install_compton_tryone
    install_base16_shell

    # Sound
    install_pulseaudio

    # Small utilities
    install_fzf
    install_ripgrep
    install_fd
    install_bat
    install_exa
    install_feh
    install_xcape
    install_xclip
    install_silver_searcher
    install_cmake
    install_universal_ctags
    install_maim
    install_omnipause
    install_entr
    install_gotop_and_bashtop
    install_dunst

    # VIM
    install_neovim

    # Programming languages
    install_pip
    install_ipython
    install_flake8

    install_latex

    # Personal usage
    install_redshift
    install_firefox
    install_telegram
    install_spotify
    install_mpv
    install_tlp
    install_zathura
    install_kitty_terminal
    install_jekyll
    install_pandoc
}

install_all
