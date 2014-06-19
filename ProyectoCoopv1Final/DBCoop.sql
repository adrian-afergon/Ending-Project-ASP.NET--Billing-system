DROP DATABASE DB_FACTURACION;
GO

CREATE DATABASE DB_FACTURACION;
GO

use DB_FACTURACION;

CREATE TABLE TB_Clientes (
COD_CLI int IDENTITY PRIMARY KEY NOT NULL,
Nombre char(30) NOT NULL,
Apellidos char(50) NOT NULL,
Telefono char(9),
Direccion char(100) NOT NULL,
DNI char(9) NOT NULL,
DNI_AS1 char(9),
DNI_AS2 char(9),
DNI_AS3 char(9)
);

CREATE TABLE TB_Stock(
COD_PRO int IDENTITY PRIMARY KEY NOT NULL,
Casa char(25) NOT NULL,
Nombre char(25) NOT NULL,
Descripcion char(255)NOT NULL,
Familia char(25) NOT NULL,
Precio money NOT NULL,
Imagen image,
Cantidad int DEFAULT 0,
CantidadMin int DEFAULT 15
);

CREATE TABLE TB_Vendedor(
COD_VEN int IDENTITY PRIMARY KEY NOT NULL,
Nombre char(25) NOT NULL,
Telefono char(9) NOT NULL
);

CREATE TABLE TB_Facturas(
COD_FAC int IDENTITY PRIMARY KEY NOT NULL,
Fecha datetime,
COD_CLI int NOT NULL,
COD_VEN int NOT NULL,
Total money NOT NULL,
FOREIGN KEY (COD_CLI) references TB_Clientes (COD_CLI),
FOREIGN KEY (COD_VEN) references TB_Vendedor(COD_VEN)
);

CREATE TABLE TB_ART_FAC(
COD_FAC int NOT NULL,
COD_PRO int NOT NULL,
Cantidad_PRO int NOT NULL,
PRIMARY KEY (COD_FAC,COD_PRO),
FOREIGN KEY (COD_PRO) references TB_Stock(COD_PRO),
FOREIGN KEY (COD_FAC) references TB_Facturas(COD_FAC)
);