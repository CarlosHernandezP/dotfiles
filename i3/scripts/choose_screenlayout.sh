#!/bin/bash

layouts_dir=~/dotfiles/i3/scripts/screenlayouts/
choosen_layout=$(ls $layouts_dir | rofi -dmenu)
bash $layouts_dir/$choosen_layout
