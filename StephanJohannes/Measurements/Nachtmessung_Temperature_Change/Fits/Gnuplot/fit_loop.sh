#!/bin/bash

VOLTS=( '0,10' '0,15' '0,20' '0,25' '0,30' '0,35' '0,40' '0,45' '0,50' '0,55' '0,60' '0,65' '0,70' '0,75' '0,80' '0,85' '0,90' '1,00' '1,05' '1,10' '1,15')

i=0
while [[ -n "${VOLTS[$i]}" ]];
do
  scriptname="fitlorentz${VOLTS[$i]}.gplt"
  cp fitlorentz.gplt $scriptname
  
  filename="Temp_Change_${VOLTS[$i]}.txt"
  output_fit="Fit_Temp_Change_${VOLTS[$i]}.ps"
  output_res="Residuals_Temp_Change_${VOLTS[$i]}.ps"
  title_fit="Lorentz-Fit, Voltage: ${VOLTS[$i]}"
  title_res="Residuen zu Lorentz-Fit, Voltage: ${VOLTS[$i]}"
  
  sed -i s/###FILENAME###/$filename/g $scriptname 
  sed -i s/###TITLE_1###/$title_fit/g $scriptname 
  sed -i s/###TITLE_2###/$title_res/g $scriptname 
  sed -i s/###OUTPUT_1###/$output_fit/g $scriptname 
  sed -i s/###OUTPUT_2###/$output_res/g $scriptname
  
  gnuplot $scriptname
  
  i=$(( $i + 1 ))
done