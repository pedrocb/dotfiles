VOLUME="$(amixer get Master | awk -F'[]%[]' '/%/ {if ($5 == "off") {printf "%d\n",0} else {printf "%d\n", $2}}' |uniq)"

if [ $1 == "up" ]; then
    if [ $VOLUME -gt 95 ];
    then
	pactl set-sink-volume 1 100%
    else
	pactl set-sink-volume 1 +5%
    fi
elif [ $1 == "down" ]; then
    if [ "$VOLUME" -lt 6 ];
    then
	pactl set-sink-volume 1 1%
    else
	pactl set-sink-volume 1 -5%
    fi
elif [ $1 == "set" ]; then
    pactl set-sink-volume 1 $2%
fi

