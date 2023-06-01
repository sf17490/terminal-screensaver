#! /bin/bash
tput clear
bold=$(tput bold)
normal=$(tput sgr0)
yellow='\e[0;33m'
myPipe="${bold}${yellow}━"
myDownPipe="${bold}${yellow}┃"

printLogo() {

  lineA="___  __  __"
  lineB="/ _ \/ / / /"
  lineC="/  __/ /_/ /"
  lineD="\___/\__, /"
  lineE="/____/"
  lineF="*${normal} Building a${bold} better${normal} working world *"

  tput sgr0
  tput bold
  tput cup $xc $yc "$(($1))" "$(($2 + 13))"
  printf "$lineA"
  tput cup $xc $yc "$(($1 + 1))" "$(($2 + 12))"
  printf "$lineB"
  tput cup $xc $yc "$(($1 + 2))" "$(($2 + 11))"
  printf "$lineC"
  tput cup $xc $yc "$(($1 + 3))" "$(($2 + 11 ))"
  printf "$lineD"
  tput cup $xc $yc "$(($1 + 4))" "$(($2 + 15))"
  printf "$lineE"
  tput cup $xc $yc "$(($1 + 5))" "$(($2))"
  printf "$lineF"

}


drawLogoPipe() {
  for i in $(seq 0 35);
  do
    tput cup $xc $yc "$1" "$(($2 + i))"
    printf $p "$myPipe"
    sleep 0.01
  done
  }

draw() {

for i in $(seq 1 $((COLUMNS -1)));
do
tput cup $xc $yc "$1" $i
printf $p "$myPipe"
sleep 0.01
done
}

drawDown() {
   randomY=$((1 + RANDOM %((COLUMNS -1))))
   for i in $(seq 1 $LINES);
   do
    tput cup $xc $yc $i $randomY
    printf $p "$myDownPipe"
    sleep 0.01
   done
  }

loop() {
   for i in $(seq 1 100);
     do

      randomXCord=$((1+RANDOM % $LINES))
      draw $randomXCord
      printLogo "$((midX -3))" "$((midY - 17))"
      drawDown
      printLogo "$((midX -3))" "$((midY - 17))"
     done
  }


midX="$((LINES / 2))"
midY="$((COLUMNS / 2))"
printLogo "$((midX -3))" "$((midY - 17))"
drawLogoPipe "$((midX - 4))" "$((midY - 17))"
loop
tput clear