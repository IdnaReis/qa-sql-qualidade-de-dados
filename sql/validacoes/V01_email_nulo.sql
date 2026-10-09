-- V01 | Completude | Clientes sem e-mail
SELECT id, nome
FROM clientes
WHERE email IS NULL OR TRIM(email) = '';
