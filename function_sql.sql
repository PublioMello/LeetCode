create or replace function analise_estoque(estoque_min int, estoque_max int)
returns int
language plpgsql
as
$$
declare
	contagem_estoque int;

begin

	contagem_estoque = (select count(*) from products where units_in_stock between estoque_min and estoque_max);

	return contagem_estoque;
end $$;

select analise_estoque(10,50);

select count (*) - analise_estoque(10,50) from products;



--------------------------------------------------------------------------------------------------------------------------------------

create or replace function busca_clientes(title varchar)
returns table
		(
			id customers.customer_id%type,
			nome customers.contact_name%type,
			telefone customers.phone%type,
			cargo customers.contact_title%type
		)

language plpgsql
as $$

begin
	return query
		select
			customer_id,
			contact_name,
			phone,
			contact_title
		from customers
		where contact_title = title;
end $$;

select * from busca_clientes('Owner')

-- drop function busca_clientes;