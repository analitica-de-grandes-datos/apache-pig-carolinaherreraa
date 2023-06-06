/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data= LOAD 'data.tsv' AS (letter:chararray, bag_second:bag{b1:tuple(t1:chararray)}, d_map:map[]);
columns= FOREACH data generate letter,  SIZE (bag_second), SIZE (d_map);
ordered_data= ORDER columns BY $0,$1,$2;
STORE ordered_data INTO 'output' USING PigStorage(',');