create database pedido;

use pedido;

create table pedido(
  cod_pedido integer not null primary key auto_increment,
  data_pedido date not null,
  status varchar(20) not null
);

create table cliente(
  cod_cliente integer not null primary key auto_increment,
  nome_cliente varchar(50) not null
);

create table pedido_cliente(  
  cod_pedido integer not null,
  cod_cliente integer not null,
  constraint pk_pedido_cliente primary key(cod_pedido, cod_cliente), 
  constraint fk_pedido_cliente_pedido foreign key(cod_pedido) references pedido(cod_pedido),
  constraint fk_pedido_cliente_cliente foreign key(cod_cliente) references cliente(cod_cliente) 
);

create table menu(
  cod_menu integer not null primary key auto_increment,
  nome_menu varchar(50) not null,
  preco numeric(5, 2) not null 
);

create table pedido_cliente_menu(
  cod_pedido integer not null,
  cod_cliente integer not null,
  cod_menu integer not null,
  quantidade_pedida numeric(5, 2) not null,
  
  constraint pk_pedido_cliente_menu primary key(cod_pedido, cod_cliente, cod_menu),
  constraint fk_pedido_cliente foreign key (cod_pedido, cod_cliente) references pedido_cliente(cod_pedido, cod_cliente),
  constraint fk_fk_pedido_cliente_menu_menu foreign key (cod_menu) references menu(cod_menu)
  
);



