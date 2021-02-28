drop database if exists colegio;
create database colegio;
use colegio;

create table cursos(
    id int auto_increment primary key,
    titulo varchar(25) not null,
    profesor varchar(25),
    dia enum('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES'),
    turno enum('MAÑANA','TARDE','NOCHE')
);

create table alumnos(
    id int auto_increment primary key,
    nombre varchar(25) not null,
    apellido varchar(25) not null,
    edad int,
    idCurso int not null
);

create table profesores(
    id int auto_increment primary key,
    nombre varchar(25) not null,
    apellido varchar(25) not null
);

alter table alumnos
    add constraint FK_alumnos_idCurso
    foreign key(idCurso)
    references cursos(id);

select * from cursos;