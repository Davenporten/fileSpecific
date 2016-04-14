#!/bin/bash
echo "Checking cpp files"
for i in $1/*.cpp; 
do 
   for j in $2/*.cpp; 
   do
      FILE1="${i##*/}"
      FILE2="${j##*/}"  
      if [ "$FILE1" = "$FILE2" ];
      then echo ${i} " and " ${j}; UNI=$(sdiff -B -b -s -i $i $j | wc -l); ILINES=$(cat $i | wc -l) && JLINES=$(cat $j | wc -l);
      ((JLINES+=1));
      ((ILINES+=1));
      #echo "UNI: $UNI";
      #echo "ILINES: $ILINES";
      #echo "JLINES: $JLINES";
      TOT=$[ILINES + JLINES];
      #echo "TOT: $TOT";
      SUB=$[TOT - UNI];
      #echo "SUB: $SUB";
      DIV=$[SUB / 2];
      #echo "DIV: $DIV";
      PERC=$(bc <<< "scale=2;$DIV/$JLINES");
      #echo "PERC: $PERC";
      FINAL=$(bc <<< "scale=1;$PERC*100");
      echo "${FINAL%.*}% the same" && echo;
      fi
   done;
done


for i in $1/*.h;
do
   for j in $2/*.h;
   do
      FILE1="${i##*/}"
      FILE2="${j##*/}"
      if [ "$FILE1" = "$FILE2" ];
      then echo ${i} " and " ${j}; UNI=$(sdiff -B -b -s -i $i $j | wc -l); ILINES=$(cat $i | wc -l) && JLINES=$(cat $j | wc -l);
      ((JLINES+=1));
      ((ILINES+=1));
      #echo "UNI: $UNI";
      #echo "ILINES: $ILINES";
      #echo "JLINES: $JLINES";
      TOT=$[ILINES + JLINES];
      #echo "TOT: $TOT";
      SUB=$[TOT - UNI];
      #echo "SUB: $SUB";
      DIV=$[SUB / 2];
      #echo "DIV: $DIV";
      PERC=$(bc <<< "scale=2;$DIV/$JLINES");
      #echo "PERC: $PERC";
      FINAL=$(bc <<< "scale=1;$PERC*100");
      echo "${FINAL%.*}% the same" && echo;
      fi
   done;
done

#for i in $1/*;
#do
#   for j in $2/*;
#   do
#      FILE1="${i##*/}"
#      FILE2="${j##*/}"
#      if [ "$FILE1" = "$FILE2" ];
#      then echo ${i} " and " ${j}; UNI=$(sdiff -B -b -s -i $i $j | wc -l); ILINES=$(cat $i | wc -l) && JLINES=$(cat $j | wc -l);
#      ((JLINES+=1));
#      ((ILINES+=1));
#      #echo "UNI: $UNI";
#      #echo "ILINES: $ILINES";
#      #echo "JLINES: $JLINES";
#      TOT=$[ILINES + JLINES];
#      #echo "TOT: $TOT";
#      SUB=$[TOT - UNI];
#      #echo "SUB: $SUB";
#      DIV=$[SUB / 2];
#      #echo "DIV: $DIV";
#      PERC=$(bc <<< "scale=2;$DIV/$JLINES");
#      #echo "PERC: $PERC";
#      FINAL=$(bc <<< "scale=1;$PERC*100");
#      echo "${FINAL%.*}% the same" && echo;
#      fi
#   done;
#done
