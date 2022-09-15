create database ecommerce;


-- tabela cliente
CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente`  INT NOT NULL AUTO_INCREMENT,
  `pessoaFisica` TINYINT NULL,
  `numeroCpf_Cnpj` VARCHAR(45) NULL,
  `nome` VARCHAR(12) NULL,
   sobreNome varchar(30),
  `Endereco_cep` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `fk_Cliente_Endereco`FOREIGN KEY (`Endereco_cep`)REFERENCES `Endereco` (`cep`)
  
  );
  


CREATE TABLE IF NOT EXISTS `Endereco` (
  `cep` INT NOT NULL,
  `rua` VARCHAR(45) ,
  `bairro` VARCHAR(45) ,
  `cidade` VARCHAR(45) ,
  `estado` VARCHAR(45) ,
  PRIMARY KEY (`cep`));

-- drop table `Vendedores(terceiros)`;
CREATE TABLE IF NOT EXISTS `vendedores_Terceiros` (
  `idVendedoresTerceiros` INT NOT NULL AUTO_INCREMENT,
  `cnpj` CHAR(15) not NULL unique,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idVendedoresTerceiros`));

CREATE TABLE IF NOT EXISTS `Estoque` (
  `idEstoque` INT NOT NULL AUTO_INCREMENT,
  `estoque` INT NULL,
   nome  varchar(30),
  PRIMARY KEY (`idEstoque`));

CREATE TABLE IF NOT EXISTS `Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `valor` decimal(14,2) NULL,
  descricao text(255),
  PRIMARY KEY (`idProduto`));
  
 -- drop table Entrega;
  CREATE TABLE IF NOT EXISTS `Entrega` (
  `idEntrega` INT NOT NULL AUTO_INCREMENT,
  `valordofrete` FLOAT NULL,
   `Pedido_idPedido` INT NOT NULL,
  `código de rastreio` INT NOT NULL unique,
   PRIMARY KEY (`idEntrega`),
   CONSTRAINT `fk_Entrega_Pedido`FOREIGN KEY (`Pedido_idPedido`) REFERENCES `Pedido` (`idPedido`)
 );

CREATE TABLE IF NOT EXISTS Fornecedor (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `cnpj` char(15) NOT NULL unique,
  `razao social` VARCHAR(45) NULL,
  PRIMARY KEY (`idFornecedor`)
);

CREATE TABLE IF NOT EXISTS `FormaDePagamento` (
  `idFormadePagamento` INT NOT NULL DEFAULT 1,
  `nome` ENUM('BOLETO', 'CARTAO DE CREDITO', 'PIX') NOT NULL DEFAULT 'BOLETO',
  PRIMARY KEY (`idFormadePagamento`),
  UNIQUE INDEX `idFormadepagamento_UNIQUE` (`idFormadePagamento` ASC) );




-- drop table Pedido;
CREATE TABLE IF NOT EXISTS `Pedido` (
  idPedido int not null auto_increment,
  `Cliente_idCliente` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `status` ENUM('EM PROCESSAMENTO', 'ENVIADO', 'ENTREGUE', 'CANCELADO') NOT NULL DEFAULT 'EM PROCESSAMENTO',
  `quantitade_prod` INT(10) NOT NULL DEFAULT 1,
  `dataEntrega` DATE NOT NULL,
  `dataPedidoRealizado` datetime NOT NULL default current_timestamp,
   valorPrdoutoPedido DECIMAL(14,2),
   FormaDePagamento_idFormadePagamento INT NOT NULL,
  PRIMARY KEY (idPedido),
  CONSTRAINT `fk_Cliente` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`),
  CONSTRAINT `fk_produto` FOREIGN KEY (Produto_idProduto) REFERENCES `Produto` (`idProduto`),
  CONSTRAINT `fk_FormaDePagamento1`FOREIGN KEY (`FormaDePagamento_idFormadePagamento`)REFERENCES`FormaDePagamento` (`idFormadePagamento`)
    );



CREATE TABLE IF NOT EXISTS `Pedido_contem_Produto` (
  `Pedido_idPedido` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`Pedido_idPedido`, `Produto_idProduto`),
  CONSTRAINT `fk_Pedido_Produto`FOREIGN KEY (`Pedido_idPedido`)REFERENCES `Pedido` (`idPedido`),
  CONSTRAINT `fk_produto_pedido`FOREIGN KEY (`Produto_idProduto`)REFERENCES `Produto` (`idProduto`)
   );

CREATE TABLE IF NOT EXISTS `Produto_possui_Fornecedor` (
  `Produto_idProduto` INT NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  quantidade int not null,
  PRIMARY KEY (`Produto_idProduto`, `Fornecedor_idFornecedor`),
  CONSTRAINT `fkFornecedor_Produto`FOREIGN KEY (`Produto_idProduto`)REFERENCES `Produto` (`idProduto`),
  CONSTRAINT `fk_Produto_Fornecedor`FOREIGN KEY (`Fornecedor_idFornecedor`)REFERENCES`Fornecedor` (`idFornecedor`)
 );
 
CREATE TABLE IF NOT EXISTS `Produto_has_Estoque` (
  `Produto_idProduto` INT NOT NULL,
  `Estoque_idEstoque` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Estoque_idEstoque`),
  CONSTRAINT `fk_Estoque_Produto1`FOREIGN KEY (`Produto_idProduto`)REFERENCES `Produto` (`idProduto`),
  CONSTRAINT `fk_Produto_Estoque`FOREIGN KEY (`Estoque_idEstoque`)REFERENCES `Estoque` (`idEstoque`));

CREATE TABLE IF NOT EXISTS `vendedores_Terceiros_Tem_Produto` (
  `vendedores_Terceiros_idVendedoresTerceiros` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`vendedores_Terceiros_idVendedoresTerceiros`, `Produto_idProduto`),
  CONSTRAINT `fk_vendedores_Terceiros_has_Produto`FOREIGN KEY (`vendedores_Terceiros_idVendedoresTerceiros`)REFERENCES `vendedores_Terceiros` (`idVendedoresTerceiros`),
  CONSTRAINT `fk_Produto_vendedores_has_Terceiros_`FOREIGN KEY (`Produto_idProduto`)REFERENCES `Produto` (`idProduto`)
  );

CREATE TABLE IF NOT EXISTS `Cliente_tem_FormaDePagamento` (
  `Cliente_idCliente` INT NOT NULL unique,
  `FormaDePagamento_idFormadePagamento` INT NOT NULL unique,
  PRIMARY KEY (`Cliente_idCliente`, `FormaDePagamento_idFormadePagamento`),
  CONSTRAINT `fk_Cliente_tem_FormaDePagamento`FOREIGN KEY (`Cliente_idCliente`)REFERENCES `Cliente` (`idCliente`),
  CONSTRAINT `fk_FormaDePagamento_tem_Cliente`FOREIGN KEY (`FormaDePagamento_idFormadePagamento`)REFERENCES `FormaDePagamento` (`idFormadePagamento`)
   );


truncate table `Pedido`;
drop table fornecedor;
drop table vendedores_terceiros;
drop table produto;

drop table `Estoque`;
drop table `Forma de pagamento`;
drop table pedido;
drop database ecommerce;
show tables;
TRUNCATE TABLE cliente;  

	
desc table Fornecedor;
update  produto set valor = 2.24  where idProduto = 1;


-- insert INTO Cliente  values(null,1,99999999999,'teste');
