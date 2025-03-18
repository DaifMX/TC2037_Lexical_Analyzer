%{
#include <stdio.h>
int yywrap(void){
return 1;
}
%}

%%

"//".*       {printf("COMMENT\n");}
[a-z]+       {printf("id ");}
"i"          {printf("intdcl ");}
"f"          {printf("floatdcl ");}
[0-9]+\.[0-9]+ {printf("fnum ");}
[0-9]+       {printf("inum ");}
"+"          {printf("plus ");}
"="          {printf("assign ");}
%%



int main(int argc, char **argv) {
    FILE    *fd;

    if (argc == 2)
    {
        if (!(fd = fopen(argv[1], "r")))
        {
            perror("Error: ");
            return (-1);
        }
        yyset_in(fd);
        yylex();
        fclose(fd);
    }
    else
        printf("Usage: a.out filename\n");
    return (0);
}