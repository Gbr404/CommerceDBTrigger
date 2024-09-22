INSERT INTO clientes (id, nome)
VALUES (21, 'James Carter');

INSERT INTO Produtos (id, nome, preco)
VALUES (34, 'Fone Bluetooth', '89.99');

INSERT INTO clientes (id, nome)
VALUES (22, 'Bruno Bianchi');

INSERT INTO vendas (id, cliente_id, produto_id, qtd)
VALUES (44, 21, 34, 12);

/*Comandos de verificação e atualização*/

SELECT * FROM clientes;
SELECT * FROM Produtos;

UPDATE Produtos SET preco = '189.99' 
WHERE id = 34;

SELECT * FROM historico_precos;

SELECT * FROM vendas;

DELETE FROM vendas WHERE id = 44;

SELECT * FROM vendas_excluidas;
