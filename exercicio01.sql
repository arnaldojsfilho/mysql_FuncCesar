create database cesardb;

use cesardb;   

create table Funcionarios(
	cpf integer not null,
    primeiroNomeFunc varchar(100) not null,
    inicialNomeDoMeioFunc varchar(100),
    ultimoNomeFunc varchar(100) not null,
    enderecoFunc varchar(100) not null,
    sexoFunc varchar(20) not null,
    salarioFunc double not null,
    codSupervisor integer not null,
    codDepartamento integer not null,
    codProjeto integer not null,
    codDependentes integer not null,
    primary key (cpf)
);

create table Departamentos(
	codDepartamento integer not null auto_increment,
    nomeDepartamento varchar(100) not null,
    localDepartamento varchar(100) not null,
    codGerente integer not null,
    dataDePosseGerencia date not null,
    codProjeto integer not null,
    primary key (codDepartamento)
);

create table Projetos(
	codProjeto integer not null auto_increment,
    nomeProjeto varchar(100) not null,
    localProjeto varchar(100) not null,
    contoleHoraFunc integer not null,
    primary key (codProjetos)
);

create table Supervisores(
	codSupervisor integer not null auto_increment,
    nomeSupervisor varchar(100) not null,
    primary key (codSupervisor)
);

create table GerenteDepartamento(
	codGerentes integer not null auto_increment,
    nomeGerente varchar(100) not null,
    dataDePosseGerencia date not null,
    codDepartamento integer not null,
    primary key (codGerentes)
);

create table Dependentes(
	codDependentes integer not null auto_increment,
    nomeDependentes varchar(100) not null,
    sexoDependente varchar(20) not null,
    dataNascimento date not null,
    grauParentesco varchar(20) not null,
    codFuncionario integer not null,
    primary key (codDependentes)
    );
    

ALTER TABLE Funcionarios ADD FOREIGN KEY (codSupervisor) REFERENCES Supervisores(codSupervisor);
ALTER TABLE Funcionarios ADD FOREIGN KEY (codDepartamento) REFERENCES Departamentos(codDepartamento);
ALTER TABLE Funcionarios ADD FOREIGN KEY (codProjeto) REFERENCES Projetos(codProjeto);
ALTER TABLE Funcionarios ADD FOREIGN KEY (codDependentes) REFERENCES Dependentes(codDependentes);
    
ALTER TABLE Departamentos ADD FOREIGN KEY (codProjeto) REFERENCES Projetos(codProjeto);

ALTER TABLE GerenteDepartamento ADD FOREIGN KEY (codDepartamento) REFERENCES Departamentos(codDepartamento);

ALTER TABLE Dependentes ADD FOREIGN KEY (codFuncionario) REFERENCES Funcionarios(cpf);

    
    
