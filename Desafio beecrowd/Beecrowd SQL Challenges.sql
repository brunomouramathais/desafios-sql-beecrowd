-- Problema 1036 - Fórmula de Bhaskara
#include <stdio.h>
#include <math.h>

int main(){
    double a, b, c, delta, R1, R2;

    scanf("%lf %lf %lf", &a, &b, &c);

    delta = b * b - 4 * a * c;

    if(a != 0 && delta > -1){
        R1 = (- b + sqrt(delta))/(2 * a);
        R2 = (- b - sqrt(delta))/(2 * a);
        
        printf("R1 = %.5lf\nR2 = %.5lf\n", R1, R2);
    }else{
        printf("Impossivel calcular\n");
    }

    return 0;
}

------------------------------------------------------

-- Problema 1037 - Intervalo
#include <stdio.h>

int main(){
    double numero;

    scanf("%lf", &numero);

    if(0 <= numero && numero <= 25){
        printf("Intervalo [0,25]\n");
    }else if(25 < numero && numero <= 50){
        printf("Intervalo (25,50]\n");
    }else if(50 < numero && numero <= 75){
        printf("Intervalo (50,75]\n");
    }else if(75 < numero && numero <= 100){
        printf("Intervalo (75,100]\n");
    }else{
        printf("Fora de intervalo\n");
    }

    return 0;
}

------------------------------------------------------

-- Problema 1038 - Lanche
#include <stdio.h>

int main(){
    double total;
    int codigo, quantidade;

    scanf("%d %d", &codigo, &quantidade);

    switch(codigo){
        case 1: total = quantidade * 4.00;
                break;
        case 2: total = quantidade * 4.50;
                break;
        case 3: total = quantidade * 5.00;
                break;
        case 4: total = quantidade * 2.00;
                break;
        case 5: total = quantidade * 1.50;
                break;
    }

    printf("Total: R$ %.2lf\n", total);

    return 0;
}

------------------------------------------------------

-- Problema 1040 - Média 3
#include <stdio.h>

int main(){
    double nota[4], exame, media;

    for(int i = 0; i < 4; ++i){
        scanf("%lf", &nota[i]);
    }

    media = (2 * nota[0] + 3 * nota[1] + 4 * nota[2] + 1 * nota[3])/10.0;
    printf("Media: %.1lf\n", media);

    if(media >= 7.0){
        printf("Aluno aprovado.\n");
    }else if(media < 5.0){
        printf("Aluno reprovado.\n");
    }else{
        printf("Aluno em exame.\n");

        scanf("%lf", &exame);
        printf("Nota do exame: %.1lf\n", exame);
        
        media = (media + exame)/2.0;
        
        if(media >= 5.0)    printf("Aluno aprovado.\n");
        else                printf("Aluno reprovado.\n");

        printf("Media final: %.1lf\n", media);
    }

    return 0;
}

------------------------------------------------------

-- Problema 1041 - Coordenadas de um Ponto
#include <stdio.h>

int main(){
    double x, y;

    scanf("%lf %lf", &x, &y);

    if(x > 0.0){
        if(y > 0.0)         printf("Q1\n");
        else if(y < 0.0)    printf("Q4\n");
        else                printf("Eixo X\n");
    }else if(x < 0.0){
        if(y > 0.0)         printf("Q2\n");
        else if(y < 0.0)    printf("Q3\n");
        else                printf("Eixo X\n");
    }else{
        if(y > 0.0)         printf("Eixo Y\n");
        else if(y < 0.0)    printf("Eixo Y\n");
        else                printf("Origem\n");
    }

    return 0;
}

------------------------------------------------------

-- Problema 1042 - Sort Simples
#include <stdlib.h>
#include <stdio.h>

int comp(const void* a, const void* b){
    return *(int*)a - *(int*)b;
}

int main(){
    int v[3], V[3];

    for(int i = 0; i < 3; ++i){
        scanf("%d", &V[i]);
        v[i] = V[i];
    }

    qsort(v, 3, sizeof(int), comp);

    for(int i = 0; i < 3; ++i){
        printf("%d\n", v[i]);
    }
    printf("\n");
    for(int i = 0; i < 3; ++i){
        printf("%d\n", V[i]);
    }

    return 0;
}

------------------------------------------------------

-- Problema 1043 - Triângulo
#include <stdlib.h>
#include <stdio.h>

int main(){
    double A, B, C;

    scanf("%lf %lf %lf", &A, &B, &C);

    if(A < B + C && B < A + C && C < A + B){
        printf("Perimetro = %.1lf\n", A + B + C);
    }else{
        printf("Area = %.1lf\n", (A + B)/2 * C);
    }

    return 0;
}

------------------------------------------------------

-- Problema 2602 - Select Básico
SELECT name
FROM customers
WHERE state = 'RS';

------------------------------------------------------

-- Problema 2603 - Endereço dos Clientes
SELECT name, street
FROM customers
WHERE city = 'Porto Alegre';

------------------------------------------------------

-- Problema 2604 - Menores que 10 ou Maiores que 100
SELECT id, name
FROM products
WHERE price < 10 OR price > 100;

------------------------------------------------------

-- Problema 2605 - Representantes Executivos
SELECT products.name, providers.name
FROM products
INNER JOIN providers ON providers.id = products.id_providers
WHERE products.id_categories = 6;

------------------------------------------------------

-- Problema 2606 - Categorias
SELECT products.id, products.name
FROM products
INNER JOIN categories ON categories.id = products.id_categories
WHERE LEFT(categories.name, 5) = 'super';

------------------------------------------------------

-- Problema 2607 - Cidades em Ordem Alfabética
SELECT providers.city
FROM providers   
ORDER BY providers.city asc;

------------------------------------------------------

-- Problema 2608 - Maior e Menor Preço
SELECT MAX(products.price), MIN(products.price)
FROM products;

------------------------------------------------------

-- Problema 2609 - Produtos por Categorias
SELECT categories.name, SUM(products.amount) as "sum"
FROM categories
INNER JOIN products ON categories.id = products.id_categories
GROUP BY categories.name;

------------------------------------------------------

-- Problema 2610 - Valor Médio dos Produtos
SELECT CAST(AVG(products.price) AS DECIMAL(10,2))
FROM products;

------------------------------------------------------

-- Problema 2611 - Filmes de Ação
SELECT movies.id, movies.name
FROM movies    
INNER JOIN genres ON genres.id = movies.id_genres
WHERE LEFT(genres.description, 6) = 'Action';

------------------------------------------------------

-- Problema 2613 - Filmes em Promoção
SELECT movies.id, movies.name
FROM movies
INNER JOIN prices ON prices.id = movies.id_prices
WHERE prices.value < 2.00;

------------------------------------------------------

-- Problema 2614 - Locações de Setembro
SELECT customers.name, rentals.rentals_date
FROM customers
INNER JOIN rentals ON customers.id = rentals.id_customers
WHERE extract(month from rentals.rentals_date) = 9;

------------------------------------------------------

-- Problema 2615 - Expandindo o Negocio
SELECT DISTINCT customers.city
FROM customers;

------------------------------------------------------

-- Problema 2616 - Nenhuma Locação
SELECT customers.id, customers.name
FROM customers
WHERE customers.id NOT IN (SELECT id_customers FROM locations)
ORDER BY customers.id ASC;

------------------------------------------------------

-- Problema 2617 - Fornecedor Ajax SA
SELECT p.name, pr.name
FROM products p
JOIN providers pr ON p.id_providers = pr.id
WHERE pr.name = 'Ajax SA';

------------------------------------------------------

-- Problema 2618 - Produtos Importados
SELECT products.name, providers.name, categories.name
FROM products
JOIN providers ON products.id_providers = providers.id
JOIN categories ON products.id_categories = categories.id
WHERE providers.name = 'Sansul SA' AND categories.name = 'Imported';

------------------------------------------------------

-- Problema 2619 - Super Luxo
SELECT products.name, providers.name, products.price
FROM products, providers, categories
WHERE products.id_providers = providers.id
AND products.id_categories = categories.id
AND categories.name LIKE 'Super Luxury' 
AND price > 1000;

------------------------------------------------------

-- Problema 2620 - Pedidos no Primeiro Semestre
SELECT c.name,
       o.id
FROM customers c
INNER JOIN orders o ON o.id_customers = c.id
WHERE extract(YEAR FROM orders_date) = 2016  AND extract(MONTH FROM orders_date) IN (1,2,3,4,5,6);

------------------------------------------------------

-- Problema 2621 - Quantidades Entre 10 e 20
SELECT prod.name
FROM products prod
INNER JOIN providers prov ON prov.id = prod.id_providers
WHERE prod.amount BETWEEN 10 AND 20
      AND prov.name LIKE 'P%';

------------------------------------------------------

-- Problema 2622 - Pessoas Jurídicas
SELECT cus.name
FROM legal_person lp
LEFT JOIN customers cus ON cus.id = lp.id_customers;

------------------------------------------------------

-- Problema 2623 - Categorias com Vários Produtos
SELECT prod.name,
       cat.name
FROM products prod
INNER JOIN categories cat ON cat.id = prod.id_categories
WHERE prod.amount > 100
      AND prod.id_categories IN (1,2,3,6,9);

------------------------------------------------------

-- Problema 2624 - Quantidades de Cidades por Clientes
SELECT count(DISTINCT city)
FROM customers;

------------------------------------------------------

-- Problema 2625 - Máscara de CPF
SELECT regexp_replace(np.cpf, '(\d{3})(\d{3})(\d{3})', '\1.\2.\3-')
FROM natural_person np
LEFT JOIN customers cus ON cus.id = np.id_customers;

------------------------------------------------------

-- Problema 2737 - Advogados
(SELECT name, customers_number
FROM lawyers
ORDER BY customers_number DESC
LIMIT 1)

UNION ALL

(SELECT name, customers_number
FROM lawyers
ORDER BY customers_number ASC
LIMIT 1)

UNION ALL

(SELECT 'Average', round(AVG(customers_number), 0)
FROM lawyers);

------------------------------------------------------

-- Problema 2738 - Concurso
SELECT c.name,
       round (((s.math * 2) + (s.specific * 3) + (s.project_plan*5)) / 10, 2) AS media
FROM candidate c
INNER JOIN score s ON s.candidate_id = c.id
ORDER BY media DESC;

------------------------------------------------------

-- Problema 2739 - Dia de Pagamento
(SELECT 'Podium: ' || team FROM league ORDER BY position LIMIT 3)
UNION ALL
(WITH t AS (SELECT * FROM league ORDER BY position DESC LIMIT 2)
  SELECT 'Demoted: '|| team FROM t ORDER BY position ASC);

------------------------------------------------------

-- Problema 2741 - Notas dos Alunos
SELECT concat ('Approved:',' ', NAME), grade
FROM students
WHERE grade > 6
ORDER BY grade DESC;

------------------------------------------------------

-- Problema 2742 - O Multiverso de Richard
SELECT lr.name, round (lr.omega * 1.618, 3) AS n
FROM dimensions d
INNER JOIN life_registry lr ON lr.dimensions_id = d.id
WHERE lr.name LIKE 'Richard%' AND d.name IN ('C875', 'C774')
ORDER BY lr.omega ASC;

------------------------------------------------------

-- Problema 2743 - Quantidade de Caracteres
SELECT NAME, CHAR_LENGTH(NAME) AS tam
FROM people
ORDER BY tam DESC;

------------------------------------------------------

-- Problema 2744 - Senhas
SELECT id, password, md5(password) FROM account;

------------------------------------------------------

-- Problema 2746 - Virus
SELECT REPLACE(name, 'H1', 'X') AS name
FROM virus;

------------------------------------------------------

-- Problema 2988 - Campeonato Cearense
SELECT t.name, 
    COUNT(m.id) AS matches,
    SUM(CASE 
            WHEN m.team_1 = t.id AND m.team_1_goals > m.team_2_goals THEN 1 
            WHEN m.team_2 = t.id AND m.team_2_goals > m.team_1_goals THEN 1 
            ELSE 0 
        END) AS victories,
    SUM(CASE 
            WHEN m.team_1 = t.id AND m.team_1_goals < m.team_2_goals THEN 1 
            WHEN m.team_2 = t.id AND m.team_2_goals < m.team_1_goals THEN 1 
            ELSE 0 
        END) AS defeats,
    SUM(CASE 
            WHEN m.team_1 = t.id AND m.team_1_goals = m.team_2_goals THEN 1 
            WHEN m.team_2 = t.id AND m.team_2_goals = m.team_1_goals THEN 1 
            ELSE 0 
        END) AS draws,
    SUM(CASE 
            WHEN m.team_1 = t.id AND m.team_1_goals > m.team_2_goals THEN 3 
            WHEN m.team_2 = t.id AND m.team_2_goals > m.team_1_goals THEN 3 
            WHEN m.team_1 = t.id AND m.team_1_goals = m.team_2_goals THEN 1 
            WHEN m.team_2 = t.id AND m.team_2_goals = m.team_1_goals THEN 1 
            ELSE 0 
        END) AS score
FROM teams t
LEFT JOIN matches m ON t.id IN (m.team_1, m.team_2)
GROUP BY t.id
ORDER BY score DESC;

------------------------------------------------------

-- Problema 2989 - Departamentos e Divisões
SELECT
    departamento.nome AS departamento,
    divisao.nome AS divisao,
    ROUND(AVG(salarios.salario), 2) AS media,
    ROUND(MAX(salarios.salario), 2) AS maior
FROM (
    SELECT
        venc_agrupados.lotacao,
        venc_agrupados.lotacao_div,
        ROUND(SUM(total_vencimentos) - COALESCE(SUM(total_descontos), 0), 2) AS salario
    FROM (
        SELECT
            empregado.matr,
            empregado.lotacao,
            empregado.lotacao_div,
            COALESCE(SUM(vencimento.valor), 0) AS total_vencimentos
        FROM empregado
        LEFT JOIN emp_venc
            ON empregado.matr = emp_venc.matr
        LEFT JOIN vencimento
            ON emp_venc.cod_venc = vencimento.cod_venc
        GROUP BY empregado.matr, empregado.lotacao, empregado.lotacao_div
        ) AS venc_agrupados
        LEFT JOIN (
            SELECT
                empregado.matr,
                empregado.lotacao,
                empregado.lotacao_div,
                COALESCE(SUM(desconto.valor), 0) AS total_descontos
            FROM empregado
            LEFT JOIN emp_desc
                ON empregado.matr = emp_desc.matr
            LEFT JOIN desconto
                ON emp_desc.cod_desc = desconto.cod_desc
            GROUP BY empregado.matr, empregado.lotacao, empregado.lotacao_div
        ) AS desc_agrupados
            ON venc_agrupados.matr = desc_agrupados.matr
    GROUP BY venc_agrupados.matr, venc_agrupados.lotacao, venc_agrupados.lotacao_div
) AS salarios
INNER JOIN departamento
    ON salarios.lotacao = departamento.cod_dep
INNER JOIN divisao
    ON salarios.lotacao_div = divisao.cod_divisao
GROUP BY divisao.nome, departamento.nome
ORDER BY media DESC;

------------------------------------------------------

-- Problema 2990 - CPF Dos Empregados
SELECT emp.cpf, emp.enome, dep.dnome
FROM empregados emp
INNER JOIN departamentos dep ON emp.dnumero = dep.dnumero 
LEFT JOIN trabalha t ON emp.cpf = t.cpf_emp 
WHERE t.pnumero IS NULL 
ORDER BY emp.cpf;

------------------------------------------------------

-- Problema 2991 - Estatísticas dos Departamentos
SELECT
    dep.nome AS "Nome Departamento",
    COUNT(emp.matr) AS "Numero de Empregados",
    round((AVG(tsalario.salario - tdescontos.descontos)),2) AS "Media Salarial",
    round((MAX(tsalario.salario - tdescontos.descontos)), 2) AS "Maior Salario",
    (CASE WHEN MIN(tsalario.salario - tdescontos.descontos) = 0 THEN '0' ELSE round((MIN(tsalario.salario - tdescontos.descontos)), 2) END) AS "Menor Salario"
FROM departamento dep 
    INNER JOIN empregado emp ON dep.cod_dep = emp.lotacao 
    INNER JOIN (SELECT emp.matr, COALESCE(SUM(v.valor), 0) AS salario FROM empregado emp LEFT JOIN emp_venc ON emp.matr = emp_venc.matr LEFT JOIN vencimento v ON emp_venc.cod_venc = v.cod_venc GROUP BY emp.matr ) AS tsalario ON emp.matr = tsalario.matr 
    INNER JOIN (SELECT emp.matr, COALESCE(SUM(desconto.valor), 0) AS descontos FROM empregado emp LEFT JOIN emp_desc ON emp.matr = emp_desc.matr LEFT JOIN desconto ON emp_desc.cod_desc = desconto.cod_desc GROUP BY emp.matr ) AS tdescontos ON emp.matr = tdescontos.matr 
GROUP BY dep.cod_dep,dep.nome 
ORDER BY "Media Salarial" DESC;

------------------------------------------------------

-- Problema 2992 - Divisões Com Maiores Médias Salariais
WITH media_salarial_por_divisao AS (
    SELECT
        salarios.lotacao,
        salarios.lotacao_div,
        ROUND(AVG(salarios.salario), 2) AS media
    FROM (
        SELECT
            venc_agrupados.lotacao,
            venc_agrupados.lotacao_div,
            ROUND(SUM(total_vencimentos) - COALESCE(SUM(total_descontos), 0), 2) AS salario
            FROM (
                SELECT
                    empregado.matr,
                    empregado.lotacao,
                    empregado.lotacao_div,
                    COALESCE(SUM(vencimento.valor), 0) AS total_vencimentos
                FROM empregado
                LEFT JOIN emp_venc
                    ON empregado.matr = emp_venc.matr
                LEFT JOIN vencimento
                    ON emp_venc.cod_venc = vencimento.cod_venc
                GROUP BY empregado.matr, empregado.lotacao, empregado.lotacao_div
                ) AS venc_agrupados
                LEFT JOIN (
                    SELECT
                        empregado.matr,
                        empregado.lotacao,
                        empregado.lotacao_div,
                        COALESCE(SUM(desconto.valor), 0) AS total_descontos
                    FROM empregado
                    LEFT JOIN emp_desc
                        ON empregado.matr = emp_desc.matr
                    LEFT JOIN desconto
                        ON emp_desc.cod_desc = desconto.cod_desc
                    GROUP BY empregado.matr, empregado.lotacao, empregado.lotacao_div
                ) AS desc_agrupados
                    ON venc_agrupados.matr = desc_agrupados.matr
            GROUP BY venc_agrupados.matr, venc_agrupados.lotacao, venc_agrupados.lotacao_div
        ) AS salarios
    GROUP BY salarios.lotacao, salarios.lotacao_div
)
SELECT
    departamento.nome AS departamento,
    divisao.nome AS divisao,
    media_salarial_por_divisao.media AS media
FROM media_salarial_por_divisao
INNER JOIN departamento
    ON media_salarial_por_divisao.lotacao = departamento.cod_dep
INNER JOIN divisao
    ON media_salarial_por_divisao.lotacao_div = divisao.cod_divisao
WHERE media IN (SELECT MAX(media) OVER (PARTITION BY lotacao) FROM media_salarial_por_divisao)
ORDER BY media DESC;

------------------------------------------------------

-- Problema 2993 - Mais Frequente
SELECT
    amount AS most_frequent_value
FROM
    value_table
GROUP BY
    amount
ORDER BY
    (COUNT(amount)) DESC
LIMIT 1;

------------------------------------------------------

-- Problema 2994 - Quanto Ganha um Médico?
SELECT
    d.name,
    SUM(ROUND(((150*a.hours)*(1+(w.bonus/100))), 1)) AS salary
FROM
    attendances a
        INNER JOIN doctors d ON a.id_doctor = d.id
        INNER JOIN work_shifts w ON a.id_work_shift = w.id
GROUP BY
    d.name
ORDER BY
    salary DESC;

------------------------------------------------------

-- Problema 2995 - A Mensagem do Sensor
SELECT
    temperature,
    COUNT(mark) AS number_of_records
FROM
    records
GROUP BY
    mark,
    temperature
ORDER BY
    mark;

------------------------------------------------------

-- Problema 2996 - Entrega de Pacotes
SELECT packages.year, u1.name AS sender, u2.name AS receiver
FROM packages 
JOIN users u1 ON packages.id_user_sender = u1.id 
JOIN users u2 ON packages.id_user_receiver = u2.id
WHERE (packages.year = 2015 OR packages.color LIKE 'blue')
     AND u2.address <> 'Taiwan' ORDER BY packages.year DESC;

------------------------------------------------------

-- Problema 2997 - Pagamento dos Empregados
SELECT
    departamento.nome AS Departamento,
    empregado.nome AS Empregado,
    CASE WHEN composicao_salarios.total_vencimentos = 0.00 THEN 0
         ELSE composicao_salarios.total_vencimentos END AS "Salario Bruto",
    CASE WHEN composicao_salarios.total_descontos = 0.00 THEN 0
         ELSE composicao_salarios.total_descontos END AS "Total Desconto",
    CASE WHEN composicao_salarios.salario = 0.00 THEN 0
         ELSE composicao_salarios.salario END AS "Salario Liquidoaws"
FROM (
    SELECT
        venc_agrupados.lotacao,
        venc_agrupados.matr,
        venc_agrupados.total_vencimentos,
        desc_agrupados.total_descontos,
        ROUND(SUM(total_vencimentos) - COALESCE(SUM(total_descontos), 0), 2) AS salario
    FROM (
        SELECT
            empregado.matr,
            empregado.lotacao,
            COALESCE(SUM(vencimento.valor), 0) AS total_vencimentos
        FROM empregado
        LEFT JOIN emp_venc
            ON empregado.matr = emp_venc.matr
        LEFT JOIN vencimento
            ON emp_venc.cod_venc = vencimento.cod_venc
        GROUP BY empregado.matr, empregado.lotacao
        ) AS venc_agrupados
        LEFT JOIN (
            SELECT
                empregado.matr,
                empregado.lotacao,
                COALESCE(SUM(desconto.valor), 0) AS total_descontos
            FROM empregado
            LEFT JOIN emp_desc
                ON empregado.matr = emp_desc.matr
            LEFT JOIN desconto
                ON emp_desc.cod_desc = desconto.cod_desc
            GROUP BY empregado.matr, empregado.lotacao
        ) AS desc_agrupados
        ON venc_agrupados.matr = desc_agrupados.matr
    GROUP BY venc_agrupados.matr, venc_agrupados.lotacao, 
        venc_agrupados.total_vencimentos, desc_agrupados.total_descontos
) AS composicao_salarios
INNER JOIN departamento
    ON composicao_salarios.lotacao = departamento.cod_dep
INNER JOIN empregado
    ON composicao_salarios.matr = empregado.matr
ORDER BY salario DESC;

------------------------------------------------------

-- Problema 2998 - The Payback
WITH cumulative_profit AS (
SELECT
c.name,
c.investment,
o.month,
SUM(o.profit) OVER (PARTITION BY o.client_id ORDER BY o.month) AS cumulative_profit
FROM
clients c
JOIN operations o ON c.id = o.client_id
),
payback AS (
SELECT
name,
investment,
MIN(month) AS payback_month,
MIN(cumulative_profit) - investment AS payback_value
FROM
cumulative_profit
WHERE
cumulative_profit >= investment
GROUP BY
name,
investment
)
SELECT *
FROM payback
ORDER BY payback_value DESC;

------------------------------------------------------

-- Problema 2999 - Maior Sálario da Divisão
WITH salarios AS (
    SELECT
        venc_agrupados.matr,
        venc_agrupados.lotacao_div,
        ROUND(SUM(total_vencimentos) - COALESCE(SUM(total_descontos), 0), 2) AS salario
    FROM (
        SELECT
            empregado.matr,
            empregado.lotacao_div,
            COALESCE(SUM(vencimento.valor), 0) AS total_vencimentos
        FROM empregado
        LEFT JOIN emp_venc
            ON empregado.matr = emp_venc.matr
        LEFT JOIN vencimento
            ON emp_venc.cod_venc = vencimento.cod_venc
        GROUP BY empregado.matr, empregado.lotacao_div
    ) AS venc_agrupados
    LEFT JOIN (
        SELECT
            empregado.matr,
            empregado.lotacao_div,
            COALESCE(SUM(desconto.valor), 0) AS total_descontos
        FROM empregado
        LEFT JOIN emp_desc
            ON empregado.matr = emp_desc.matr
        LEFT JOIN desconto
            ON emp_desc.cod_desc = desconto.cod_desc
        GROUP BY empregado.matr, empregado.lotacao_div
    ) AS desc_agrupados
    ON venc_agrupados.matr = desc_agrupados.matr
    GROUP BY venc_agrupados.matr, venc_agrupados.lotacao_div
),
    media_salarial_div AS (
        SELECT
            lotacao_div,
            AVG(salario) as salario_medio
        FROM salarios
        GROUP BY lotacao_div
)
SELECT 
    empregado.nome,
    salarios.salario
FROM salarios
INNER JOIN media_salarial_div
    ON salarios.lotacao_div = media_salarial_div.lotacao_div
    AND salarios.salario > media_salarial_div.salario_medio
    AND salarios.salario > 8000 
INNER JOIN empregado
    ON salarios.matr = empregado.matr
ORDER BY salarios.lotacao_div;

------------------------------------------------------

-- Problema 3001 - Update sem Where
SELECT NAME,
    CASE WHEN TYPE = 'A' then 20.0
    WHEN TYPE = 'B' then 70.0 
    WHEN TYPE = 'C' then 530.5
    END AS price
FROM products
ORDER BY TYPE, id DESC;

------------------------------------------------------

-- Problema 3480 - Cadeiras adjacentes
SELECT
    c1.queue AS "queue",
    c1.id AS "left",
    c2.id AS "right"
FROM
    chairs c1
    JOIN chairs c2 ON c1.queue = c2.queue AND c1.id + 1 = c2.id
WHERE
    c1.available = TRUE
    AND c2.available = TRUE
ORDER BY
    c1.queue, c1.id;

------------------------------------------------------

-- Problema 3481 - Classificando uma Árvore
WITH NodeTypes AS (
  SELECT
    distinct node_id,
    CASE
      WHEN node_id = 50 THEN 'ROOT'
      WHEN pointer IS NULL AND node_id IS NOT NULL THEN 'LEAF'
      WHEN pointer IS NOT NULL AND node_id IS NOT NULL THEN 'INNER'
    END AS type
  FROM nodes
)
SELECT
  node_id,
  type
FROM NodeTypes
ORDER BY
  node_id;

------------------------------------------------------

-- Problema 3483 - Segundo Maior e Menor
(SELECT city_name, population
FROM cities
ORDER BY population desc
LIMIT 1 OFFSET 1)
UNION
(SELECT city_name, population
FROM cities
ORDER BY population asc
LIMIT 1 OFFSET 1)
order by city_name desc;