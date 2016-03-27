import json
import sys

NUMBER_OF_WORKSPACES = 10

input_str = sys.stdin.read()
input_converted = json.loads(input_str)

current_workspace_position = 0
output = ""
line=" "*15

for i in range(1,NUMBER_OF_WORKSPACES+1):
    if(input_converted[current_workspace_position]['num']==i):
        if(input_converted[current_workspace_position]['focused']==True):
            output+= "%{Ucolor1}%{+u}"+line 
        else: 
            output+= "%{Ucolor2}%{+u}"+line 
        if(current_workspace_position < len(input_converted)-1):
            current_workspace_position+=1
    else:
        output+= "%{Ucolor3}%{+u}"+line 
    if(i!=NUMBER_OF_WORKSPACES):
        output+="%{-u}   "

print output
