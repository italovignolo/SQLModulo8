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

LOAD DATA CONCURRENT LOCAL INFILE '/Users/italo/Desktop/Bibliografía java/SQL/empresa.csv'
 INTO TABLE Empresa
 FIELDS TERMINATED BY ';' 
 LINES TERMINATED BY '\n';
 
 alter table Convenio drop foreign key relacion_convenio_empresa; /* eliminar llave foránea*/
 
 alter table Empresa Modify RutEmp bigint not null;
 Alter table Convenio modify RutEmp bigint not null;
 
 LOAD DATA CONCURRENT LOCAL INFILE 'C:/Users/Insuco/Desktop/convenio.csv'
 INTO TABLE Convenio
 FIELDS TERMINATED BY ';' 
 LINES TERMINATED BY '\n';
 
delete from Cliente where rutcli > 0; 
