-- V04 | Validade | UF fora da lista oficial (considera maiúsculas)
SELECT id, nome, uf
FROM clientes
WHERE uf NOT IN ('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA',
                 'PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO')
   OR uf IS NULL;
