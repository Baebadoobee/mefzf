#!/usr/bin/env pwsh
$ErrorActionPreference = 'ignore'
#------------------

# Path to rom folder
$romPath = "$HOME/Documentos/mefzf/roms"; 

# Wrapper
$pwshNop = "pwsh -NoLogo -NoProfile";

# Ascii profile [relative or absolute]
$asciiProfile = 'absolute'

# Parser that extracts the rom names from the snk rom namelist
$parse = "$pwshNop -c ' 
  ((
    Get-Content `"$HOME/.local/share/fbneo/romChecked.txt`" | 
    grep -w {} --line-buffer
  ) -split `"\s+`",3)[2]
'" 

# Fzf theming
$fzfColor = @( 
  "--reverse",
  "--border=bold",
  "--border=rounded",
  "--color=fg:#D7D4E3,fg+:#D7D4E3,bg:#323243,bg+:#323243",
  "--color=hl:#5B6DA5,hl+:#9595D7,info:#5E547E,marker:#9595D7",
  "--color=prompt:#5B6DA5,spinner:#af5fff,pointer:#af5fff,header:#5E547E",
  "--color=border:#5E547E,label:#5E547E,query:#d9d9d9"
)

# Regions
$regions = @( # You may select your prefered region. Default USA.
  "(E)",
  "(J)",
  "(JU)",
  "(U)",
  "(UE)",
  "(W)"
)

do {
  $asciiLogoRef = "./mefzf.ps1";
  $emuSystem = ((Get-ChildItem $romPath).BaseName | # Searchs for systems in the rom folder and passes to a fzf
  fzf @fzfColor --preview "$pwshNop -c 'pushd; cd $PSScriptRoot/ascii/$asciiProfile; & `"$asciiLogoRef`"; popd'");

  switch ($emuSystem) {
    "SNK NeoGeo" {  
      $asciiLogoRef = "./fzfbneo.ps1";

      $rom = (Get-ChildItem "$romPath/SNK NeoGeo" -file).BaseName | # Generates a list of roms for that system
      fzf @fzfColor --preview "$pwshNop -c 'pushd; cd $PSScriptRoot/ascii/$asciiProfile; & `"$asciiLogoRef`"; popd'; $parse; ddgr --noua {}";

      if ($rom) { # Prevents the emu to start a second time when leaving the system folder
        $null = fbneo $rom;
        clear-host;
      }
      else {break :do}

    }
    "Nintendo Entertainment System" {    
      $ext = ".nes";
      $region = $regions[3]; # Region declared
      $asciiLogoRef = "./fzfnes.ps1";

      $rom = (Get-ChildItem "$romPath/Nintendo Entertainment System" -filter "*$region*" -file).BaseName | # Generates a list of roms for that system and filter it by region
      fzf @fzfColor --preview "$pwshNop -c 'pushd; cd $PSScriptRoot/ascii/$asciiProfile; & `"$asciiLogoRef`"; popd'; echo {}; ddgr --noua {}";

      $romName = "$romPath/Nintendo Entertainment System/" + "$rom" + "$ext"; # It gets the rom full name
      if ($rom) {
        $null = nestopia "$($romName)" &;
        clear-host;
      }
      else {break :do}
    }
    "Super Nintendo Entertainment System" {
      $ext = ".zip"
      $asciiLogoRef = "./fzfsnes9x.ps1";

      $rom = (Get-ChildItem "$romPath/Super Nintendo Entertainment System" -file).BaseName |
      fzf @fzfColor --preview "$pwshNop -c 'pushd; cd $PSScriptRoot/ascii/$asciiProfile; & `"$asciiLogoRef`"; popd'; echo {}; ddgr --noua {}";

      $romName = "$rom" + "$ext";
      if ($rom) {
        $null = snes9x -soundsync -playbackrate 48 -fullscreen -xvideo "$($romName)";
        clear-host;
      }
      else {break :do}
    }

    "PlayStation" {}
    Default {write-output "No system selected"}
  }

#------------------
} while ($true)
#------------------
