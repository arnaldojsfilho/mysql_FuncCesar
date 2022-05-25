CREATE database cesardb;

USE cesardb;   

CREATE TABLE Funcionarios(
	
    cpf integer NOT NULL,
    primeiroNomeFunc VARCHAR(100) NOT NULL,
    inicialNomeDoMeioFunc VARCHAR(100),
    ultimoNomeFunc VARCHAR(100) NOT NULL,
    enderecoFunc VARCHAR(100) NOT NULL,
    sexoFunc VARCHAR(20) NOT NULL,
    salarioFunc DOUBLE NOT NULL,
    codSupervisor INTEGER NOT NULL,
    codDepartamento INTEGER NOT NULL,
    codProjeto INTEGER NOT NULL,
    codDependentes INTEGER NOT NULL,
    PRIMARY KEY (cpf)
	
);

CREATE TABLE Departamentos(
	
    codDepartamento INTEGER NOT NULL AUTO_INCREMENT,
    nomeDepartamento VARCHAR(100) NOT NULL,
    localDepartamento VARCHAR(100) NOT NULL,
    codGerente INTEGER NOT NULL,
    dataDePosseGerencia DATE NOT NULL,
    codProjeto INTEGER NOT NULL,
    PRIMARY KEY (codDepartamento)
	
);

CREATE TABLE Projetos(
	
    codProjeto INTEGER NOT NULL AUTO_INCREMENT,
    nomeProjeto VARCHAR(100) NOT NULL,
    localProjeto VARCHAR(100) NOT NULL,
    contoleHoraFunc INTEGER NOT NULL,
    PRIMARY KEY (codProjetos)
	
);

CREATE TABLE Supervisores(
	
    codSupervisor INTEGER NOT NULL AUTO_INCREMENT,
    nomeSupervisor VARCHAR(100) NOT NULL,
    PRIMARY KEY (codSupervisor)
	
);

CREATE TABLE GerenteDepartamento(
	
    codGerentes INTEGER NOT NULL AUTO_INCREMENT,
    nomeGerente VARCHAR(100) NOT NULL,
    dataDePosseGerencia DATE NOT NULL,
    codDepartamento INTEGER NOT NULL,
    PRIMARY KEY (codGerentes)
	
);

CREATE TABLE Dependentes(
	
    codDependentes INTEGER NOT NULL AUTO_INCREMENT,
    nomeDependentes VARCHAR(100) NOT NULL,
    sexoDependente VARCHAR(20) NOT NULL,
    dataNascimento DATE NOT NULL,
    grauParentesco VARCHAR(20) NOT NULL,
    codFuncionario INTEGER NOT NULL,
    PRIMARY KEY (codDependentes)
	
 );
    

ALTER TABLE Funcionarios ADD FOREIGN KEY (codSupervisor) REFERENCES Supervisores(codSupervisor);
ALTER TABLE Funcionarios ADD FOREIGN KEY (codDepartamento) REFERENCES Departamentos(codDepartamento);
ALTER TABLE Funcionarios ADD FOREIGN KEY (codProjeto) REFERENCES Projetos(codProjeto);
ALTER TABLE Funcionarios ADD FOREIGN KEY (codDependentes) REFERENCES Dependentes(codDependentes);
    
ALTER TABLE Departamentos ADD FOREIGN KEY (codProjeto) REFERENCES Projetos(codProjeto);

ALTER TABLE GerenteDepartamento ADD FOREIGN KEY (codDepartamento) REFERENCES Departamentos(codDepartamento);

ALTER TABLE Dependentes ADD FOREIGN KEY (codFuncionario) REFERENCES Funcionarios(cpf);

    
    
