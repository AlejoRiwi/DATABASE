create database banks;
use banks;

 create database Bank;
use Bank;

create table bancos (
	codigo numeric(10) primary key,
    nombre varchar(30) primary key,
    fecha_fund date not null
);

create table sucursales (
	id_codigo int primary key,
    ubicacion varchar (35) not null,
    ciudad varchar (35) not null,
    telefono varchar (25) not null
);

create table empleados (
	id_codigo int primary key,
    nombre varchar (35) not null,
    fecha_nac date not null,
    genero varchar (10) not null,
    telefono  varchar (25) not null,
    salario  numeric(8,2) not null,
    nro_hijos int not null
);

create table cargo (
    codigo int primary key,
    nombre  varchar (35) unique not null,
    descripcion varchar (60) not null
);

create table cajer_autom(
	numero int primary key,
    ubicacion varchar (35) not null,
    deposito varchar (40) not null
);

create table clientes (
	nro_cuenta int primary key,
    nombre varchar (35) not null, 
    telefono varchar(25) not null,
    direccion varchar (25) not null,
    genero varchar(10) not null,
    saldo int not null
);

create table vigilantes (
	nombre varchar (35),
    nro_cedula int primary key,
    telefono varchar(25) not null,
    genero varchar(10) not null,
    salario numeric(8,2) not null
);

-- Creacion de tablas para relaciones ->

create table vigila (
	fecha date not null, 
    novedades varchar (200) not null
);
