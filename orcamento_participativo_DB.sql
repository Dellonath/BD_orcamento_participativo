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
	idUsuario INT,
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
	idUsuario INT,
	descricao VARCHAR(300) NOT NULL,
	tipo VARCHAR(30) NOT NULL,
	FOREIGN KEY (idUsuario) REFERENCES Usuario(id) ON DELETE CASCADE
)

CREATE TABLE Vota(
	idCidadao INT NOT NULL,
	idMunicipio INT NOT NULL,
	idProjeto INT NOT NULL,
	data DATE NOT NULL,
	PRIMARY KEY(idCidadao, idMunicipio, idProjeto)
)

INSERT INTO Usuario VALUES (1, 'MG-21402938', '132945829-33', 'Carlos Neves Andrade', 91654834, 'carlos_neves@gmail.com', 'carlitos', 'pD9NOTioLY'), 
						   (2, 'MG-21108594', '132099942-34', 'Sofia Aparecida Menes', 84351726, 'sofia2008@gmail.com', 'sofiaAPMES', 'JJkoL412XE'), 
						   (3, 'MG-43128374', '089410333-33', 'Maria Moasquen Virchout', 99432211, 'MMoasquen@gmail.com', 'maria.moasquenV', 'KLOpp9NOT')					   
INSERT INTO Telefone VALUES (1, 35991554433), (2, 31991435848), (2, 31849781501)
INSERT INTO Municipio VALUES (41247, 'Maria da Fé', 'MDF', 14646), (17462, 'São José dos Campos', 'SJC', 533501)
INSERT INTO Cidadao VALUES (1, 'Ensino Superior Completo', 'Programador', 142341254, 41247), 
						   (3, 'Ensino Superior Completo', 'Engenheira Civil', 321639475, 41247)	   
INSERT INTO Gestor VALUES (2, 'Administradora', '2000-01-12', '2004-01-12', 41247)
INSERT INTO Projeto VALUES (223, 'Asfaltar BR223', 'Asfaltar a BR223 perto da Vila Marta', 15000000, 0, 2),
                           (245, 'Parque Azul Azulado', 'Criação do parque aquático Azul Azulado', 30000000, 1, 2)
INSERT INTO Sugestao VALUES (1, 'Criar um evento sobre artesanato', 'Evento festivo'),
                            (3, 'Criar uma quadra esportiva no bairro da Lage', 'Lazer')
INSERT INTO Vota VALUES (1, 41247, 223, '2002-04-23'), (2, 41247, 223, '2002-04-23')



