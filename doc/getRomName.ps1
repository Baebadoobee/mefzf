#!/bin/env pwsh
$ErrorActionPreference = 'Stop';

#$romList = "$HOME/.local/share/fbneo/romlist/DOCs/mameIDs 0.276.txt"; $romBaseName = (Get-ChildItem "$HOME/Roms" -recurse -file).BaseName; $listAdress = (@(get-content $romList) | Select-String -Pattern "^\s*(\d+)\s+($romBaseName)\s+(.*)"); $parse = $listAdress -split "\s+", 3; $romName = $parse[2];

$fzfbneo = alacritty --class fzfbneo  -T FBNeo -e pwsh -NoLogo -NoProfile -c '((gci "$HOME/Roms/" -recurse -file).BaseName | fzf --preview "bat $HOME/mameIDs\ 0.276.txt | grep \" kof2002 \" --line-buffered " --reverse --border=bold --border=rounded --color=dark); fbneo $rom'
