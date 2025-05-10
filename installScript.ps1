#!/usr/bin/env pwsh
#------------------
$ErrorActionPreference = 'Stop';
$pacmanArgs = @(
  "--noconfirm",
  "--color=always",
  "-S"
)
$aurAssist = @(
  "yay",
  "paru"
)

sudo pacman @pacmanArgs snes9x nestopia;
$($aurAssist[0]) @pacmanArgs fbneo-git; # 0 = yay; 1 = paru.
#------------------
# Config install
#------------------
$confList (Get-ChildItem "$($PSScriptRoot)/conf/") | % {
  switch (($_).Name) {
    "fbneo" {
      $fileList = (Get-ChildItem "$(($_).FullName)/") | % {
        switch ($file = ($_).Name) {
          {$file -icontains "fbneo"} {
            New-Item -Path "$HOME/.local/share/fbneo/config/$(($file).Name)" -Value "$(($_).FullName)" -ItemType "SymbolicLink" -Force
          }
          {$file -icontains "mame"} {
            New-Item -Path "$HOME/.local/share/fbneo/$(($file).Name)" -Value "$(($_).FullName)" -ItemType "SymbolicLink" -Force
          }
        }
      }
    }

    "nestopia" {
      $fileList = (Get-ChildItem "$(($_).FullName)/") | % {
        switch ($file = ($_).Name) {
          {$file -icontains "nestopia"} {
            New-Item -Path "$HOME/.config/nestopia/$(($file).Name)" -Value "$(($_).FullName)" -ItemType "SymbolicLink" -Force
          }
          {$file -icontains "input"} {
            New-Item -Path "$HOME/.config/nestopia/$(($file).Name)" -Value "$(($_).FullName)" -ItemType "SymbolicLink" -Force
          }
        }
      }
    }

    "snes9x" {
      $fileList = (Get-ChildItem "$(($_).FullName)/") | % {
        New-Item -Path "$HOME/.snes9x/$(($file).Name)" -Value "$(($_).FullName)" -ItemType "SymbolicLink" -Force
        New-Item -Path "$HOME/.snes9x/rom" -Value "$($PSScriptRoot)/roms/Super Nintendo Entertainment System/" -ItemType "SymbolicLink" -Force
      }
    }
  }
}
