-- V03 | Validade | E-mails sem "@" ou sem domínio com ponto
SELECT id, nome, email
FROM clientes
WHERE email IS NOT NULL
  AND (email NOT LIKE '%_@_%' OR SUBSTR(email, INSTR(email, '@')) NOT LIKE '%._%');
