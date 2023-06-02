//comando para criar tabela
const criarCartao = '''
 CREATE TABLE cartao(
    id INTEGER NOT NULL PRIMARY KEY
    ,nomeNocartao VARCHAR(200) NOT NULL
    ,numeroDoCartao VARCHAR(200) NOT NULL
    ,cvc VARCHAR(150) NOT NULL
    ,dataValidade VARCHAR(300) NOT NULL 
  )
''';
//array de inserções
const insercoesCartao = [
  '''
INSERT INTO cartao (nomeNocartao, numeroDoCartao, cvc, dataValidade)
VALUES ('Joile O A Junior','1111 1111 1111 1111','010','12/30')
'''
];


