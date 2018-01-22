CREATE database ConvenioPac character set utf8
collate utf8_general_ci;

create table TipoEmpresa(
 CodTipoEmp int(100) not null primary key auto_increment, 
 NomTipoEmp varchar(50) not null
	);

create table TipoConvenio(
	CodTipoConv int(100) not null primary key auto_increment,
    NomTipoConv varchar(50) not null
);
    
create table Cliente(
	Rutcli int(100) not null primary key,
    ApPat varchar(100) not null,
    ApMat varchar(100) not null,
    Nombres varchar(100) not null,
    SueldoLiq int(100) not null,
    FechaIng date not null
    
);    

create table Empresa(
	RutEmp bigint(100) not null primary key, NomEmp varchar(50) not null,
    CodTipoEmp int(10) not null
);


create table Convenio(
	NroConv int(100) not null primary key auto_increment,
    CodTipoConv int(10) not null, NroCliEmp int(10) not null,
    RutCliEmp int(10) not null, RutEmp bigint(199) not null, 
    RutCli int(100), FechaIniConv date not null, FechaTerConv date not null, EstadoConv int(1) not null
    );

create table CuentaCorriente(
	NroCtaCte int(100) not null primary key auto_increment, Rut int(100) not null, FechaApertura date not null,
    SaldoDisp int(100) not null, SaldoCont int(100) not null
    );

create table CargoPac(
	NroCargo int(10) not null primary key auto_increment, NroConv int(10) not null,
    NroCtaCte int(100) not null, FechaCargo date not null, FechaRealCargo date not null, 
    MontoCargo int(100) not null, EstadoCargoint int(1) not null
);

Alter table Convenio add constraint relacion_convenio_empresa foreign key (RutEmp) references Empresa(RutEmp);
Alter table Convenio add constraint relacion_convenio_tipoConvenio foreign key (CodTipoConv) references TipoConvenio(CodTipoConv);
Alter table Convenio add constraint relacion_convenio_cliente foreign key (RutCLi) references Cliente(RutCLi);
Alter table CargoPac add constraint relacion_convenio_cargoPac foreign key (NroConv) references Convenio(NroConv);
Alter table CargoPac add constraint relacion_cargoPac_cuentaCorriente foreign key (NroCtaCte) references CuentaCorriente(NroCtaCte);
Alter table CuentaCorriente add constraint relacion_cuentaCorriente_cliente foreign key (Rut) references Cliente(Rutcli);
Alter table Empresa add constraint relacion_empresa_tipoEmpresa foreign key (CodTipoEmp) references TipoEmpresa(CodTipoEmp);

LOAD DATA CONCURRENT LOCAL INFILE '/Users/italo/Desktop/Bibliografía java/SQL/tablasConvenioPac/cargopac.csv'
 INTO TABLE CargoPac
 FIELDS TERMINATED BY ',' 
 LINES TERMINATED BY '\n';
 
 alter table Convenio drop foreign key relacion_convenio_empresa; /* eliminar llave foránea*/
 alter table Convenio drop foreign key relacion_convenio_tipoConvenio;
 alter table Convenio drop foreign key relacion_convenio_cliente;
 
 alter table CargoPac drop foreign key relacion_convenio_cargoPac;
  alter table CargoPac drop foreign key relacion_cargoPac_cuentaCorriente;
 
 alter table Empresa Modify RutEmp bigint not null;
 Alter table Convenio modify RutEmp bigint not null;
 
 LOAD DATA CONCURRENT LOCAL INFILE '/Users/italo/Desktop/Bibliografía java/SQL/tablasConvenioPac/cuentacorriente.csv'
 INTO TABLE CuentaCorriente
 FIELDS TERMINATED BY ',' 
 LINES TERMINATED BY '\n';
 
delete from TipoEmpresa where CodTipoEmp > 0; 

INSERT INTO `Convenio` (`NroConv`, `CodTipoConv`, `NroCliEmp`, `RutEmp`, `RutCli`, `FechaIniConv`, `FechaTerConv`, `EstadoConv`) VALUES
(1, 1, 1, 4567891230, 123456789, '2017-10-12 00:00:00', '2019-01-01 00:00:00', 1),
(2, 5, 2, 1234567899, 987654321, '2017-10-12 00:00:00', '2019-01-01 00:00:00', 1),
(3, 3, 3, 7894561230, 654321987, '2014-11-01 00:00:00', '2019-01-01 00:00:00', 1),
(4, 4, 4, 1234567890, 987321654, '2015-01-03 00:00:00', '2019-01-01 00:00:00', 1),
(5, 2, 5, 7898529630, 456789123, '2016-09-18 00:00:00', '2019-01-01 00:00:00', 1),
(6, 5, 6, 7410852236, 789654123, '2016-09-18 00:00:00', '2019-01-01 00:00:00', 1),
(7, 5, 7, 9876543214, 235689741, '2016-09-18 00:00:00', '2017-12-12 00:00:00', 0),
(8, 4, 8, 7896541235, 852741963, '2016-09-18 00:00:00', '2017-12-12 00:00:00', 0),
(9, 1, 9, 8529637410, 147258369, '2018-01-01 00:00:00', '2019-01-01 00:00:00', 1),
(10, 3, 6, 7410852236, 789654123, '2018-01-01 00:00:00', '2019-01-01 00:00:00', 1),
(11, 3, 6, 7410852236, 789654123, '2018-01-01 00:00:00', '2019-01-01 00:00:00', 1),
(12, 2, 3, 7894561230, 654321987, '2018-01-01 00:00:00', '2019-01-01 00:00:00', 1),
(13, 2, 4, 1234567890, 987321654, '2017-12-12 00:00:00', '2019-01-01 00:00:00', 1),
(14, 4, 4, 1234567890, 987321654, '2017-12-12 00:00:00', '2017-12-31 00:00:00', 0),
(15, 1, 5, 7898529630, 456789123, '2017-12-12 00:00:00', '2017-12-31 00:00:00', 0);

INSERT INTO `CargoPAC` (`NroCargo`, `NroConv`, `NroCtaCte`, `FechaCargo`, `FechaRealCargo`, `MontoCargo`, `EstadoCargoint`) VALUES
(1001, 1, 10032100, '2017-12-31 00:00:00', '2018-01-02 00:00:00', 250000, 0),
(1002, 2, 10032101, '2017-12-31 00:00:00', '2018-01-02 00:00:00', 250000, 1),
(1003, 3, 10032102, '2017-12-31 00:00:00', '2018-01-02 00:00:00', 250000, 0),
(1004, 4, 10032103, '2017-12-31 00:00:00', '2018-01-02 00:00:00', 250000, 0),
(1005, 5, 10032104, '2017-12-31 00:00:00', '2018-01-02 00:00:00', 250000, 0),
(1006, 6, 10032105, '2017-12-31 00:00:00', '2018-01-02 00:00:00', 50000, 0),
(1007, 7, 10032106, '2017-12-31 00:00:00', '2018-01-02 00:00:00', 50000, 0),
(1008, 8, 10032107, '2017-12-31 00:00:00', '2018-01-02 00:00:00', 50000, 0),
(1009, 9, 10032108, '2017-12-31 00:00:00', '2018-01-02 00:00:00', 50000, 0),
(1010, 10, 10032114, '2017-12-31 00:00:00', '2018-01-02 00:00:00', 50000, 0),
(1011, 11, 10032114, '2017-12-31 00:00:00', '2018-01-02 00:00:00', 50000, 1),
(1012, 12, 10032102, '2017-12-31 00:00:00', '2018-01-02 00:00:00', 35026, 1),
(1013, 13, 10032111, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 35026, 1),
(1014, 14, 10032111, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 35026, 1),
(1015, 15, 10032104, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1016, 1, 10032112, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 550000, 0),
(1017, 2, 10032101, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 550000, 0),
(1018, 3, 10032102, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 550000, 0),
(1019, 4, 10032111, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 550000, 0),
(1020, 5, 10032104, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 550000, 0),
(1021, 6, 10032109, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 550000, 0),
(1022, 7, 10032106, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 550000, 0),
(1023, 8, 10032107, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1024, 9, 10032110, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1025, 10, 10032114, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1026, 11, 10032114, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1027, 12, 10032102, '2017-11-30 00:00:00', '2017-12-31 00:00:00', 35026, 1),
(1028, 13, 10032111, '2017-11-30 00:00:00', '2017-12-31 00:00:00', 550000, 1),
(1029, 14, 10032111, '2017-11-30 00:00:00', '2017-12-31 00:00:00', 550000, 1),
(1030, 15, 10032104, '2017-11-30 00:00:00', '2017-12-31 00:00:00', 550000, 1),
(1031, 1, 10032112, '2017-11-30 00:00:00', '2017-12-31 00:00:00', 550000, 1),
(1032, 2, 10032101, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 550000, 1),
(1033, 3, 10032102, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 550000, 1),
(1034, 4, 10032111, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 550000, 1),
(1035, 5, 10032104, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 123456, 0),
(1036, 6, 10032109, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 123456, 0),
(1037, 7, 10032106, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 123456, 0),
(1038, 8, 10032107, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 123456, 0),
(1039, 9, 10032110, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 123456, 0),
(1040, 10, 10032114, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 123456, 0),
(1041, 11, 10032114, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 550000, 0),
(1042, 12, 10032102, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 550000, 0),
(1043, 13, 10032111, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 4572221, 0),
(1044, 14, 10032111, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 4572221, 0),
(1045, 15, 10032104, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 4572221, 0),
(1046, 1, 10032112, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 123456, 0),
(1047, 2, 10032101, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 123456, 0),
(1048, 3, 10032102, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1049, 4, 10032111, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1050, 5, 10032104, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1051, 6, 10032109, '2018-01-08 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1052, 7, 10032106, '2018-01-08 00:00:00', '2018-01-25 00:00:00', 35026, 0),
(1053, 8, 10032107, '2018-01-08 00:00:00', '2018-01-25 00:00:00', 35026, 1),
(1054, 9, 10032110, '2018-01-08 00:00:00', '2018-01-25 00:00:00', 35026, 1),
(1055, 10, 10032114, '2018-01-08 00:00:00', '2018-01-25 00:00:00', 35026, 1),
(1056, 11, 10032114, '2017-11-30 00:00:00', '2018-01-25 00:00:00', 35026, 0),
(1057, 12, 10032102, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 250000, 0),
(1058, 13, 10032111, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 250000, 0),
(1059, 14, 10032111, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 250000, 1),
(1060, 15, 10032104, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 250000, 1),
(1061, 1, 10032112, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 250000, 1),
(1062, 2, 10032101, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 250000, 1),
(1063, 3, 10032102, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 250000, 1),
(1064, 4, 10032111, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 250000, 0),
(1065, 5, 10032104, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 250000, 0),
(1066, 6, 10032109, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 250000, 0),
(1067, 7, 10032106, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 250000, 0),
(1068, 8, 10032107, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 4572221, 0),
(1069, 9, 10032110, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 4572221, 0),
(1070, 10, 10032114, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1071, 11, 10032114, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1072, 12, 10032102, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1073, 13, 10032111, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1074, 14, 10032111, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1075, 15, 10032104, '2017-11-30 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1076, 5, 10032104, '2018-02-01 00:00:00', '2018-01-15 00:00:00', 35026, 0),
(1077, 3, 10032102, '2018-02-01 00:00:00', '2018-02-03 00:00:00', 4572221, 0),
(1078, 10, 10032114, '2018-02-01 00:00:00', '2018-02-03 00:00:00', 4572221, 0);

/*
1) Implemente una consulta SQL que muestre 
la cantidad de cuentas corrientes que posee
cada cliente.
*/
SELECT Cliente.Rutcli as Cliente, 
COUNT(CuentaCorriente.NroCtaCte) as TotalCtaCtes
from Cliente 
INNER JOIN CuentaCorriente ON Cliente.RutCli = CuentaCorriente.Rut
group by Cliente.RutCli;  

/*
2) Implemente una consulta SQL que muestre 
los cargos de los convenios de cada cliente a
su cuenta corriente.
*/
SELECT Cliente.RutCli as Cliente, CuentaCorriente.NroCtaCte as CtaCte,
SUM(CargoPAC.MontoCargo) as TotalCargos
from CuentaCorriente
INNER JOIN Cliente ON CuentaCorriente.Rut = Cliente.RutCli
INNER JOIN CargoPAC ON CuentaCorriente.NroCtaCte = CargoPAC.NroCtaCte
group by CuentaCorriente.NroCtaCte;

/*
3) Implemente una consulta SQL que muestre la cantidad de cuentas 
corrientes que posee
cada cliente, agrupar consulta por apellido paterno.*/

SELECT Cliente.ApPat as ApPat, 
COUNT(CuentaCorriente.NroCtaCte) as TotalCtaCtes
from Cliente 
INNER JOIN CuentaCorriente ON Cliente.RutCli = CuentaCorriente.Rut
group by Cliente.ApPat;

/*4) Mostrar los tipos de convenio que tiene una empresa a través del Rut (Rut y tipo).*/

select Empresa.RutEmp, TipoConvenio.CodTipoConv, TipoConvenio.NomTipoConv
from Convenio
inner join Empresa on Empresa.RutEmp = Convenio.RutEmp
inner join TipoConvenio on TipoConvenio.CodTipoConv = Convenio.CodTipoConv 
group by empresa.nomemp asc;

/*5) Mostrar el total de dinero que tiene el cliente en el banco (el cliente puede tener múltiples
cuentas).*/

select Cliente.Rutcli, Cliente.Nombres, Cliente.ApPat, Cliente.ApMat,
sum(CuentaCorriente.SaldoDisp) as TotalSaldo
from Cliente
inner join CuentaCorriente on CuentaCorriente.Rut = Cliente.Rutcli
group by Cliente.Rutcli asc;

/*6) Mostrar todas las empresas que tienen convenio con el banco*/

Select Empresa.NomEmp, Convenio.CodTipoConv, Convenio.EstadoConv, Convenio.FechaIniConv, Convenio.FechaTerConv
from Empresa
inner join Convenio on Empresa.RutEmp = Convenio.RutEmp
where Convenio.EstadoConv > 0
group by Empresa.NomEmp;

/*7) Mostrar en una consulta los convenios con la cantidad de empresas asociadas. 
	-Mostrar las empresas con la cantidad de cada convenio asociado (Usar Casos).*/
    
select TipoConvenio.NomTipoConv, Convenio.NroConv, count(Empresa.RutEmp)as cantidad_de_empresas
from TipoConvenio
inner join Convenio on TipoConvenio.CodTipoConv = Convenio.CodTipoConv
inner join Empresa on Empresa.RutEmp = Convenio.RutEmp
group by TipoConvenio.NomTipoConv;    

select Empresa.RutEmp as Empresa,
sum(CASE When convenio.codtipoconv=3 then 1 else 0 end) as PagoRapido,
sum(CASE When convenio.codtipoconv=3 then 1 else 0 end) as PagoSeguro,
sum(CASE When convenio.codtipoconv=3 then 1 else 0 end) as PagoConEstafa,
sum(CASE When convenio.codtipoconv=3 then 1 else 0 end) as PagoIngenuo,
sum(CASE When convenio.codtipoconv=3 then 1 else 0 end) as PagoXtodo
from Empresa
inner join Convenio on Empresa.RutEmp = Convenio.RutEmp
group by Empresa.RutEmp;


#8) Mostrar el total de cargos que tiene una empresa.

select Empresa.NomEmp as Empresa, sum(CargoPac.MontoCargo) as Total_Cargos
from CargoPac
inner join convenio on convenio.nroconv = CargoPac.NroConv
inner join Empresa on Empresa.rutemp = convenio.RutEmp
group by Empresa.NomEmp;

#9) Mostrar el total de cargos a 30, 60 y 90 días.

#Primera Solucion cambias intervalo de dias

Select sum(MontoCoargo) from CargoPac
Where FechaCargo Between date_sub(now(), Interval 30 day)and now();
#date_SUB = Substract -- restar una cantidad de dias , horas, minutos
#DATE_ADD = sumar
#curdate = fecha actual
#now = fecha y hora actual

#Segunda solucion utilizando casos
Select sum(case when FechaCargo between date_sub(now(), interval 30 day) and now() then MontoCargo else 0 end) as  `A 30 dias`, 
sum(case when FechaCargo between date_sub(now(), interval 60 day) and now() then MontoCargo else 0 end) as  `A 60 dias`, 
sum(case when FechaCargo between date_sub(now(), interval 90 day) and now() then MontoCargo else 0 end) as  `A 90 dias` 
from CargoPac;

#solucion sergio
Select 
sum(case when FechaCargo<=curdate() and FechaCargo>=date_sub(curdate(), interval 30 day) then MontoCargo else 0 end) as  `A 30 dias`, 
sum(case when FechaCargo<=curdate() and FechaCargo>=date_sub(curdate(), interval 30 day)then MontoCargo else 0 end) as  `A 60 dias`, 
sum(case when FechaCargo<=curdate() and FechaCargo>=date_sub(curdate(), interval 30 day) then MontoCargo else 0 end) as  `A 90 dias` 
from CargoPac;

#11) Crear una vista para mostrar los cargos pagados el mes presente.

create VIEW total_cargos_sergio as
Select 
sum(case when FechaCargo<=curdate() and FechaCargo>=date_sub(curdate(), interval 30 day) then MontoCargo else 0 end) as  `A 30 dias`, 
sum(case when FechaCargo<=curdate() and FechaCargo>=date_sub(curdate(), interval 30 day)then MontoCargo else 0 end) as  `A 60 dias`, 
sum(case when FechaCargo<=curdate() and FechaCargo>=date_sub(curdate(), interval 30 day) then MontoCargo else 0 end) as  `A 90 dias` 
from CargoPac;

#Acceder a una vista
 SELECT *FROM total_cargos_sergio

#Como implementar un procedimiento almacenado.
/*DELIMITER //
CREATE PROCEDURE Nombre_Proc_Alm(IN Argumento TipodeDato)
Begin
	#sentencia aql simple
    SET @QUERY*/
    
#MOSTRAR CLIENTES CON PROCEDIMIENTOS ALMACENADOS
DELIMITER //
CREATE PROCEDURE MOSTRAR_CLIENTES()
BEGIN
	SELECT *FROM Cliente;
END;
//
DELIMITER ;    

CALL MOSTRAR_CLIENTES;

drop procedure MOSTRAR_CLIENTES;

#CREAR PROC ALMC q muestre el total de registros en una tabla.
DELIMITER //
CREATE PROCEDURE total_registros(IN tabla varchar(200))
BEGIN 
	SET @QUERY = concat('Select count(*) from (',tabla,')');
    PREPARE stmt from @query;
    EXECUTE stmt;
END;
// 
DELIMITER ;

CALL total_registros("Convenio");

drop procedure total_registros;

#12) Crear una vista para mostrar la cantidad de cuentas abiertas en un año.

create view CuentasAbrUnAno as
select 
sum(case when year(FechaApertura) = 2017 then 1 else 0 end) as `2017`,
sum(case when year(FechaApertura) = 2016 then 1 else 0 end) as `2016`,
sum(case when year(FechaApertura) = 2015 then 1 else 0 end) as `2015`,
sum(case when year(FechaApertura) = 2014 then 1 else 0 end) as `2014`,
sum(case when year(FechaApertura) = 2013 then 1 else 0 end) as `2013`
from CuentaCorriente;

select *from CuentasAbrUnAno; 

#13) Crear una vista para mostrar a todos los clientes del banco (sin repetir).

create view TotalClientes as
select
Cliente.Rutcli, Cliente.ApPat
From Cliente;

#14) Crear un procedimiento almacenado que sume al MontoCargo 50000 pesos los cargos no
#pagados mayores a 30 días.
DELIMITER //
CREATE PROCEDURE SumarCargo50000() 
BEGIN 
	select CargoPac.MontoCargo + 50000 as Suma5000
    from CargoPac
    WHERE EstadoCargoint = 0
    and FechaCargo between date_sub(now(), interval 30 day) and now();
END
// 
DELIMITER ;

drop procedure SumarCargo50000;
call SumarCargo50000;

#15) Crear un procedimiento almacenado para insertar nuevos cargos a todos los clientes.
DELIMITER //
CREATE PROCEDURE NuevosCargos(in tabla bigint) 
BEGIN 

	SET @QUERY = concat('Select CargoPac.NroCargo, sum(CargoPac.MontoCargo + (',tabla,')) as NuevosCargos from CargoPac group by CargoPac.NroCargo');
    PREPARE stmt from @query;
    EXECUTE stmt;
END
// 
DELIMITER ;
drop procedure NuevosCargos;
call NuevosCargos(6000);

DELIMITER //
CREATE PROCEDURE NuevoCargo(in NroCargo int(10), in tabla bigint) 
BEGIN 

	SET @QUERY = concat('UPDATE CargoPac CargoPac.NroCargo, sum(CargoPac.MontoCargo + (',tabla,')) as NuevosCargos from CargoPac where NroCargo = (',NroCargo,')'); # group by CargoPac.NroCargo
    PREPARE stmt from @query;
    EXECUTE stmt;
END
// 
DELIMITER ;
drop procedure NuevoCargo;
call NuevoCargo(1001,6000);