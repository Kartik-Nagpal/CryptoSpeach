%{
  #include <stdio.h>
%}
%option noyywrap

dig		  [0-9]
alpha		  [a-fA-F]
hexnum     ({digit}|{alpha}){1,8}
hex		  0[xX]{hexnum}

%%

[dig]+  {
			printf("the integer %s", yytext);
}
int     {
			printf("integer type", yytext);
}
string  {
			printf("string type", yytext);
}
[=]     {
         printf(" equals ", yytext);
}
[+]     {
         printf(" plus ", yytext);
}
[-]     {
         printf(" minus ", yytext);
}
[*]     {
         printf(" multiplied by ", yytext);
}
[/]     {
         printf(" divided by ", yytext);
}
[%]     {
         printf(" modulus ", yytext);
}
.        {
         printf(" variable %s ", yytext);
}
.|\n    {
			/* Ignore all other characters. */
}
%%

main()
{
  yylex();
}
