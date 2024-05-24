-- ex1

SELECT 
    pedido.id_pedido,
    contatos.nome AS nome_cliente,
    contatos.email AS email_cliente,
    contatos.cel AS celular_cliente,
    pedido.data_pedido
FROM 
    pedido
INNER JOIN 
    contatos ON pedido.id_contato = contatos.id_contato;

-- ex2

SELECT 
    pedido.id_pedido,
    pizzas.nome AS nome_pizza,
    pizzas.preco AS preco_pizza,
    pizzas.ingredientes
FROM 
    pedido
INNER JOIN 
    pizzas ON pedido.id_pizza = pizzas.id_pizza;

-- ex3

SELECT 
    funcionarios.id_funcionario,
    funcionarios.nome AS nome_funcionario,
    atribuicoes.area_trabalho
FROM 
    funcionarios
INNER JOIN 
    atribuicoes ON funcionarios.id_atribuicao = atribuicoes.id_atribuicao;


--ex4

SELECT 
    pedido.id_pedido,
    status_pizzas.status_producao,
    status_pizzas.status_entrega,
    funcionarios.nome AS nome_funcionario
FROM 
    pedido
LEFT JOIN 
    status_pizzas ON pedido.id_status = status_pizzas.id_status
LEFT JOIN 
    funcionarios ON pedido.id_funcionario = funcionarios.id_funcionario;

--ex5

SELECT 
    contatos.nome AS nome_cliente,
    pedido.id_pedido,
    pedido.data_pedido
FROM 
    contatos
INNER JOIN 
    pedido ON contatos.id_contato = pedido.id_contato;


--ex6

SELECT 
    nome,
    ingredientes
FROM 
    pizzas;

--ex7

SELECT 
    pedido.id_pedido,
    entregas.NOME AS nome_cliente,
    entregas.EMAIL AS email_cliente,
    entregas.CEL AS celular_cliente,
    entregas.PIZZA AS pizza,
    pedido.data_pedido,
    entregas.SITUACAO AS situacao_entrega
FROM 
    pedido
INNER JOIN 
    entregas ON pedido.id_entregas = entregas.ID_ENTREGAS;

--ex8

SELECT 
    f1.nome AS nome_funcionario,
    f2.nome AS nome_supervisor
FROM 
    funcionarios AS f1
LEFT JOIN 
    funcionarios AS f2 ON f1.id_supervisor = f2.id_funcionario;

--ex9

SELECT 
    pedido.id_pedido,
    pizzas.nome AS nome_pizza,
    pizzas.tamanho
FROM 
    pedido
INNER JOIN 
    pizzas ON pedido.id_pizza = pizzas.id_pizza;

--ex10

SELECT 
    pizzas.nome AS nome_pizza,
    pizzas.preco,
    promocoes.promocao
FROM 
    pizzas
LEFT JOIN 
    promocoes ON pizzas.id_pizza = promocoes.id_pizza;
    