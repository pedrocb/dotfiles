import fileinput
import json
import os

config = json.loads("".join(fileinput.input()))

def handle_i3(i3):
    #remove colors from file
    f = open(os.environ['HOME'] + "/.config/i3/config","r+")
    d = f.readlines()
    f.seek(0)
    for i in d:
        if not i.startswith("client.focused") and not i.startswith("client.unfocused"):
            f.write(i)
            
    client_focused = i3["client-focused"]
    client_focused_text = "client.focused  {} {} {}".format(client_focused["border"],client_focused["background"],client_focused["text"])
    f.write(client_focused_text + "\n")
    
    client_unfocused = i3["client-unfocused"]
    client_unfocused_text = "client.unfocused  {} {} {}".format(client_unfocused["border"],client_unfocused["background"],client_unfocused["text"])
    f.write(client_unfocused_text)
    
    f.truncate()
    f.close()

    os.system("i3-msg restart")

def handle_lemonbar(lemonbar):
    top_bar = lemonbar["top-bar"]
    os.system("sed -i '/^[ \t]*BORDER_COLOR/ c \{}\' {}".format("BORDER_COLOR={}".format(top_bar["border"]), os.environ['HOME'] + "/dotfiles/.bin/lemonbar_config"))
    os.system("sed -i '/^[ \t]*BACKGROUND_COLOR/ c \{}\' {}".format("BACKGROUND_COLOR={}".format(top_bar["background"]), os.environ['HOME'] + "/dotfiles/.bin/lemonbar_config"))
    os.system("sed -i '/^[ \t]*FONT_COLOR/ c \{}\' {}".format("FONT_COLOR={}".format(top_bar["font"]), os.environ['HOME'] + "/dotfiles/.bin/lemonbar_config"))

    bottom_bar = lemonbar["bottom-bar"]
    os.system("sed -i '/^[ \t]*FOCUSED_WORKSPACE_COLOR/ c \{}\' {}".format("FOCUSED_WORKSPACE_COLOR={}".format(bottom_bar["focused-workspace"]), os.environ['HOME'] + "/dotfiles/.bin/lemonbar_config"))
    os.system("sed -i '/^[ \t]*UNFOCUSED_WORKSPACE_COLOR/ c \{}\' {}".format("UNFOCUSED_WORKSPACE_COLOR={}".format(bottom_bar["unfocused-workspace"]), os.environ['HOME'] + "/dotfiles/.bin/lemonbar_config"))
    os.system("sed -i '/^[ \t]*EMPTY_WORKSPACE_COLOR/ c \{}\' {}".format("EMPTY_WORKSPACE_COLOR={}".format(bottom_bar["empty-workspace"]), os.environ['HOME'] + "/dotfiles/.bin/lemonbar_config"))

    
for obj in config.keys():
    if obj == "i3":
        handle_i3(config[obj])
    elif obj == "lemonbar":
        handle_lemonbar(config[obj])
    elif obj == "wallpaper":
        os.system("feh --bg-scale {}".format(config[obj]))
    
