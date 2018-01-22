#Cómo crear una base de datos con SQL.
create database moduloocho character set utf8
collate utf8_general_ci;

#Crear una tabla con columnas.

create table `persona`(
	`id` int(11) NOT NULL,
    `Nombre`varchar(100),
    `Apellido` varchar(100),
    `Edad` int(3)
);

#Agregar Clave primaria a la tabla persona. clave primaria es única
alter table `persona`
	add PRIMARY KEY (`id`);
    
#Sentencia para ingresar fila en la tabla persona    
INSERT INTO `persona` (id, Nombre, Apellido, Edad)
values (1, "Diego", "Maradona", 20);

#Sentencia para mostrar todos los datos de la tabla
SELECT *FROM persona; 

#Sentencia para mostrar un dato:
SELECT *FROM persona where id=1; 

#Ejercicios MySQL.

#1) Como vaciar una tabla
DELETE FROM persona where id;
#TRUNCATE [NOMBRE TABLA]
TRUNCATE persona;

#Como añadir nueva columna a la tabla.
ALTER TABLE persona ADD COLUMN telefono VARCHAR(20), ADD pais VARCHAR(10);

#Cómo eliminar una tabla de la base de datos.
DROP TABLE persona;

#Como eliminar una columna de la tabla
ALTER TABLE persona drop estado;

#agregar columna entre dos columna que ya existen

#Se agrega columna segundo nombre
alter table persona add column Segundo_nombre varchar(100) after Nombre;

#Modificar llave principal como autoincrementable. 
ALTER TABLE persona
	MODIFY id int(11) not null AUTO_INCREMENT, AUTO_INCREMENT = 1;

#Insertar un solo registro luego de modificar el ID a AutoIncrementable
INSERT INTO persona (Nombre, Apellido, Edad)
	values("Jorgito", "Miguel", 24);
    
#INSERTAR varios registros en una sola consulta. 
INSERT INTO persona (Nombre, Segundo_nombre, Apellido, Edad)
	values ("Diego", "Armando", "Maradona", 60),
    ("Manuel", "Alejandro", "Rodriguez", 100),
	("Roberto", "Durán", "Durán", 60),
	("Mike", "Tyson", "Rodriguez", 21),
    ("Hanamichi", "Alejandro", "Perez", 15),
    ("Ilich", "Ulianov", "Lenin", 35),
    ("John", "Axl", "Galaxia", 23),
    ("Borys", "Groys", "Sanchez", 41);

#Eliminar solo una fila
DELETE FROM persona WHERE id = 1;

#Actualizar una columna en la tabla.
UPDATE persona SET Nombre = "Felipe" where id = 3;

select *from persona;