-- No ecommerce, qual é o metodo de pagamento mais utilizado?
SELECT pedido.metodo_pagamento, COUNT(pedido.metodo_pagamento) AS quantidade
FROM pedido
GROUP BY pedido.metodo_pagamento
ORDER BY quantidade DESC
FETCH FIRST 1 ROWS ONLY;

-- Quais são os produtos mais vendidos?
SELECT produto.nome, SUM(inclui_prod.quantidade) as quantidade_total_vendida
FROM pedido
INNER JOIN inclui_prod on inclui_prod.fk_pedido_pedido_id = pedido.pedido_id
INNER JOIN produto on produto.produto_id = inclui_prod.fk_produto_produto_id
GROUP BY produto.nome
ORDER BY quantidade_total_vendida DESC
FETCH FIRST 7 ROWS ONLY;

-- Qual é o valor medio dos pedido?
SELECT ROUND(AVG(pedido.valor_total),2) AS ticket_medio
FROM pedido;

-- Qual é a disponibilidade atual de livros por genero?
SELECT livro.genero, COUNT(livro.genero) AS quantidade
FROM livro
WHERE livro.disponivel = true
GROUP BY livro.genero
ORDER BY quantidade DESC;

-- Qual é a distribuicao de alunos por ano escolar?
SELECT aluno.ano_escolar, COUNT(aluno.ano_escolar) AS quantidade
FROM aluno
GROUP BY aluno.ano_escolar
ORDER BY quantidade DESC;

