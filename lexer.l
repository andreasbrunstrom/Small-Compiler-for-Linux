%{
#include <stdio.h>
#include "global.h"
//int yylval;
int c;
%}

delim	[\t\n ]
ws	{delim}+
letter	[A-Za-z]
digit	[0-9]
id	{letter}({letter}|{digit})* 
num {digit}+ 
%option noyywrap
%%


"("       { return '('; }
")"       { return ')'; }
"+"       { return '+'; }
"-"       { return '-'; }
"*"       { return '*'; }
"="       { return '='; }
";"       { return ';'; }
"?"	  { return '?'; }
":"       { return ':'; }
"/"       { return '/'; }
"%"       { return '%'; }
"<"	  { return '<'; }
">"       { return '>'; }
"{"	  { return '{';}
"}"	  { return '}';}
"while"  { return WHILE; }
"if" 	  { return IF ;}
"else"	  { return ELSE; }
"print"	  {return PRINT;}
"read"	  { return READ;}


{ws}

{id}  { c = lookup (yytext);
            if (c == 0) {
                c = insert (yytext, ID);
             }
        yylval.n = c;
        return ID; }

{num}  { yylval.n = atoi(yytext); return NUM; }
.         //{ printf("Ignoring invalid character '%s'\n", yytext); }

"---" {return DONE;}

%%
