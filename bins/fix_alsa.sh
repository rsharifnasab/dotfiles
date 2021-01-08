#!/bin/bash

# get list of sinks/cards (for settings CARD1/CARD2)
# pacmd list-sinks | awk '/name:/ {print $0};' | awk '{ print $2}' | sed 's/<//g; s/>//g'


current=$(pacmd stat | \
    awk -F": " '/^Default sink name: /{print $2}' | \
    awk 'BEGIN{FS=OFS="."} NF--' | \
    sed 's/alsa_output/alsa_output/g')

echo "current is: $current"

CARDS=$(pacmd list-sinks | awk '/index:/ {print $0}'| tr "*" " " |  sed 's/ *$//g' |  awk '{print $2}')

for card in $CARDS; do
    [[ "$card" == "1" ]] && continue #ignore wired one
    echo "switching to $card"
    pacmd set-default-sink "$card"
done
