create database dbAmbulatorios;
use dbAmbulatorios;

create table ambulatorios
(num_ambulatorio int primary key,
andar int not null,
capacidade int not null);

create table medicos 
(crm int primary key,
nome varchar(50) not null,
idade int not null,
especialidade varchar(50),
rg int not null,
cidade varchar(50) not null,
num_ambulatorio int not null,
foreign key(num_ambulatorio)
references ambulatorios(num_ambulatorio));

create table pacientes
(codp int primary key auto_increment,
nome varchar(50) not null,
idade int not null,
cidade varchar(50) not null,
rg int not null,
doenca varchar(50) not null);

create table consultas
(codconsulta int primary key auto_increment,
data_consulta date not null,
hora_consulta time not null,
codp int not null,
foreign key(codp) 
references pacientes(codp),
crm int not null,
foreign key(crm)
references medicos(crm));

use dbAmbulatorios;
insert into ambulatorios(num_ambulatorio, andar, capacidade)
values (1,1,40);

insert into ambulatorios
values(2,1,20);

insert into ambulatorios
values(3,1,15);

insert into ambulatorios
values(4,2,40);

insert into ambulatorios
values(5,2,10);

insert into ambulatorios
values(6,3,10);

insert into ambulatorios
values(7,3,10);

insert into ambulatorios
values(8,3,15);

insert into medicos(crm, nome, idade, especialidade, rg, cidade, num_ambulatorio)
values(1000, 'Carlos', 40, 'ortopedia', 8000, 'Salvador', 1);

insert into medicos
values(1001, 'Paula', 25, 'ortopedia', 8020, 'Salvador', 1);

insert into medicos
values(1021, 'João', 35, 'ginecologista', 4020, 'StoAmaro', 2);

insert into medicos
values(4021, 'Maria', 62, 'pediatra', 5020, 'Valença', 3);

insert into medicos
values(4321, 'Mauro', 45, 'obstetra', 2090, 'Valença', 3);

insert into medicos
values(96651, 'Jonas', 32, 'clínico', 3090, 'Feira', 5);

insert into medicos
values(99321, 'Numeriana', 28, 'obstetra', 3090, 'Salvador', 3);

insert into medicos
values(99551, 'Paula', 32, 'clínico', 1090, 'StoAmaro', 4);

insert into pacientes (codp, nome, idade, cidade, rg, doenca)
values(1, 'Carla', 23, 'Cachoeira', 124457, 'gripe');

insert into pacientes
values(2,'Givanildo', 58, 'Cachoeira', 434457, 'gripe');

insert into pacientes
values(3, 'Givanilda', 82, 'Salvador', 25457, 'tosse');

insert into pacientes
values(4, 'Andreia', 28, 'Salvador', 12457, 'arritmia');

insert into pacientes
values(5, 'Pedro', 28, 'Salvador', 12957, 'fratura');

insert into pacientes
values(6, 'Ana', 45, 'StoAmaro', 83977, 'fratura');

insert into pacientes
values(7, 'Roberto', 15, 'Conde', 67821, 'luxação');

insert into pacientes
values(8, 'Marcos', 10, 'Conde', 98721, 'luxação');

insert into consultas(codconsulta, data_consulta, hora_consulta, codp, crm)
values(1, '2000-12-11', '12:30:00', 1, 99551);

use dbAmbulatorios;
insert into consultas(codconsulta, data_consulta, hora_consulta, codp, crm)
values(3, '2000-12-11', '12:30:00', 2, 99551);

insert into consultas
values(4, '2000-08-11', '10:00:00', 3, 99551);

insert into consultas
values(5, '2009-10-21', '10:00:00', 3, 99551);

insert into consultas
values(6, '2009-11-12', '10:00:00', 4, 1001);

insert into consultas
values(7, '2009-11-14', '09:00:00', 5, 1001);

insert into consultas
values(8, '2009-11-15', '14:30:00', 6, 1000);

insert into consultas
values(9, '2009-11-12', '17:30:00', 7, 1000);

insert into consultas
values(10, '2009-10-20', '22:30:30', 8, 4021);

insert into consultas
values(11, '2009-11-05', '13:30:00', 8, 4021);

use dbAmbulatorios;

select *
from ambulatorios;

select ambulatorios.num_ambulatorio, ambulatorios.andar
from ambulatorios;

select medicos.nome
from medicos
where especialidade = 'ortopedia';

select pacientes.nome, pacientes.idade
from pacientes
where cidade = 'Salvador';

select medicos.nome, medicos.idade
from medicos
where cidade = 'Valença' and especialidade = 'pediatra';

select consultas.crm
from consultas
where data_consulta = '2009-11-12' and hora_consulta > '12:00:00';

select pacientes.nome, pacientes.idade
from pacientes
where doenca = 'fratura' and (cidade = 'StoAmaro' or cidade = 'Salvador');

select medicos.nome
from medicos
where especialidade = 'obstetra' and idade < 30;

select medicos.nome, medicos.especialidade
from medicos;

update medicos
set idade = idade + 1
where crm = 99321;

update ambulatorios
set capacidade = capacidade + 5
where num_ambulatorio = 2;

SET SQL_SAFE_UPDATES = 0;
SET foreign_key_checks = 0;
delete from medicos
where idade > 40;
SET foreign_key_checks = 1;

use dbAmbulatorios;
set SQL_SAFE_UPDATES = 1;









