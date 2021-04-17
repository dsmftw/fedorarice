#!/bin/bash

src="$HOME"/dotfiles
dst="$HOME"
declare -a files=(
"bashrc" "gitconfig" "tmux.conf" "vimrc"
"newsboat/config"
)

/usr/bin/mkdir -pv "$dst"/.config/{autostart,conky,mpd,mpv,ncmpcpp,ranger,zathura}
/usr/bin/mkdir -pv "$dst"/.newsboat

/usr/bin/printf "\nCreating symlinks...\n"
for file in "${files[@]}"; do
    /usr/bin/printf '  %s/.%-25.25s --> dotfiles/%s\n' "$dst" "$file" "$file"
    /usr/bin/ln -S.bak -s "$src"/"$file" "$dst"/."$file"
done

/usr/bin/printf "\n***** Done! *****\n\n"
