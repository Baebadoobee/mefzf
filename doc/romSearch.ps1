#!/usr/bin/env pwsh
$ErrorActionPreference = 'Stop'

(gci "$HOME/Roms" -recurse -file).BaseName | % {cat "$HOME/.local/share/fbneo/mameIDs 0.276.txt" | grep -w $_ --line-buffered} | Out-File $HOME/.local/share/fbneo/romChecked.txt
