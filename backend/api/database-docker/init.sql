CREATE DATABASE paciente_360;

CREATE TABLE endereco(
	id SERIAL PRIMARY KEY,
	rua VARCHAR(100) NOT NULL,
	numero VARCHAR(10) NOT NULL,
	bairro VARCHAR(20) NOT NULL,
	cidade VARCHAR(20) NOT NULL,
	estado VARCHAR(20) NOT NULL,
	cep bpchar(9) NOT NULL
);

CREATE TABLE hospital(
	id SERIAL PRIMARY KEY,
	cnes VARCHAR(7) UNIQUE,
	nome VARCHAR(100) NOT NULL,
	endereco_id INTEGER REFERENCES endereco(id)
);

CREATE TABLE especializacao(
	id SERIAL PRIMARY KEY,
	descricao VARCHAR(100) NOT NULL
);

CREATE TABLE medico(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	especializacao_id INTEGER REFERENCES especializacao(id)
);

CREATE TABLE paciente(
	id SERIAL PRIMARY KEY,
	cpf VARCHAR(11) NOT NULL,
	nome VARCHAR(100) NOT NULL,
	data_nascimento DATE NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	endereco_id INTEGER REFERENCES endereco(id)
);

CREATE TABLE consulta(
	id SERIAL PRIMARY KEY,
	data DATE NOT NULL,
	hora VARCHAR(8) NOT NULL,
	motivo VARCHAR(100) NOT NULL,
	diagnostico VARCHAR(200),
	prescicao VARCHAR(200),
	status BOOLEAN,
	observacao VARCHAR(200),
	id_medico INTEGER REFERENCES medico(id),
	id_paciente INTEGER REFERENCES paciente(id)
);