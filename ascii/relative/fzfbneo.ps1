$console = [System.Console];
$width = $console::WindowWidth;
$asciiLogo = @(
  "           (                           ",                            
  " (         )\ )    (                   ",                    
  " )\ )     (()/(  ( )\           (      ",       
  "(()/(  (   /(_)) )((_)  (      ))\  (  ",   
  " /(_)) )\ (_))_|((_)_   )\ )  /((_) )\ ",  
  "(_) _|((_)| |_   | _ ) _(_/( (_))  ((_)", 
  " |  _||_ /| __|  | _ \| ' \))/ -_)/ _ \", 
  " |_|  /__||_|    |___/|_||_| \___|\___/",
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

