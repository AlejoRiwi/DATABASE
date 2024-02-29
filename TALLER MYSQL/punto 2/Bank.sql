create database Bank;
use Bank;

create table bancos (
	codigo_nombre varchar (50) primary key,
    fecha_fund date not null
);

create table sucursales (
	id_codigo int primary key,
    ubicacion varchar (50) not null,
    ciudad varchar (50) not null,
    telefono varchar (25) not null
);

create table empleados (
	id_codigo int primary key,
    nombre varchar (50) not null,
    fecha_nac date not null,
    genero varchar (10) check(genero in ("F", "M", "Otro")),
    telefono  varchar (25) not null,
    salario  decimal(8,2) not null,
    nro_hijos int not null
);

create table cargo (
    codigo int primary key,
    nombre  varchar (30) not null,
    descripcion varchar (60) not null
);