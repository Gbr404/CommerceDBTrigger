/* Trigger que insere automaticamente a data e hora atual em data_cadastro sempre que um novo cliente for adicionado */

CREATE TABLE clientes (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50),
  data_cadastro timestamp
);

CREATE OR REPLACE FUNCTION clientes_time()
RETURNS TRIGGER AS $$
BEGIN
  NEW.data_cadastro = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_clientes_time
BEFORE INSERT ON clientes
FOR EACH ROW
EXECUTE FUNCTION clientes_time();

/* Trigger que, antes de atualizar o preço de um produto, registra o preço anterior em uma tabela data_registro */

CREATE TABLE Produtos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50),
  preco DECIMAL(5, 2)
);

CREATE TABLE historico_precos (
  id SERIAL PRIMARY KEY,
  produtos_id INT,
  preco_antigo DECIMAL(5, 2),
  data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE OR REPLACE FUNCTION atualiza_preco()
RETURNS TRIGGER AS $$
BEGIN 
  INSERT INTO historico_precos (produtos_id, preco_antigo)
  VALUES (OLD.id, OLD.preco);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_atualiza_preco
BEFORE UPDATE ON Produtos
FOR EACH ROW 
EXECUTE FUNCTION atualiza_preco();

/* Trigger que, ao excluir uma venda, adiciona um registro em uma tabela vendas_excluidas */

CREATE TABLE vendas (
  id SERIAL PRIMARY KEY,
  cliente_id INT,
  produto_id INT,
  qtd INT
);

CREATE TABLE vendas_excluidas (
  id SERIAL PRIMARY KEY,
  venda_id INT,
  data_exclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION regist_exclvend()
RETURNS TRIGGER AS $$
BEGIN 
  INSERT INTO vendas_excluidas (venda_id)
  VALUES (OLD.id);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;   

CREATE TRIGGER trigger_regist_exclvend
AFTER DELETE ON vendas
FOR EACH ROW 
EXECUTE FUNCTION regist_exclvend();
