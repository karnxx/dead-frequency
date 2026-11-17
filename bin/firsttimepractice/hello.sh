#!/usr/bin/env bash

read -p "difficulty (choose from 0,1,2,3)" dif

while [[ ! "$dif" =~ ^[0-3]$ ]]
do
    read -p "holy shit bro numbers like 0-9 numbers" dif
done

difcha=$((10**(dif+1)))

numa=$((RANDOM % difcha + 1))

read -p "guess a number 1 to $difcha" guess

while [[ ! "$guess" =~ ^[0-9]+$ ]] || [[ $guess -lt 1 || $guess -gt $difcha ]]
do
    read -p "holy shit bro numbers like 0-9 numbers" guess
done

atm=1

while [[ $guess -ne $numa ]]
do
    if [[ $guess -lt $numa ]]; then
        echo "higher!"
    elif [[ $guess -gt $numa ]]; then
        echo "lower!"
    fi
    ((atm++))
    read guess
    while [[ ! "$guess" =~ ^[0-9]+$ ]]
    do
        read -p "holy shit bro numbers like 0-9 numbers" guess
    done
done


if [[ $guess -eq $numa ]]; then
    echo "guessed smartass in $atm attempts lol"
fi