UNFOCUSED_OPACITY=0.7
killall compton
STATE="$(cat ~/dotfiles/compton.conf | grep inactive | grep -o -e '[0-9]\(.[0-9]\)\?')"
CONDITION="$(echo ${STATE}==${UNFOCUSED_OPACITY}|bc)"

if [[ $CONDITION -eq 1 ]]
then
    NEW=1
else
    NEW=$UNFOCUSED_OPACITY
fi
sed -i "/inactive-opacity/ c inactive-opacity = ${NEW};" ~/dotfiles/compton.conf
compton -b
