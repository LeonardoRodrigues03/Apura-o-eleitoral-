create database partidopolitico;
use partidopolitico;

CREATE TABLE Partido (
    Numero INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);


CREATE TABLE Candidato (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Idade INT NOT NULL,
    Partido_Numero INT,
    FOREIGN KEY (Partido_Numero) REFERENCES Partido(Numero)
);


CREATE TABLE Localidade (
    ID_localidade INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(200) NOT NULL
);


CREATE TABLE ZonaEleitoral (
    ID_zonaE INT PRIMARY KEY,
    Numero INT NOT NULL
);


CREATE TABLE Secao (
    ID_secao INT PRIMARY KEY,
    Numero INT NOT NULL,
    ZonaEleitoral_ID INT NOT NULL,
    FOREIGN KEY (ZonaEleitoral_ID) REFERENCES ZonaEleitoral(ID_zonaE)
);


CREATE TABLE Eleitor (
    CPF VARCHAR(14) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Idade INT NOT NULL,
    Telefone VARCHAR(20),
    ID_localidade INT NOT NULL,
    ID_zonaE INT NOT NULL,
    ID_secao INT NOT NULL,
    FOREIGN KEY (ID_localidade) REFERENCES Localidade(ID_localidade),
    FOREIGN KEY (ID_zonaE) REFERENCES ZonaEleitoral(ID_zonaE),
    FOREIGN KEY (ID_secao) REFERENCES Secao(ID_secao)
);