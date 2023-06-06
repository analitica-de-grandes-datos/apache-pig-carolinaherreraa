/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (id:int, name:chararray, lastname:chararray, date:chararray, color:chararray, num2:int);
dates= FOREACH data GENERATE SUBSTRING(date, 0,4) AS year;
group_data= GROUP dates BY year;
quantity= FOREACH group_data GENERATE group, COUNT(dates);
STORE quantity INTO 'output' USING PigStorage(',');

