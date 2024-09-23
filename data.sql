/* Inserções de dados */
INSERT INTO clientes (id, nome)
VALUES (21, 'James Carter');

INSERT INTO Produtos (id, nome, preco)
VALUES (34, 'Fone Bluetooth', '89.99');

INSERT INTO clientes (id, nome)
VALUES (22, 'Bruno Bianchi');

INSERT INTO vendas (id, cliente_id, produto_id, qtd)
VALUES (44, 21, 34, 12);

/* Novos insert */
INSERT INTO clientes (nome, data_cadastro) VALUES ('Breno Barella', CURRENT_TIMESTAMP);
INSERT INTO vendas (id, cliente_id, produto_id, qtd) VALUES (56, 22, 34, 50);
INSERT INTO vendas (id, cliente_id, produto_id, qtd) VALUES (57, 21, 34, 10);
INSERT INTO estoque (id, produto_id, quantidade) VALUES (99, 34, 200);

/* Comandos de verificação e atualização */
SELECT * FROM clientes;
SELECT * FROM Produtos;

UPDATE Produtos SET preco = '189.99' 
WHERE id = 34;

SELECT * FROM historico_precos;
SELECT * FROM vendas;

DELETE FROM vendas WHERE id = 44;

SELECT * FROM vendas_excluidas;

/* Consultas adicionais */
SELECT * FROM historico_nomes;
SELECT * FROM estoque;
