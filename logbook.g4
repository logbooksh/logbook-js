grammar logbook;

logsheet
   : (property_or_tag | log_entry | spaces_or_newlines)* EOF
   ;

property_or_tag
   : property
   | tag
   ;

property : '[' WS* property_name WS* ':' WS* property_value WS* ']' ;
property_name : STRING ;
property_value : (STRING WS?)*;
tag : '#' STRING+ ;

log_entry :
  clock WS*
  (task_status WS* title | title)?
  (property_or_tag | WS | NL)* NL
  notes ;

clock : '(' time ')' ;
task_status : '[' ('Start' | 'Pause' | 'Resume' | 'Done' | 'Cancel') ']' ;
title : STRING (WS STRING)*;
notes:
  |
  WS* STRING (STRING | WS | NL)*
  ;

time : TIME_24H | TIME_12H ;

spaces_or_newlines
   : WS
   | NL
   ;

TIME_12H : [0-1] [0-9] ':' [0-5] [0-9] ('pm' | 'PM' | 'am' | 'AM') ;
TIME_24H : [0-2] [0-9] ':' [0-5] [0-9] ;

STRING : (~[ :#()[\]\r\n])+ ;
WS : [ \t]+ ;
NL : ('\r'? '\n')+ ;
