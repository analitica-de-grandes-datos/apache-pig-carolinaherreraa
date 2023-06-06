/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data= LOAD 'data.tsv' AS (letter:chararray, bag_second:bag{b1:tuple(t1:chararray)}, d_map:[]);
uncouple= FOREACH data GENERATE FLATTEN(bag_second) AS letter;
group_by= GROUP uncouple BY letter;
count_letters= FOREACH group_by GENERATE group, COUNT(uncouple);
STORE count_letters INTO 'output' USING PigStorage(',');