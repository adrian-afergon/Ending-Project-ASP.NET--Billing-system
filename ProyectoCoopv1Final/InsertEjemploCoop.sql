exec sp_help TB_Stock;
exec sp_help TB_clientes;
exec sp_help TB_vendedor;

INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa1','Veneno para vina','Descripci�n','Veneno',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa1','Veneno para papa','Descripci�n','Veneno',9.90,15,5);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa1','Millo','Descripci�n','Pienso',20.30,5,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa2','Ruideas','Descripci�n','Herramientas',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa3','Correa','Descripci�n','Herramientas',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa4','Avena','Descripci�n','Pienso',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa4','Granulado','Descripci�n','Pienso',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa5','Cebada','Descripci�n','Pienso',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa5','Madre Reproductora','Descripci�n','Pienso',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa5','Granulado Engorde','Descripci�n','Pienso',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa5','Alpiste','Descripci�n','Pienso',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa5','Correa Distribucion','Descripci�n','Herramientas',15.60,20,10);


INSERT INTO TB_clientes (Nombre, apellidos,Telefono,Direccion,DNI,DNI_AS1,DNI_AS2,DNI_AS3) values
('Contado', '-','-','-','-','-','-','-')
INSERT INTO TB_clientes (Nombre, apellidos,Telefono,Direccion,DNI,DNI_AS1,DNI_AS2,DNI_AS3) values
('Adri�n', 'Ferrera Gonz�lez','666666666','Camino Las Gavias 138','54113074P','54113074P','54113074P','54113074P')
INSERT INTO TB_clientes (Nombre, apellidos,Telefono,Direccion,DNI,DNI_AS1,DNI_AS2,DNI_AS3) values
('Jose Antonio', 'Ferrera Ramallo','666666666','Camino Las Gavias 138','54113074P','54113074P','54113074P','54113074P')
INSERT INTO TB_clientes (Nombre, apellidos,Telefono,Direccion,DNI,DNI_AS1,DNI_AS2,DNI_AS3) values
('Pepe', 'P�rez P�rez','666666666','Camino Las Gavias 138','54113074P','54113074P','54113074P','54113074P')
INSERT INTO TB_clientes (Nombre, apellidos,Telefono,Direccion,DNI,DNI_AS1,DNI_AS2,DNI_AS3) values
('Juan', '�lvarez Gonz�lez','666666666','Camino Las Gavias 89','54113074P','54113074P','54113074P','54113074P')
INSERT INTO TB_clientes (Nombre, apellidos,Telefono,Direccion,DNI,DNI_AS1,DNI_AS2,DNI_AS3) values
('Sandra', 'da Luz Garcia','666666666','Camino Las Gavias 138','54113074P','54113074P','54113074P','54113074P')
INSERT INTO TB_clientes (Nombre, apellidos,Telefono,Direccion,DNI,DNI_AS1,DNI_AS2,DNI_AS3) values
('Luis Javier', 'da Silva Salvador','666666666','La Salle Edificio 34 Puerta B Santa Cruz de Tenerife','54113074P','54113074P','54113074P','54113074P')

INSERT INTO TB_vendedor(nombre, telefono) values ('Vendedor 1','999999999');

SELECT * FROM TB_Stock WHERE COD_PRO = 5;