//comando para criar tabela
const criarTabelas = [
'''
 CREATE TABLE estado(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,sigla CHAR(2) NOT NULL
  )
''',
'''
 CREATE TABLE cidade(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,estado_id INTEGER NOT NULL
    ,FOREIGN KEY (estado_id) REFERENCES estado (id) 
  )
''',
'''
 CREATE TABLE grupo(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,descricao VARCHAR(200) NOT NULL
  )
''',
'''
 CREATE TABLE fornecedor(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,email VARCHAR(150) NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL 
    ,cidade_id INTEGER NOT NULL
    ,FOREIGN KEY (cidade_id) REFERENCES cidade (id)
  )
''',
'''
 CREATE TABLE grupo_fornecedor(
    grupo_id INTEGER NOT NULL 
    ,fornecedor_id INTEGER NOT NULL 
    ,PRIMARY KEY (grupo_id,fornecedor_id) 
    ,FOREIGN KEY (grupo_id) REFERENCES grupo (id)
    ,FOREIGN KEY (fornecedor_id) REFERENCES fornecedor (id)
  )
''',
'''
CREATE TABLE marca (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
  )
''',
'''
CREATE TABLE produto (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    preco TEXT NOT NULL
    ,marca_id INTEGER NOT NULL
    ,FOREIGN KEY (marca_id) REFERENCES marca (id)
  )
''',
];

//array de inserções
const insercoes = [
'''
INSERT INTO estado (nome, sigla)
VALUES ('PARANÁ','PR')
''',
'''
INSERT INTO estado (nome, sigla)
VALUES ('SÃO PAULO','SP')
''',
'''
INSERT INTO cidade (nome, estado_id)
VALUES ('PARANAVAÍ',1)
''',
'''
INSERT INTO cidade (nome, estado_id)
VALUES ('MARINGÁ',1)
''',
'''
INSERT INTO cidade (nome, estado_id)
VALUES ('BAURU',2)
''',
'''
INSERT INTO grupo (nome, descricao)
VALUES ('FUTEBOL','PELADA QUARTA')
''',
'''
INSERT INTO grupo (nome, descricao)
VALUES ('ESTUDOS MATEMÁTICA','ESTUDO QUINTA TRIGONOMETRIA')
''',
'''
INSERT INTO grupo (nome, descricao)
VALUES ('FACULDADE','PESSOAL FACULDADE')
''',
'''
INSERT INTO fornecedor (nome, telefone, email, url_avatar, cidade_id)
VALUES ('Pietro','(11) 9 9874-5656','pietro@email.com','https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png',1)
''',
'''
INSERT INTO fornecedor(nome, telefone, email, url_avatar, cidade_id)
VALUES ('Maitê','(11) 9 9632-8578', 'maite@email.com','https://cdn.pixabay.com/photo/2021/01/17/09/11/woman-5924366_960_720.jpg',2)
''',
'''
INSERT INTO fornecedor (nome, telefone, email, url_avatar, cidade_id)
VALUES ('Hortência','(11) 9 9562-3356','hortencia@email.com','https://cdn.pixabay.com/photo/2021/01/24/09/28/girl-5944691_960_720.jpg', 3)
''',
'''
INSERT INTO marca(nome) VALUES ('NIKE')
''',
'''
INSERT INTO marca(nome) VALUES ('ADIDAS')
''',
'''
INSERT INTO marca(nome) VALUES ('PUMA')
''',
'''
INSERT INTO produto(nome, preco, marca_id) VALUES ('AIR FORCE', '450,00', 1)
''',
'''
INSERT INTO produto(nome, preco, marca_id) VALUES ('STAN SMITH', '360,00', 2)
''',
'''
INSERT INTO produto(nome, preco, marca_id) VALUES ('CAVEN', '240,00', 3)
''',
];