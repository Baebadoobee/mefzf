$console = [System.Console];
$width = $console::WindowWidth;
$asciiLogo = @(
  "                 (                           ",                            
  "       (         )\ )    (                   ",                    
  "       )\ )     (()/(  ( )\           (      ",       
  "      (()/(  (   /(_)) )((_)  (      ))\  (  ",   
  "       /(_)) )\ (_))_|((_)_   )\ )  /((_) )\ ",  
  "      (_) _|((_)| |_   | _ ) _(_/( (_))  ((_)", 
  "       |  _||_ /| __|  | _ \| ' \))/ -_)/ _ \", 
  "       |_|  /__||_|    |___/|_||_| \___|\___/",
  ""
);

$asciiLogo | % {
  $console::WriteLine($_); # Prints each line with a padding
}

