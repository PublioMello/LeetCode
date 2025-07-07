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
group by employee_id

-- Conte o número de compras feitas por cada cliente. 
-- Exiba as colunas customer_id, contact_name e purchases_number. 
-- Ignore os clientes que não estiverem presentes na tabela. purchase tabela

