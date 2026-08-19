%{
#include<stdio.h>
#include<stdlib.h>

int yylex(void);
int yyerror(char *);
%}

%token ID DIG
%left '+' '-'
%left '*' '/'
%right UMINUS

%%
stmt: expn ;

expn: expn '+' expn
    | expn '-' expn
    | expn '*' expn
    | expn '/' expn
    | '-' expn %prec UMINUS
    | '(' expn ')'
    | DIG
    | ID;
%%

int main()
{
    printf("Enter the Expression\n");
    yyparse();
    printf("valid Expression\n");
    return 0;
}

int yyerror(char *s)
{
    printf("Invalid Expression");
    exit(0);
}
