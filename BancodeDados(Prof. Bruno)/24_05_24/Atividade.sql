Essas consultas devem ser realizadas utilizando INNER JOIN, JOIN, LEFT JOIN e
RIGHT JOIN para mostrar diferentes tipos de relacionamentos entre tabelas em uma
pizzaria.

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
    atribuicoes AS atribuicao,
    areas_trabalho AS area_trabalho
FROM 
    funcionarios


--ex4

SELECT 
    pedido.id_pedido,
    pedido.data_pedido,
    status_pizzas.status_producao,
    status_pizzas.status_entrega
FROM 
    pedido
JOIN 
    status_pizzas ON pedido.id_pedido = status_pizzas.id_pedido;


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
    pedido.data_pedido,
    entregas.nome AS nome_entrega,
    entregas.email AS email_entrega,
    entregas.cel AS celular_entrega,
    entregas.pizza AS pizza_entrega,
    entregas.cadastro AS data_entrega,
    entregas.situacao AS situacao_entrega
FROM 
    pedido
JOIN 
    entregas ON pedido.id_entrega = entregas.id_entrega;

--ex8

SELECT 
    f1.nome AS funcionario,
    f2.nome AS supervisor
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


Segunda Parte (Consultas com comandos SQL básicos)

--ex