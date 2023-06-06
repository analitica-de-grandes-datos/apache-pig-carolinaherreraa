/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letter:chararray, bag_second:bag{b1:tuple(t1:chararray)}, d_map:map[]);
third_col = FOREACH data GENERATE FLATTEN(d_map) AS letters;
group_by = GROUP third_col BY letters;
count_letters = FOREACH group_by GENERATE group, COUNT(third_col);
STORE count_letters INTO 'output' USING PigStorage(',');

