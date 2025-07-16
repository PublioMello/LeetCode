-- Exiba os nomes dos produtos com um preço unitário maior ou igual a 3,5.
select * 
from products
where unit_price >=3.5
order by unit_price asc;

-- Exiba os nomes e os e-mails dos clientes. Você encontrará o nome na coluna contact_name
-- e o e-mail na coluna contact_email da tabela customer tabela. 
-- Renomeie as colunas para name e email, respectivamente.
-- nao tem email usei title

select contact_name as "Name",
	contact_title as "Title"
from customers;

-- Selecione os nomes dos produtos junto com suas categorias. 
-- Exiba duas colunas: product_name e category_name.

SELECT p.product_name as "Name product",
		c.category_id as "categorie"
FROM products p 
left join categories c On p.category_id = c.category_id;

-- Mostre o sobrenome e o nome dos funcionários que estão lidando com as compras,
-- juntamente com o endereço shipped_date da compra.

select e.first_name as "Name",e.last_name as "Surname", o.shipped_date as "Date of shppiment"
from employees as e
left join orders as o on e.employee_id = o.employee_id;

-- Para cada funcionário, exiba os endereços last_name, first_name e o ID da(s) compra(s) com a(s) 
-- qual(is) ele lidou (se houver). Certifique-se de exibir os dados de todos os funcionários,
-- mesmo que eles não tenham se envolvido com nenhuma compra.
select e.first_name as "Name",e.last_name as "Surname", o.order_id as "Order"
from employees as e
left join orders as o on e.employee_id = o.employee_id;

-- Exiba os nomes e os preços unitários de todos os produtos. 
-- Mostre os produtos mais baratos primeiro.

select product_name, unit_price
from products
order by unit_price asc;

-- Mostre todos os dados de todas as compras. Classifique as linhas
-- pela cidade de envio em ordem crescente e pela data de envio em ordem decrescente.

select *
from orders
order by ship_city asc, shipped_date desc;

-- Conte o número de categorias presentes na tabela category tabela. 
-- Nomeie a coluna number_of_categories.

select employee_id,
	count (*)
from orders
group by employee_id;

-- Conte o número de compras feitas por cada cliente. 
-- Exiba as colunas customer_id, contact_name e purchases_number. 
-- Ignore os clientes que não estiverem presentes na tabela. purchase tabela

select o.customer_id, c.contact_name, count (o.order_id) as "pedidos"
from orders as o
join customers as c on o.customer_id = c.customer_id
group by o.customer_id, c.contact_name
order by pedidos desc;


-- Exibir o sobrenome e o nome dos funcionários com data de contratação desconhecida.
-- a minha base esta diferente da base em questao

select * 
from employees
where region is null;


-- Para cada categoria, conte o preço médio de seus produtos. 
-- Exiba somente as categorias para as quais o preço unitário médio é maior 
-- que o preço unitário médio geral. 
-- Nomeie as colunas category_name e average_price.

select c.category_name, avg (p.unit_price)
from products as p
join categories as c on p.category_id = c.category_id
group by c.category_name
HAVING AVG(p.unit_price) > (
  SELECT AVG(unit_price)
  FROM products
);

-- Qual é o total de vendas (unit_price * quantity) por pedido (order_id)?
select product_id, sum (unit_price * quantity)
from order_details
group by product_id;

select *, ROUND((unit_price * quantity)::numeric,2) as "Vendas"
from order_details;

-- Mostre o nome do funcionário e o nome do gerente (coluna reports_to) de cada um.


SELECT f.first_name || ' ' || f.last_name AS funcionario,
       g.first_name || ' ' || g.last_name AS gerente
FROM employees f
LEFT JOIN employees g ON f.reports_to = g.employee_id;


-- Quais os cinco produtos mais vendidos (quantidade)?
select *
from order_details;

select *
from products;

select p.product_name, sum(o.quantity)
from order_details as o
Join products as p on o.product_id = p.product_id
group by p.product_name;

-- Quais clientes nunca fizeram pedidos?

SELECT c.*
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;


-- Liste os produtos que pertencem à mesma categoria que o produto “Chai”.
select *
from products
where category_id = 1;
-- Quais fornecedores fornecem mais de 3 produtos?

select s.company_name, count(p.product_name) as "QTD"
from products as p
join suppliers as s on p.supplier_id = s.supplier_id
group by s.company_name
Having count(p.product_name) >= 3
order by "QTD" desc;

-- Mostre os produtos que têm preço acima da média dos produtos.

select *
from products
where unit_price >(
select avg(unit_price) 
from products)
order by unit_price asc;

-- Liste os pedidos feitos entre janeiro e março de 1997.
select *
from orders
where shipped_date between '1997-01-01' and '1997-03-31';

-- Para cada país, mostre o número de clientes e o número de pedidos feitos.

select ship_country, count(ship_country) as "Qtd de pedidos"
from orders
group by ship_country
order by "Qtd de pedidos" desc
limit 10;


-- Crie uma lista dos pedidos com o nome do cliente, o funcionário responsável e o valor total do pedido.
select *
from customers as c
left join orders as o on c.customer_id=o.customer_id;

select *
from orders;

select *
from order_details;

select c.contact_name as "Client Name", 
	(e.first_name || ' ' || e.last_name) as "Employee name", 
	ROUND((od.unit_price*od.quantity*(1-od.discount))::numeric,2) as "Order value"
from customers c
join orders as o on c.customer_id=o.customer_id
join employees as e on o.employee_id = e.employee_id
join order_details as od on o.order_id = od.order_id
order by "Order value" desc;

-- Mostre quais categorias têm produtos que já estão descontinuados (discontinued = 1).

select * 
from products
where discontinued = 1;

-- Liste os nomes dos produtos, o nome da categoria e o nome do fornecedor.
select *
from categories;

select *
from suppliers;

-- Mostre os três clientes com mais pedidos registrados.
select customer_id, count(customer_id)
from orders
group by customer_id
order by count desc
limit 3;
-- Calcule o total de vendas por país.

select o.ship_country,
round(sum(od.unit_price*od.quantity)::numeric, 2) as "Vendas por Pais"
from orders as o
left join order_details as od on o.order_id = od.order_id 
group by o.ship_country
order by "Vendas por Pais" desc

-- Qual funcionário gerou mais vendas?
 
 testando fucnionalidade no main pra adicionar no brench
-- Quais são os 3 produtos com maior faturamento?

-- Qual o ticket médio por pedido (total / número de pedidos)?

-- Crie um ranking de países com base no valor total de pedidos.


