use comercio;
 show tables;
 
 desc cliente;
 desc endereco;
 desc telefone;
 
 alter table cliente change idcliente id bigint primary key auto_increment;
 
 SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, 
	   E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, 
	   T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;
desc telefone;

SELECT * FROM CLIENTE C INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO='F' AND E.BAIRRO='Centro'
  AND E.CIDADE='Rio de Janeiro'
  AND T.TIPO IN('Res', 'Com');
  
 SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, 
	   E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, 
	   T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON c.IDCLIENTE = e.id_cliente
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE E.BAIRRO='Centro' 
AND 
E.CIDADE='Rio de Janeiro'
AND
C.SEXO='F' 
AND NOT T.TIPO ='cel';


select sum(estado)as 'Qtd de Estado' from v_relatorio;