exec sp_help TB_Stock;
exec sp_help TB_clientes;
exec sp_help TB_vendedor;

INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa1','Veneno para vina','Descripción','Veneno',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa1','Veneno para papa','Descripción','Veneno',9.90,15,5);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa1','Millo','Descripción','Pienso',20.30,5,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa2','Ruideas','Descripción','Herramientas',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa3','Correa','Descripción','Herramientas',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa4','Avena','Descripción','Pienso',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa4','Granulado','Descripción','Pienso',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa5','Cebada','Descripción','Pienso',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa5','Madre Reproductora','Descripción','Pienso',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa5','Granulado Engorde','Descripción','Pienso',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa5','Alpiste','Descripción','Pienso',15.60,20,10);
INSERT INTO TB_Stock (Casa, Nombre, Descripcion, Familia,Precio,Cantidad, cantidadMin) values
('Casa5','Correa Distribucion','Descripción','Herramientas',15.60,20,10);


INSERT INTO TB_clientes (Nombre, apellidos,Telefono,Direccion,DNI,DNI_AS1,DNI_AS2,DNI_AS3) values
('Contado', '-','-','-','-','-','-','-')
INSERT INTO TB_clientes (Nombre, apellidos,Telefono,Direccion,DNI,DNI_AS1,DNI_AS2,DNI_AS3) values
('Adrián', 'Ferrera González','666666666','Camino Las Gavias 138','54113074P','54113074P','54113074P','54113074P')
INSERT INTO TB_clientes (Nombre, apellidos,Telefono,Direccion,DNI,DNI_AS1,DNI_AS2,DNI_AS3) values
('Jose Antonio', 'Ferrera Ramallo','666666666','Camino Las Gavias 138','54113074P','54113074P','54113074P','54113074P')
INSERT INTO TB_clientes (Nombre, apellidos,Telefono,Direccion,DNI,DNI_AS1,DNI_AS2,DNI_AS3) values
('Pepe', 'Pérez Pérez','666666666','Camino Las Gavias 138','54113074P','54113074P','54113074P','54113074P')
INSERT INTO TB_clientes (Nombre, apellidos,Telefono,Direccion,DNI,DNI_AS1,DNI_AS2,DNI_AS3) values
('Juan', 'Álvarez González','666666666','Camino Las Gavias 89','54113074P','54113074P','54113074P','54113074P')
INSERT INTO TB_clientes (Nombre, apellidos,Telefono,Direccion,DNI,DNI_AS1,DNI_AS2,DNI_AS3) values
('Sandra', 'da Luz Garcia','666666666','Camino Las Gavias 138','54113074P','54113074P','54113074P','54113074P')
INSERT INTO TB_clientes (Nombre, apellidos,Telefono,Direccion,DNI,DNI_AS1,DNI_AS2,DNI_AS3) values
('Luis Javier', 'da Silva Salvador','666666666','La Salle Edificio 34 Puerta B Santa Cruz de Tenerife','54113074P','54113074P','54113074P','54113074P')

INSERT INTO TB_vendedor(nombre, telefono) values ('Vendedor 1','999999999');

SELECT * FROM TB_Stock WHERE COD_PRO = 5;