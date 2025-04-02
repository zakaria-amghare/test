grammar Grammar;
/**/
@header
{
    package antlr; 
}
start: var_global declaration instruction ;
/*VAR_GLOBAL*/
var_global:'VAR_GLOBAL' '{'var_expression'}';
var_expression:TYPE id_variable (','id_variable)* PVG;
id_variable: ID tableau?;
tableau:'['POSITIVE_NUM']';
/*DECLARATION*/
declaration:'DECLARATION' '{'declaration_expression'}';
declaration_expression:(const|var_expression);
const:'CONST' TYPE ID '='(REAL_NUM|MOTS);
/*INSTRACTION*/
instruction:'INSTRACTION' '{'instruction_expression'}';
instruction_expression:(affectation|if|boocle);
affectation:ID'='exp;
exp:expr OPRATEUR_ARETHMETIC1 expr
   |expr OPRATEUR_ARETHMETIC2 expr
   |ID
   |NUM;
if:IFSTATEMENT'('condition')''{'instruction_expression'}'(ELSEFSTATEMENT'{'instruction_expression'}')*;
condition_simple:expr OPRATEUR_COMPARAISON expr;
condition:condition_simple(OPRATEUR_LOGIQUE condition_simple)*;
boocle:FORSTATMENT'('condition')''{'instruction_expression'}';
   /*****/
ID:[A-Z][a-zA-Z0-9]*;
POSITIVE_NUM:[1-9][0-9]*;
TYPE:'INTEGER'
    |'FLOAT'
    |'CHAR';
REAL_NUM:'0'|'-'?[1-9][0-9]*('.'[0-9]*[1-9])?;
MOTS:\".*\";
OPRATEUR_LOGIQUE'||'|'&&';
OPRATEUR_ARETHMETIC1'*'|'/';
OPRATEUR_ARETHMETIC2'+'|'-';
OPRATEUR_COMPARAISON '>'|'>='|'=='|'!='|'<'|'<=' ;
IFIFSTATEMENT:'IF';
ELSEFSTATEMENT:'ELSE';
FORSTATMENT:'FOR';
PVG:';';