#Ejercicio 5 AVG= Promedio
select AVG(Edad) as Promedio_Edad_Personas from persona;

#Ejercicio 13
select CONCAT(Nombre, " ",Apellido) as Nombre_Apellido from persona;

#Ejercicio 18
SELECT *FROM persona WHERE Apellido like "So%"; #Primeras Char
SELECT *FROM persona WHERE Apellido like "%So"; #Últimos Char 
SELECT *FROM persona WHERE Apellido like "%So%"; #Cualquier Parte

/*
AVG(), SUM(), MAX(), MIN(), COUNT(), CONCAT, DISTINC, AND, OR, LIKE, BETWEEN, ORDER BY, LIMIT
*/
#mayor edad
select max(Edad) as mayor_edad from persona;
#lista de personas por orden nenor a mayor edad
select Nombre, Apellido, Edad from persona order by Edad asc;
#Mostrar personas en orden alfabético columna nombre A-Z y Z-A
select Nombre, Apellido, Edad from persona order by Nombre asc;
#Mostrar la suma de todas las edades
select sum(Edad) as suma_edad from persona;
#Mostrar cuantas personas hay en la tabla persona
select count(id) as cantidad_persona from persona;
#Mostrar a la persona con menor edad
select min(Edad) as menor_edad from persona;
#Mostrar el último registro en la tabla persona
select max(id) as ultimo_registro from persona;
select *from persona order by id desc limit 1;
#Mostrar sólo el nombre y la edad
select Nombre, Edad from persona;
#Mostrar sólo los 3 últimos registros de la tabla personas
select *from persona order by id desc limit 3;
#Mostrar a las personas que sean mayores (o igual) de 18 años
select *from persona where edad<=18;
#Mostrar en una sola columna Nombre, Apellido y ciudad 
select CONCAT(Nombre," ", Apellido, " ", Edad) as Nombre_completo from persona;
#Mostrar en una sola columna Nombre y Edad ordenados alfabeticamente por el apellido
select concat(Nombre, " ",Apellido," ",Edad) as Nombre_completo from persona order by Apellido asc;
#Mostrar los registros únicos en la tabla personas de acuerdo a nombre.
select distinct(Nombre) from persona;
select Nombre from persona;
#Mostrar a las personas mayores de 18 y menores de 10 años
select *from persona where Edad > 18 or Edad < 10;
#Mostrar a las personas que sean menores de 10 años o que tengan apellido rodriguez
select *from persona where Edad > 10 and Apellido = "Rodriguez";
#Mostrar a las personas que tengan coincidencia en el apellido en las primeras letras con "Ro"
SELECT *FROM persona WHERE Apellido like "Ro%"; #Primeras Char
#Mostrar a las personas que tengan coincidencia con "Borys"
select *from persona where Nombre like "%borys%";
# Mostrar a las personas que tengan entre 20 y 30 años
select *from persona where Edad <= 30 and Edad >= 20;
select *from persona where Edad between 20 and 30;

select AVG(`2007`) as Promedio_gasto from tabla_con_estructura_de_archivo_csv;