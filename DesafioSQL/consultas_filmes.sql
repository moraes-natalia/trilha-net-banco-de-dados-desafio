
/* 1. Selecionar nome e ano dos filmes */
SELECT Nome, Ano
FROM dbo.Filmes;

/* 2. Selecionar nome e ano dos filmes ordenados por ano */
SELECT Nome, Ano
FROM dbo.Filmes
ORDER BY Ano;

/* 3. Buscar filme específico por nome */
SELECT *
FROM dbo.Filmes
WHERE Nome = 'De Volta para o Futuro';

/* 4. Buscar filmes de um ano específico */
SELECT *
FROM dbo.Filmes
WHERE Ano = 1997;

/* 5. Buscar filmes posteriores ao ano 2000 */
SELECT *
FROM dbo.Filmes
WHERE Ano > 2000;

/* 6. Buscar filmes com duração entre 100 e 150 minutos */
SELECT *
FROM dbo.Filmes
WHERE Duracao > 100 AND Duracao < 150
ORDER BY Duracao;

/* 7. Contar quantidade de filmes por ano */
SELECT Ano, COUNT(*) AS quantidade
FROM dbo.Filmes
GROUP BY Ano
ORDER BY quantidade DESC;

/* 8. Buscar atores masculinos */
SELECT *
FROM Atores
WHERE Genero = 'M';

/* 9. Buscar atrizes ordenadas por nome */
SELECT *
FROM Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome;

/* 10. Listar filmes com seus gêneros */
SELECT
    f.Nome,
    g.Genero
FROM Filmes f
    INNER JOIN FilmesGenero fg ON f.Id = fg.IdFilme
    INNER JOIN Generos g ON fg.IdGenero = g.Id;

/* 11. Buscar filmes do gênero Mistério */
SELECT
    f.Nome,
    g.Genero
FROM Filmes f
    INNER JOIN FilmesGenero fg ON f.Id = fg.IdFilme
    INNER JOIN Generos g ON fg.IdGenero = g.Id
WHERE g.Genero = 'Mistério';

/* 12. Listar filmes com atores e seus papéis */
SELECT
    f.Nome AS Filme,
    a.PrimeiroNome,
    a.UltimoNome,
    ef.Papel
FROM Filmes f
    INNER JOIN ElencoFilme ef ON f.Id = ef.IdFilme
    INNER JOIN Atores a ON ef.IdAtor = a.Id;