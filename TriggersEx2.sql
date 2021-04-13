Create database Vendas
go 
use Vendas


create table Cliente(
codigo int,
nome varchar(100)
primary key (codigo))

insert into Cliente values
(1,'cliente 1'),
(2,'cliente 2'),
(3,'cliente 3')

create table Venda(
codigo_venda int,
codigo_cliente int,
valor_total int
primary key(codigo_venda))

insert into Venda values (1,1,5)
insert into Venda values (2,2,10)
insert into Venda values (3,3,5)
insert into Venda values (4,3,5)


create table Pontos(
codigo_cliente int,
total_pontos decimal(5,2)
primary key(codigo_cliente))

select * from Pontos

CREATE TRIGGER t_blockDelVenda ON Venda
FOR DELETE
AS
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('Não é permitido excluir registros de vendas', 16, 1)
END

Update Venda set valor_total = 11 where codigo_cliente = 2

select * from Venda

CREATE TRIGGER t_blockUpdateVenda ON Venda
INSTEAD OF UPDATE
AS
BEGIN
	Select TOP 1 c.nome,v.valor_total from Venda v,Cliente c where v.codigo_cliente = c.codigo order by v.codigo_venda DESC
END

CREATE TRIGGER t_transformaEmPontos ON Venda
AFTER INSERT
AS
BEGIN
	declare @pontosVenda as decimal(5,2),@codCliente as int
	set @codCliente = (select codigo_cliente from inserted)
	set @pontosVenda = CONVERT(DECIMAL(16,4),(select valor_total from inserted) * 0.1)
	if (select count(*) from Pontos where codigo_cliente = @codCliente) >= 1
	BEGIN

		update Pontos set  total_pontos = total_pontos + @pontosVenda where codigo_cliente = @codCliente
	END
	ELSE
	BEGIN
		insert into Pontos values (@codCliente,@pontosVenda)
	END
	if (select total_pontos from Pontos where codigo_cliente = @codCliente) >= 1
	BEGIN
		print 'Ganhou'
	END
END
