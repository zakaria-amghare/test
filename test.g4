grammar Grammar;
/**/
@header
{
    package antlr; 
}
start: var_global declaration instruction ;
/*VAR_GLOBAL*/
var_global:'VAR_GLOBAL' '{'var_expression'}';
var_expression:TYPE id_variable (','id_variable)* pvg;
id_variable: ID tableau?;
/*DECLARATION*/
declaration:'DECLARATION' '{'declaration_expression'}';
declaration_expression:(const|var_expression);
const:'CONST' TYPE ID '='(REAL_NUM|MOTS);
/*INSTRACTION*/
instruction:'INSTRACTION' '{'instruction_expression'}';
instruction_expression:;


/**/
tableau:'['positive_num']';
ID:[A-Z][a-zA-Z0-9]*;
positive_num:[1-9][0-9]*;
pvg:';';
TYPE:'INTEGER'
    |'FLOAT'
    |'CHAR';
REAL_NUM:'0'|'-'?[1-9][0-9]*('.'[0-9]*[1-9])?;
MOTS:\".*\"