CREATE DATABASE unidades_residenciales;

use unidades_residenciales;

create table conjunto (
	nit_conjunto varchar (11) not null PRIMARY KEY,
    nombre varchar (30) not null,
    estrato int not null
);

alter table conjunto
modify column nombre varchar (30) not null check(nombre not in("Santana", "Altos", "Montes")); -- Me valida que el nombre no sea ninguno de esos agregados anteriormente

create table vigilantes (
	ced_vigilante varchar (10) primary key,
    nombre varchar (30) not null,
    fecha_nacimiento date,
    genero varchar (15) check (genero in("M", "F", "Otro")) -- Validamos que solo se puedan usar las letras M, F, Otro --
);

create table edificios (
	id_edificio int auto_increment primary key,
    nro_pisos int check(nro_pisos between 5 and 8), -- Validamos que el numero de pisos este entre 5 y 8 --
    ubicacion varchar (40) 
);

-- Vamos a adicionar las llaves foraneas a las tablas
-- primero se crea el campo que va a contener esa llave foranea
alter table edificios
add column id_conjunto varchar (11);

-- segundo creamos la llave foranea usando el add constraint
alter table edificios
add constraint fk_id_conjunto foreign key (id_conjunto) references conjunto(nit_conjunto);


-- Creamos la tabla que nos va a relacionar Edificios con Vigilantes para la relacion muchos a muchos
create table novedades (
	id int auto_increment primary key,
    id_edificio int,
    id_vigilante varchar (10),
    constraint fk_id_edificio foreign key (id_edificio) references edificios(id_edificio),
    constraint fk_id_vigilante foreign key (id_vigilante) references vigilantes(ced_vigilante)
);


-- por ultimo creamos la ultima tabla que nos hace falta  Apartamento
create table apartamentos (
	num_apto int primary key,
    piso int not null,
    valor int check(valor between 10000 and 100000),
    id_edificio int,
    constraint fk_id_edificios foreign key (id_edificio) references edificios(id_edificio)
);

alter table edificios
add column sector varchar (30) check(sector in ("piscina", "alameda", "cancha"));


-- Procedemos a insertar datos en las tablas ->
insert into conjunto
value ("12345", "Mira Flores", 3), ("54321", "Valle de Rosas", 5);
select * from conjunto;

insert into edificios (nro_pisos,sector) value(7, "piscina");
select * from edificios;

insert into vigilantes value("123456789", "Federik", "1995-05-10", "M");
select * from vigilantes