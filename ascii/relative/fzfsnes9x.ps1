$console = [System.Console];
$width = $console::WindowWidth;
$asciiLogo = @(
  "                ___          ___                  ",
  "              .' ..]       .' ..]                 ",
  "             _| |_  ____  _| |_                   ",
  "            '-| |-'[_   ]'-| |-'                  ",
  "   ______     | |   .' /_  | |    ______          ",
  " .' ____ \   [___] [_____][___] .' ____ '.        ",
  " | (___ \_| _ .--.  .---.  .--. | (____) | _   __ ",
  "  _.____`. [ `.-. |/ /__\\( (`\]'_.____. |[ \ [  ]",
  " | \____) | | | | || \__., `'.'.| \____| | > '  < ",
  " \______.'[___||__]'.__.'[\__) )\______,'[__]`\_]", 
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

