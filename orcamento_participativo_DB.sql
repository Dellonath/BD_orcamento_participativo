CREATE TABLE Usuario(
	id INT PRIMARY KEY,
	identidade VARCHAR(15) NOT NULL,
	cpf VARCHAR(15) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	telefone INT NOT NULL,
	email VARCHAR(25) NOT NULL,
	login VARCHAR(25) NOT NULL,
	senha VARCHAR(25) NOT NULL
)

CREATE TABLE Telefone(
	idUsuario INT PRIMARY KEY,
	telefone VARCHAR(15) NOT NULL,
	FOREIGN KEY (idUsuario) REFERENCES Usuario(id) ON DELETE CASCADE
)

CREATE TABLE Cidadao(
	idUsuario INT PRIMARY KEY,
	escolaridade VARCHAR(25) NOT NULL,
	profissao VARCHAR(25) NOT NULL,
	titulo_eleitor INT NOT NULL,
	idMunicipio INT NOT NULL,
	FOREIGN KEY (idUsuario) REFERENCES Usuario(id),
	FOREIGN KEY (idMunicipio) REFERENCES Municipio(id)
)

CREATE TABLE Gestor(
	idUsuario INT PRIMARY KEY,
	cargo VARCHAR(25) NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL CHECK(data_inicio < data_fim),
	idMunicipio INT NOT NULL,
	FOREIGN KEY (idUsuario) REFERENCES Usuario(id),
	FOREIGN KEY (idMunicipio) REFERENCES Municipio(id)
)

CREATE TABLE Projeto(
	id INT PRIMARY KEY,
	titulo VARCHAR(30) NOT NULL,
	descricao VARCHAR(300) NOT NULL,
	total_gasto INT,
	status INT NOT NULL CHECK(status = 0 OR status = 1 OR status = 2 OR status = 3) NOT NULL,
	idGestor INT NOT NULL,
	FOREIGN KEY (idGestor) REFERENCES Gestor(idUsuario)
)

CREATE TABLE Municipio(
	id INT PRIMARY KEY,
	nome VARCHAR(40) NOT NULL,
	sigla CHAR(3) NOT NULL,
	qtd_hab INT NOT NULL CHECK(qtd_hab >= 0)
)

CREATE TABLE Sugestao(
	id INT PRIMARY KEY,
	descricao VARCHAR(300) NOT NULL,
	tipo VARCHAR(30) NOT NULL,
	FOREIGN KEY (id) REFERENCES Usuario(id) ON DELETE CASCADE
)

CREATE TABLE Vota(
	idCidadao INT NOT NULL,
	idMunicipio INT NOT NULL,
	idProjeto INT NOT NULL,
	data DATE NOT NULL,
	PRIMARY KEY(idCidadao, idMunicipio, idProjeto)
)
