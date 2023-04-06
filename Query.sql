-- 1) Analisando o preço médio do aluguel de filmes por gênero

USE hashtagmovie
SELECT
	genero,
	ROUND(AVG(preco_aluguel), 2) AS preco_medio,
	COUNT (*) AS total
FROM filmes
GROUP BY genero
ORDER BY total DESC;


-- 2) Analisando o preço médio do aluguel de filmes por gênero lançados no ano de 2011

USE hashtagmovie
SELECT
	genero,
	ROUND(AVG(preco_aluguel), 2) AS preco_medio,
	COUNT (*) AS total
FROM filmes
WHERE ano_lancamento = 2011
GROUP BY genero
ORDER BY total DESC;


-- 3) Analisando o desempenho dos alugueis identificando quais filmes tiveram uma nota acima da média

USE hashtagmovie
SELECT 
	*
FROM alugueis
WHERE nota >= (SELECT AVG(nota) FROM alugueis);


-- 4) Criando Views para guardar os resultados
CREATE VIEW resultado AS
	SELECT
		genero,
		ROUND(AVG(preco_aluguel), 2) AS preco_medio,
		COUNT (*) AS total
	FROM filmes
	GROUP BY genero;


CREATE VIEW resultado2 AS
	SELECT
		genero,
		ROUND(AVG(preco_aluguel), 2) AS preco_medio,
		COUNT (*) AS total
	FROM filmes
	WHERE ano_lancamento = 2011
	GROUP BY genero;


CREATE VIEW resultado3 AS
	SELECT 
		*
	FROM alugueis
	WHERE nota >= (SELECT AVG(nota) FROM alugueis);