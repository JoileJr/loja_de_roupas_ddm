const criarTabelas = ['''
  CREATE TABLE cartao(
    id INTEGER NOT NULL PRIMARY KEY
    ,nomeNocartao VARCHAR(200) NOT NULL
    ,numeroDoCartao VARCHAR(200) NOT NULL
    ,cvc VARCHAR(150) NOT NULL
    ,dataValidade VARCHAR(300) NOT NULL 
  )
  ''',
  '''
  CREATE TABLE marca(
      id INTEGER NOT NULL PRIMARY KEY
      ,nome VARCHAR(200) NOT NULL
    )
  ''',
  '''
  CREATE TABLE produto(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,preco VARCHAR(200) NOT NULL
    ,quantidade VARCHAR(200) NOT NULL
    ,marca_id INTEGER NOT NULL
    ,FOREIGN KEY (marca_id) REFERENCES marca (id) 
  )
  ''',
];

//array de inserções

const insercoes = [
'''
INSERT INTO cartao (nomeNocartao, numeroDoCartao, cvc, dataValidade)
VALUES ('Joile O A Junior','1111 1111 1111 1111','010','12/30')
''',
'''
INSERT INTO marca (nome) VALUES ('NIKE')
''',
'''
INSERT INTO produto (nome, preco, quantidade, marca_id)
VALUES ('One force','70.00','10', 1)
'''
];


