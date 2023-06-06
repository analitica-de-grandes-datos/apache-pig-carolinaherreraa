/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data= LOAD 'data.tsv' AS (letter:chararray, bag_second:bag{b1:tuple(t1:chararray)}, d_map:map[]);
uncouple= FOREACH data GENERATE FLATTEN(bag_second) AS letter1, FLATTEN (d_map) AS word;
joined_data = FOREACH uncouple GENERATE (letter1,word) AS data_tuple;
grouped_data= group joined_data BY data_tuple;
quantity= FOREACH grouped_data GENERATE group, COUNT(joined_data);
STORE quantity INTO 'output' USING PigStorage(',');
