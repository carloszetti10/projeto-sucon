
create dataBase ProjetoSucon;

create table Equipamento(
	idEquipamento SERIAL PRIMARY KEY,
	nomeEquipamento varchar(50) unique not null not null,
	quantidade int not null,
    quantidadeDisponivel int not null,
    comEmprestimo boolean
);

create table Pessoa(
	idPessoa SERIAL PRIMARY KEY,
	nomePessoa varchar(50) unique not null,
	setorPessoa varchar(50),
	numeroPessoa varchar(11)
);

CREATE TABLE Retirada (
    idRetirada SERIAL PRIMARY KEY,
    idPessoa INT REFERENCES Pessoa(idPessoa),
    idEquipamento INT REFERENCES Equipamento(idEquipamento),
    diaRetirada text NOT NULL,
    quantEquipamento INT NOT NULL,
    entregue BOOLEAN
);

create table RetiradaSemDevolucao(
    idEntrega SERIAL PRIMARY KEY,
    idPessoa INT REFERENCES Pessoa(idPessoa),
    idEquipamento INT REFERENCES Equipamento(idEquipamento),
    diaRetirada text NOT NULL,
    quantEquipamento INT NOT NULL
);


CREATE VIEW RetiradaDetalhes AS
SELECT 
    r.idRetirada,
    p.nomePessoa,
    e.nomeEquipamento,
    r.quantEquipamento,
    r.diaRetirada,
    r.entregue
FROM 
    Retirada r
JOIN 
    Pessoa p ON r.idPessoa = p.idPessoa
JOIN 
    Equipamento e ON r.idEquipamento = e.idEquipamento;



CREATE VIEW RetiradaSemDevDetalhes AS
SELECT 
    r. idEntrega,
    p.nomePessoa,
    e.nomeEquipamento,
    r.quantEquipamento,
    r.diaRetirada
FROM 
    RetiradaSemDevolucao r
JOIN 
    Pessoa p ON r.idPessoa = p.idPessoa
JOIN 
    Equipamento e ON r.idEquipamento = e.idEquipamento;