-- criação de banco de dados para o cenário de E-commerce
-- drop database if exists ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
	descriptionProduct char(30) not null,
    orderStatus ENUM('Pedido Confirmado','Em Processamento', 'À Caminho','Cancelado') default 'Em Processamento',
    feedback varchar(300),
    deliveryInfo varchar(45),
    deliveryCode varchar(13) not null,
    undeliveryOrder varchar(45),
    productReturn varchar(80),
    shippingCost float default 100
);

-- criar tabela cliente
create table clients(
		idClient int auto_increment primary key,
        idCorder int,
        Fname varchar(15) not null,
        Minit char(3),
        Lname varchar(15) not null,
        CPF char(11) not null,
        state varchar(20) not null,
        city varchar(30) not null,
        addressLine varchar(50) not null,
        birthdate date not null,
        constraint unique_cpf_client unique (CPF),
        constraint fk_orders_clients foreign key (idCorder) references orders(idOrder)
);

alter table clients auto_increment=1;

-- criar tabela produto
create table product(
	IdProduct int auto_increment primary key,
    productBrand varchar(15),
    Category ENUM('Eletrônicos', 'Vestuário', 'Brinquedos', 'Alimentos', 'Para-a-casa'),
    unitCost float not null,
    sellingPrice float not null,
    size float,
    weight float,
    serialCode int
);

-- criar tabela pagamento
create table payment(
	idPayment int auto_increment primary key,
	idClient int,
    cash float,
    creditcard float,
    bankTransfer float,
    other float,
    refund float,
    constraint fk_payment_clients foreign key (idClient) references clients(idClient)
);

-- desc seller;
-- criar uma tabela estoque
create table productStorage(
	idProductStorage int auto_increment primary key,
    idSorder int,
    warehouse int,
    storageSection int,
    location varchar(13),
    quantity int default 0,
    constraint fk_orders_productStorage foreign key (idSorder) references orders(idOrder)
);

-- criar tabela fornecedor
create table supplier(
	idSupllier int auto_increment primary key,
    legalName varchar(45),
    CNPJ char(14),
    brandName varchar(25),
    Address varchar(45),
    CPF char(11),
    contact char(11) not null,
    constraint unique_cnpj_supllier unique (CNPJ),
    constraint unique_cpf_supllier unique (CPF)
);

-- desc seller;
-- Criar tabela vendedor
create table seller(
    idSeller int auto_increment primary key,
    legalName varchar(20) not null,
    address varchar(45) not null,
    brandName varchar(45),
    CNPJ char(14),
    CPF char(11),
    phoneNumber char(11),
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

create table distributionCenter(
    idDistributionCenter int auto_increment primary key,
    idDCstorage int not null,
    idDCsupplier int not null,
    processProduct int,
    constraint fk_dc_storage foreign key (idDCstorage) references productStorage(idProductStorage),
    constraint fk_dc_supplier foreign key (idDCsupplier) references Supplier(idSupllier)
);

-- criar tabela relação produto/pedido
create table productOrder(
	idPproduct int,
    idPorder int,
    prodQuantity int default 1,
    inventoryStatus enum('Disponível','Indisponível') default 'disponível',
    primary key(idPproduct, idPOrder),
    constraint fk_product_order foreign key (idPproduct) references product(idProduct),
    constraint fk_orders_product foreign key (idPorder) references orders(idOrder)
);

-- desc third_partySeller;
-- criar tabela vendedor (parceiro)
create table third_partySeller(
	idPseller int,
    idTproduct int,
    localStorage int,
    primary key(idPseller, idTproduct),
	constraint fk_seller_product foreign key (idPseller) references seller(idSeller),
    constraint fk_product_seller foreign key (idTproduct) references product(idProduct)
);

-- show databases;
-- show tables;
use information_schema;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';