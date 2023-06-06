/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
data = LOAD 'data.csv' USING PigStorage(',') AS (num1:int, name:chararray, lastname:chararray, date:chararray, color:chararray, num2:int);
colors = FOREACH data GENERATE color;
filtered_data = FILTER colors BY NOT (color MATCHES '.*b.*');
STORE filtered_data INTO 'output' USING PigStorage(',');
