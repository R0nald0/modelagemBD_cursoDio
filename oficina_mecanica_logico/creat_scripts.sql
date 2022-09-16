create database oficinaMecanica;


CREATE TABLE IF NOT EXISTS `endereco` (
  `cep` CHAR(8) NOT NULL unique,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
   `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NULL, 
  PRIMARY KEY (`cep`)
);

CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT unique,
  `nome` VARCHAR(20) NOT NULL,
   sobreNome varchar(45),
  `cpf` CHAR(11) NOT NULL unique,
  PRIMARY KEY (`idCliente`)
);

CREATE TABLE IF NOT EXISTS `Cliente_levam_Veiculo` (
  `Cliente_idCliente` INT NOT NULL unique,
  `Veiculo_idVeiculo` INT NOT NULL unique,
  PRIMARY KEY (`Cliente_idCliente`, `Veiculo_idVeiculo`),
  CONSTRAINT `fk_Cliente_levam_Veiculo`FOREIGN KEY (`Cliente_idCliente`)REFERENCES `Cliente` (`idCliente`),
  CONSTRAINT `fk_Veiculo_é levadoPor_Cliente`FOREIGN KEY (`Veiculo_idVeiculo`)REFERENCES `Veiculo` (`idVeiculo`)
 );


CREATE TABLE IF NOT EXISTS `Veiculo` (
  `idVeiculo` INT NOT NULL auto_increment,
  `placa` VARCHAR(7) NOT NULL unique,
  `marca` VARCHAR(45) NOT NULL,
  `ano` INT(4) NOT NULL,
  PRIMARY KEY (`idVeiculo`)
);


CREATE TABLE IF NOT EXISTS `Mecanico` (
  `idMecanico` INT  AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` char(11)  NOT NULL,
  `especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idMecanico`)
  );
  
CREATE TABLE IF NOT EXISTS `Mecanico_compoe_Equipe` (
  `Mecanico_idMecanico` INT NOT NULL,
  `Equipe_idEquipe` INT NOT NULL,
  PRIMARY KEY (`Mecanico_idMecanico`, `Equipe_idEquipe`),
  CONSTRAINT `fk_Mecanico_compoe_Equipe`FOREIGN KEY (`Mecanico_idMecanico`)REFERENCES `Mecanico` (`idMecanico`),
  CONSTRAINT `fk_Equipe_contem_Mecanico`FOREIGN KEY (`Equipe_idEquipe`)REFERENCES `Equipe` (`idEquipe`));


CREATE TABLE IF NOT EXISTS `Equipe` (
  `idEquipe` INT not null unique,
   quantidadePessoa smallint not null,
  `Veiculo_idVeiculo`  INT  unique,
  CONSTRAINT `fk_Equipe_Veiculo1`FOREIGN KEY (`Veiculo_idVeiculo`)REFERENCES`Veiculo` (`idVeiculo`)
 );





CREATE TABLE IF NOT EXISTS `Cliente_possui_endereco` (
  `Cliente_idCliente` INT NOT NULL unique,
  `endereco_cep` CHAR(8) NOT NULL unique,
  PRIMARY KEY (`Cliente_idCliente`, `endereco_cep`),
  INDEX `fk_Cliente_has_endereco_endereco1_idx` (`endereco_cep` ASC) VISIBLE,
  INDEX `fk_Cliente_has_endereco_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_possui_endereco`FOREIGN KEY (`Cliente_idCliente`)REFERENCES `Cliente` (`idCliente`),
  CONSTRAINT `fk_endereco_possui_Cliente`FOREIGN KEY (`endereco_cep`)REFERENCES `endereco` (`cep`)
);


CREATE TABLE IF NOT EXISTS Servico (
  `idServico` bigint NOT NULL auto_increment ,
  `Valores_idTabelaValores` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `autorizacaoServico` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idServico`, `Valores_idTabelaValores`, `Cliente_idCliente`),
  CONSTRAINT `fk_Serviços_Tabela de valores1`FOREIGN KEY (`Valores_idTabelaValores`)REFERENCES Valores_mao_de_obra (`idTabelaValores`),
  CONSTRAINT `fk_Serviço_Cliente1`FOREIGN KEY (`Cliente_idCliente`)REFERENCES `Cliente` (`idCliente`));
  
  CREATE TABLE IF NOT EXISTS `Equipe_identica_Servico` (
  `Equipe_idEquipe` INT NOT NULL,
  `Servico_idServico` BIGINT NOT NULL,
  PRIMARY KEY (`Equipe_idEquipe`, `Servico_idServico`),
  CONSTRAINT `fk_Equipe_Servico`FOREIGN KEY (`Equipe_idEquipe`)REFERENCES `Equipe` (`idEquipe`),
  CONSTRAINT `fk_Servico_Equipe`FOREIGN KEY (`Servico_idServico`)REFERENCES `Servico` (`idServico`));

  
  CREATE TABLE IF NOT EXISTS Valores_mao_de_obra (
  `idTabelaValores` INT NOT NULL unique auto_increment,
  `valorServico` DECIMAL(13,2) NOT NULL,
  `tipoServico` VARCHAR(45) NOT NULL unique,
  PRIMARY KEY (`idTabelaValores`));
  
  
  CREATE TABLE IF NOT EXISTS `Peca` (
  `idPecas` INT NOT NULL auto_increment , 
  `valor peca` FLOAT(12.2) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPecas`));
  
  CREATE TABLE IF NOT EXISTS `Peca_compoe_Ordem_de_servico` (
  `Peca_idPecas` INT NOT NULL,
  `Ordem_de_servico_idOrdem_de_servico` INT NOT NULL,
  PRIMARY KEY (`Peca_idPecas`, `Ordem_de_servico_idOrdem_de_servico`),
  CONSTRAINT `fk_Peca_Ordem_de_servico`FOREIGN KEY (`Peca_idPecas`)REFERENCES `Peca` (`idPecas`),
   CONSTRAINT `fk_Ordem_de_servico_peca`FOREIGN KEY (`Ordem_de_servico_idOrdem_de_servico`)REFERENCES `Ordem_de_servico` (`idOrdem_de_servico`)
   );
   
  CREATE TABLE IF NOT EXISTS `Ordem_de_servico` (
  `idOrdem_de_servico` INT NOT NULL auto_increment unique,
  `data_de_emissao` datetime NOT NULL default current_timestamp,
  `status` ENUM("EM AVALIACAO", ' REALIZANDO SERVIÇO', 'SERVIÇO COMPLETO ') NULL DEFAULT 'EM AVALIACAO' COMMENT 'ENUM(\"EM AVALIACAO\",\'EM SERVIÇO\",\'PRONTO PARA RETIRADA\")',
  `data_conclusao` DATE NOT NULL,
  `Equipe_idEquipe` INT NOT NULL,
  PRIMARY KEY (`idOrdem_de_servico`, `Equipe_idEquipe`),
  CONSTRAINT `fk_Equipe_Ordem_de_servico`FOREIGN KEY (`Equipe_idEquipe`)REFERENCES `Equipe` (`idEquipe`));


  CREATE TABLE IF NOT EXISTS `Ordem_de_servico_contem_Servico` (
  `Ordem_de_servico_idOrdem_de_servico` INT NOT NULL,
  `Servico_idServico` BIGINT NOT NULL,
  PRIMARY KEY (`Ordem_de_servico_idOrdem_de_servico`, `Servico_idServico`),
  CONSTRAINT `fk_Ordem_de_servico_Servico`FOREIGN KEY (`Ordem_de_servico_idOrdem_de_servico`)REFERENCES `Ordem_de_servico` (`idOrdem_de_servico`),
  CONSTRAINT `fk_Servico_Ordem_de_servico`FOREIGN KEY (`Servico_idServico`)REFERENCES `Servico` (`idServico`));
  
  




desc equipe;
drop table cliente;
drop table Valores_mao_de_obra;
drop table Servico;
drop table ordem_de_servico_contem_servico;
drop table ordem_de_servico;
drop table peca;
drop table Peca_compoe_Ordem_de_servico;


drop table equipe;
drop table mecanico;
truncate table endereco;
drop table endereco;
drop table`Cliente_possui_endereco`;
drop table `Cliente_levam_Veiculo`;
drop table `Mecanico_compoe_Equipe`;
