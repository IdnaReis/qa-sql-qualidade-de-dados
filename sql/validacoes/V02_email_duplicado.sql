-- V02 | Unicidade | E-mails usados por mais de um cliente
SELECT LOWER(email) AS email, COUNT(*) AS qtd_clientes, GROUP_CONCAT(id) AS ids
FROM clientes
WHERE email IS NOT NULL
GROUP BY LOWER(email)
HAVING COUNT(*) > 1;
