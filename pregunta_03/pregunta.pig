/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letter:chararray, date:chararray, num:int);
column3= FOREACH data GENERATE num;
ordered_data= ORDER column3 BY num;
smallest= LIMIT ordered_data 5;
STORE smallest INTO 'output' USING PigStorage(',');

