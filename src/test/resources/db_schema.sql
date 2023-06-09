alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
alter table if exists ap_customer_orders drop constraint if exists FKhsntxuriua0pgmnffj0vu0sna;
alter table if exists ap_customer_orders drop constraint if exists FK8xiw11vrf0vobc485difdjatq;
alter table if exists ap_order drop constraint if exists FKfjgb547wgadq2pvjfq1d80axc;
alter table if exists ap_order_pizzas drop constraint if exists FKnb0gnv288xordqcol1cdcm6fq;
alter table if exists ap_order_pizzas drop constraint if exists FK7nce53esj2t2hjdjefgep1gd3;
drop table if exists ap_customer cascade;
drop table if exists ap_customer_orders cascade;
drop table if exists ap_order cascade;
drop table if exists ap_order_pizzas cascade;
drop table if exists ap_pizza cascade;
drop sequence if exists hibernate_sequence;
create sequence hibernate_sequence start 1 increment 1;
create table ap_customer (id int8 not null, name varchar(100) not null, primary key (id));
create table ap_customer_orders (customer_id int8 not null, orders_id int8 not null);
create table ap_order (id int8 not null, status int4 not null, time timestamp not null, customer_id int8, primary key (id));
create table ap_order_pizzas (order_id int8 not null, pizzas_id int8 not null);
create table ap_pizza (id int8 not null, name varchar(100) not null, primary key (id));
alter table if exists ap_customer_orders add constraint UK_7j3pi0q9a0e1hfod4svegueon unique (orders_id);
alter table if exists ap_customer_orders add constraint FKhsntxuriua0pgmnffj0vu0sna foreign key (orders_id) references ap_order;
alter table if exists ap_customer_orders add constraint FK8xiw11vrf0vobc485difdjatq foreign key (customer_id) references ap_customer;
alter table if exists ap_order add constraint FKfjgb547wgadq2pvjfq1d80axc foreign key (customer_id) references ap_customer;
alter table if exists ap_order_pizzas add constraint FKnb0gnv288xordqcol1cdcm6fq foreign key (pizzas_id) references ap_pizza;
alter table if exists ap_order_pizzas add constraint FK7nce53esj2t2hjdjefgep1gd3 foreign key (order_id) references ap_order;
