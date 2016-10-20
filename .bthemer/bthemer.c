#include <string.h>
#include<stdio.h>
#include<dirent.h>

char *cmd;
void list_themes(){
  DIR *themesDir;
  struct dirent *ep;
  themesDir = opendir("./themes");
  if(themesDir != NULL){
    while ((ep = readdir(themesDir))) {
        puts(ep->d_name);
    }
    closedir(themesDir);
  }
}

int main(int argc, char **argv){
  if(argc == 1){
    printf("You need params.\n");
    return 1;
  }
  cmd = argv[1];
  if(strcmp(cmd, "list") == 0){
    list_themes();
  }
}
