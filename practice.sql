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