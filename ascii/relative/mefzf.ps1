$width = [System.Console]::WindowWidth; # Checks window width
$console = [System.Console];
$asciiLogo = @(
  " @@@@@@@@@@   @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@",
  " @@@@@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@",
  " @@! @@! @@!  @@!       @@!            @@!  @@!     ",
  " !@! !@! !@!  !@!       !@!           !@!   !@!     ",
  " @!! !!@ @!@  @!!!:!    @!!!:!       @!!    @!!!:!  ",
  " !@!   ! !@!  !!!!!:    !!!!!:      !!!     !!!!!:  ",
  " !!:     !!:  !!:       !!:        !!:      !!:     ",
  " :!:     :!:  :!:       :!:       :!:       :!:     ",
  " :::     ::    :: ::::   ::        :: ::::   ::     ",
  "  :      :    : :: ::    :        : :: : :   :      ",
  ""
);

$asciiLogo | % {
  if (($_).Length -le $width) {
    $padding = " " * (($width - ($_).Length)/2); # Calculates a padding
  } else {
    $padding = " " * 13;
  }

  $console::WriteLine($padding + $_); # Prints each line with a padding
}
