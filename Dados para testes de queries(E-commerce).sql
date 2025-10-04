use ecommerce;

show tables;

-- ==============================
-- Pedidos
-- ==============================
delete from orders where idCorder in (1,2,3,4,5);
insert into orders (descriptionProduct, deliveryCode, orderStatus, feedback, deliveryInfo, shippingCost) values
	('Smartphone Galaxy S24', 'DEL000001', 'Pedido Confirmado', 'Ótimo produto, chegou rápido!', 'Correios - SEDEX', 45.90),
	('Notebook Acer Aspire 5', 'DEL000002', 'À Caminho', null, 'Transportadora Azul Cargo', 55.00),
	('Camiseta Nike Dry-Fit', 'DEL000003', 'Em Processamento', null, 'Transportadora Flash', 25.00),
	('Boneca Barbie Dream', 'DEL000004', 'Pedido Confirmado', 'Produto em perfeitas condições!', 'Correios - PAC', 20.00),
	('TV LG 55" OLED', 'DEL000005', 'Cancelado', 'Pedido cancelado por falta de estoque', null, 0.00);


-- ==============================
--  Clientes
-- ==============================
insert into clients (idCorder, Fname, Minit, Lname, CPF, state, city, addressLine, birthdate) values
	(1, 'João', 'A', 'Silva', '12345678901', 'SP', 'São Paulo', 'Rua das Flores, 123', '1990-05-12'),
	(2, 'Maria', 'B', 'Oliveira', '23456789012', 'RJ', 'Rio de Janeiro', 'Av. Atlântica, 456', '1985-09-23'),
	(3, 'Carlos', 'C', 'Souza', '34567890123', 'MG', 'Belo Horizonte', 'Rua Minas, 789', '1992-11-30'),
	(4, 'Ana', 'D', 'Ferreira', '45678901234', 'PR', 'Curitiba', 'Rua Paraná, 12', '1995-02-15'),
	(5, 'Fernanda', 'E', 'Moura', '56789012345', 'RS', 'Porto Alegre', 'Av. Central, 555', '1988-06-09');


-- ==============================
-- Produtos
-- ==============================
insert into product (productBrand, Category, unitCost, sellingPrice, size, weight, serialCode) values
	('Samsung', 'Eletrônicos', 2500, 3500, 6.7, 0.4, 10001),
	('Acer', 'Eletrônicos', 3200, 4800, 15.6, 1.8, 10002),
	('Nike', 'Vestuário', 80, 200, 0, 0.2, 10003),
	('Mattel', 'Brinquedos', 60, 120, 10, 0.5, 10004),
	('LG', 'Para-a-casa', 4000, 5900, 55, 12.0, 10005);

-- ==============================
-- Pagamentos
-- ==============================
insert into payment (idClient, cash, creditcard, bankTransfer, other, refund) values
	(1, 0, 3500, 0, 0, 0),
	(2, 0, 4800, 0, 0, 0),
	(3, 0, 0, 200, 0, 0),
	(4, 120, 0, 0, 0, 0),
	(5, 0, 0, 0, 0, 5900);

-- ==============================
-- Estoque
-- ==============================
insert into productStorage (idSOrder, warehouse, storageSection, location, quantity) values
	(1, 101, 1, 'A1', 50),
	(2, 102, 2, 'B2', 30),
	(3, 103, 3, 'C3', 120),
	(4, 104, 4, 'D4', 60),
	(5, 105, 5, 'E5', 10);

-- ==============================
-- Fornecedores
-- ==============================
insert into supplier (legalName, CNPJ, brandName, Address, CPF, contact) values
	('Fornecedor Alpha Ltda', '11122233000144', 'Alpha', 'Rua Um, 10', '99988877766', '11988887777'),
	('Fornecedor Beta SA', '22233344000155', 'Beta', 'Rua Dois, 20', '88877766655', '21977776666'),
	('Fornecedor Gama LTDA', '33344455000166', 'Gama', 'Rua Três, 30', '77766655544', '31966665555');

-- ==============================
-- Vendedores
-- ==============================
insert into seller (legalName, address, brandName, CNPJ, CPF, phoneNumber) values
	('Loja Eletro Ltda', 'Av Paulista, 1000', 'EletroStore', '44455566000177', '66655544433', '1133334444'),
	('Moda Fit', 'Rua das Rosas, 222', 'ModaFit', '55566677000188', '55544433322', '11911112222'),
	('Brinquedos Center', 'Av Central, 500', 'ToyCenter', '66677788000199', '44433322211', '1144445555');

-- ==============================
-- Relação Produto-Pedido
-- ==============================

insert into productOrder (idPproduct, idPorder, prodQuantity, inventoryStatus) values
	(1, 1, 1, 'Disponível'),
	(2, 2, 1, 'Disponível'),
	(3, 3, 2, 'Disponível'),
	(4, 4, 1, 'Disponível'),
	(5, 5, 1, 'Indisponível');

-- ==============================
-- Centros de Distribuição
-- ==============================
insert into distributionCenter (idDCstorage, idDCsupplier, processProduct) values
	(1, 1, 10),
	(2, 2, 20),
	(3, 3, 15);

-- ==============================
-- Vendedores Parceiros
-- ==============================
insert into third_partySeller (idPseller, idTproduct, localStorage) values
	(1, 1, 500),
	(2, 3, 200),
	(3, 4, 150);

-- select * from clients;
-- select * from product;
-- select * from orders;
-- select * from productStorage
-- select * from supplier;
-- select * from seller;
-- select * from productOrder;
-- select * from distributionCenter;
-- select * from third_partySeller;
select count(*) from clients;
select * from clients c, orders o where c.idClient = idCorder;
select Fname,Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idCorder;
select concat(Fname, '',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idCorder;
insert into orders (idCOrder, orderStatus, feedback, cash) values;
select * from clients c, orders o
			where c.idClient = idCorder
            group by idOrder;

-- Recuperar quantos pedidos foram realizados pelos clientes?
select * from orders;
select * from clients c left outer join orders o ON c.idClient = o.idCorder
			inner join productOrder p on idPorder = idOrder
		group by idClient;