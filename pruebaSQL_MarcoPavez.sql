#Se desactiva modo seguro de SQL
SET SQL_SAFE_UPDATES = 0;

## Se eliminan tablas en caso de que existan previamente
#DROP TABLE IF EXISTS modelamiento_tienda.boletaCompra;
#DROP TABLE IF EXISTS modelamiento_tienda.clientes;
#DROP TABLE IF EXISTS modelamiento_tienda.ventas;
#DROP TABLE IF EXISTS modelamiento_tienda.producto;
#DROP TABLE IF EXISTS modelamiento_tienda.tipo_producto;
#DROP TABLE IF EXISTS modelamiento_tienda.proveedor;

#Se crea esquema a modelar
CREATE SCHEMA IF NOT EXISTS modelamiento_tienda;

#Dentro del esquema, se crean tablas, columnas y PK para estructurar base de datos
CREATE TABLE `modelamiento_tienda`.`productos`(
`producto_id` INT NOT NULL AUTO_INCREMENT,
`nombreProducto` VARCHAR (50) NOT NULL,
`precioProducto` INT NOT NULL,
`stock` INT NOT NULL,
PRIMARY KEY (`producto_id`));


#En este caso, la tabla boletaCompra debe contener 2 PK, ya que se deben ingresar varios productos_id dentro de una misma boleta_id
CREATE TABLE `modelamiento_tienda`.`boletaCompra`(
`boleta_id` INT NOT NULL AUTO_INCREMENT,
`producto_id` INT NOT NULL,
`precioCompra` INT NOT NULL,
`fecha` DATE NOT NULL,
PRIMARY KEY (`boleta_id`,`producto_id`));

CREATE TABLE `modelamiento_tienda`.`clientes`(
`cliente_id` INT NOT NULL AUTO_INCREMENT,
`nombre` VARCHAR (40) NOT NULL,
PRIMARY KEY (`cliente_id`));

CREATE TABLE `modelamiento_tienda`.`proveedores`(
`proveedor_id` INT NOT NULL AUTO_INCREMENT,
`nombreProveedor` VARCHAR (40) NOT NULL,
`frecuenciaVisita` VARCHAR (30) NOT NULL,
PRIMARY KEY (`proveedor_id`));

CREATE TABLE `modelamiento_tienda`.`tipo_producto`(
`tipoProducto_id` INT NOT NULL AUTO_INCREMENT,
`grupoAlimenticio` VARCHAR (30) NOT NULL,
`aptoVegetarianos` BOOLEAN,
`aptoVeganos` BOOLEAN,
PRIMARY KEY (`tipoProducto_id`));

#Se agregan nuevas columnas tabla X para convertirlas en FK de tabla Y
ALTER TABLE modelamiento_tienda.boletacompra ADD cliente_id INT NOT NULL;
ALTER TABLE modelamiento_tienda.boletacompra ADD CONSTRAINT clienteBoleta FOREIGN KEY (cliente_id) REFERENCES modelamiento_tienda.clientes(cliente_id);

#En este caso, no es necesario crear una nueva columna producto_id, pero se ejecuta igualmente el comando para convertirla en FK
ALTER TABLE modelamiento_tienda.boletacompra ADD CONSTRAINT boletaProdudcto FOREIGN KEY (producto_id) REFERENCES modelamiento_tienda.productos(producto_id);

ALTER TABLE modelamiento_tienda.productos ADD proveedor_id INT NOT NULL;
ALTER TABLE modelamiento_tienda.productos ADD CONSTRAINT proveedorProducto FOREIGN KEY (proveedor_id) REFERENCES modelamiento_tienda.proveedores(proveedor_id);

ALTER TABLE modelamiento_tienda.productos ADD tipoProducto_id INT NOT NULL;
ALTER TABLE modelamiento_tienda.productos ADD CONSTRAINT tipoProducto FOREIGN KEY (tipoProducto_id) REFERENCES modelamiento_tienda.tipo_producto(tipoProducto_id);

#Se comienza a agregar valores a cada tabla
INSERT INTO modelamiento_tienda.clientes (cliente_id,nombre) VALUES (1,'Vanessa Cayunao');
INSERT INTO modelamiento_tienda.clientes (nombre) VALUES ('Marco Pavez');
INSERT INTO modelamiento_tienda.clientes (nombre) VALUES ('Sandra Zamora');
INSERT INTO modelamiento_tienda.clientes (nombre) VALUES ('Luz Vergara');
INSERT INTO modelamiento_tienda.clientes (nombre) VALUES ('Víctor Oyarzún');


INSERT INTO modelamiento_tienda.proveedores (proveedor_id,nombreProveedor,frecuenciaVisita) VALUES (1,'Sebastian Salgado','Semanal');
INSERT INTO modelamiento_tienda.proveedores (nombreProveedor,frecuenciaVisita) VALUES ('Ayrton Contreras','Mensual');
INSERT INTO modelamiento_tienda.proveedores (nombreProveedor,frecuenciaVisita) VALUES ('Daniel Carvajal','Semanal');
INSERT INTO modelamiento_tienda.proveedores (nombreProveedor,frecuenciaVisita) VALUES ('Milovan Severich','Mensual');
INSERT INTO modelamiento_tienda.proveedores (nombreProveedor,frecuenciaVisita) VALUES ('Nicolas Hernandez','Semanal');
INSERT INTO modelamiento_tienda.proveedores (nombreProveedor,frecuenciaVisita) VALUES ('Nicolas Romero','Semanal');


INSERT INTO modelamiento_tienda.tipo_producto (tipoProducto_id,grupoAlimenticio,aptoVegetarianos,aptoVeganos) VALUES (901,'Granos',true,true);
INSERT INTO modelamiento_tienda.tipo_producto (grupoAlimenticio,aptoVegetarianos,aptoVeganos) VALUES ('Verduras',true,true);
INSERT INTO modelamiento_tienda.tipo_producto (grupoAlimenticio,aptoVegetarianos,aptoVeganos) VALUES ('Frutas',true,true);
INSERT INTO modelamiento_tienda.tipo_producto (grupoAlimenticio,aptoVegetarianos,aptoVeganos) VALUES ('Productos lacteos',true,false);
INSERT INTO modelamiento_tienda.tipo_producto (grupoAlimenticio,aptoVegetarianos,aptoVeganos) VALUES ('Proteina (legumbres)',true,true);
INSERT INTO modelamiento_tienda.tipo_producto (grupoAlimenticio,aptoVegetarianos,aptoVeganos) VALUES ('Proteina (carnes)',false,false);


INSERT INTO modelamiento_tienda.productos (producto_id,precioProducto,stock,proveedor_id,tipoProducto_id,nombreProducto) VALUES (1,2500,10,6,906,'Hamburguesas');
INSERT INTO modelamiento_tienda.productos (precioProducto,stock,proveedor_id,tipoProducto_id,nombreProducto) VALUES (3000,5,5,905,'Lentejas');
INSERT INTO modelamiento_tienda.productos (precioProducto,stock,proveedor_id,tipoProducto_id,nombreProducto) VALUES (2000,5,3,903,'Platano');
INSERT INTO modelamiento_tienda.productos (precioProducto,stock,proveedor_id,tipoProducto_id,nombreProducto) VALUES (3500,7,4,904,'Leche');
INSERT INTO modelamiento_tienda.productos (precioProducto,stock,proveedor_id,tipoProducto_id,nombreProducto) VALUES (2000,10,4,904,'Yogur');
INSERT INTO modelamiento_tienda.productos (precioProducto,stock,proveedor_id,tipoProducto_id,nombreProducto) VALUES (1000,5,2,902,'Lechuga');
INSERT INTO modelamiento_tienda.productos (precioProducto,stock,proveedor_id,tipoProducto_id,nombreProducto) VALUES (5000,3,2,902,'Zapallo');
INSERT INTO modelamiento_tienda.productos (precioProducto,stock,proveedor_id,tipoProducto_id,nombreProducto) VALUES (2000,8,1,901,'Arroz');


INSERT INTO modelamiento_tienda.boletacompra (boleta_id,precioCompra,fecha,producto_id,cliente_id) VALUES (1,5500,'2022-11-09',1,1);
INSERT INTO modelamiento_tienda.boletacompra (boleta_id,precioCompra,fecha,producto_id,cliente_id) VALUES (1,5500,'2022-11-09',2,1);
INSERT INTO modelamiento_tienda.boletacompra (boleta_id,precioCompra,fecha,producto_id,cliente_id) VALUES (2,3000,'2022-10-27',2,2);
INSERT INTO modelamiento_tienda.boletacompra (boleta_id,precioCompra,fecha,producto_id,cliente_id) VALUES (3,12000,'2022-10-15',7,3);
INSERT INTO modelamiento_tienda.boletacompra (boleta_id,precioCompra,fecha,producto_id,cliente_id) VALUES (3,12000,'2022-10-15',1,3);
INSERT INTO modelamiento_tienda.boletacompra (boleta_id,precioCompra,fecha,producto_id,cliente_id) VALUES (3,12000,'2022-10-15',4,3);
INSERT INTO modelamiento_tienda.boletacompra (boleta_id,precioCompra,fecha,producto_id,cliente_id) VALUES (3,12000,'2022-10-15',6,3);
INSERT INTO modelamiento_tienda.boletacompra (boleta_id,precioCompra,fecha,producto_id,cliente_id) VALUES (4,2500,'2022-10-17',1,1);
INSERT INTO modelamiento_tienda.boletacompra (boleta_id,precioCompra,fecha,producto_id,cliente_id) VALUES (5,6000,'2022-11-17',8,4);
INSERT INTO modelamiento_tienda.boletacompra (boleta_id,precioCompra,fecha,producto_id,cliente_id) VALUES (5,6000,'2022-11-17',3,4);
INSERT INTO modelamiento_tienda.boletacompra (boleta_id,precioCompra,fecha,producto_id,cliente_id) VALUES (5,6000,'2022-11-17',5,4);
INSERT INTO modelamiento_tienda.boletacompra (boleta_id,precioCompra,fecha,producto_id,cliente_id) VALUES (6,5000,'2022-11-06',7,5);

#Visualizacion de cada tabla
SELECT * FROM modelamiento_tienda.boletacompra;

# Al ver la tabla boletaCompra, me percate de la necesidad de crear otra tabla que contenga la boleta_id y el valor de la venta por separado, a fin de no repetir datos.
SELECT * FROM modelamiento_tienda.clientes;
SELECT * FROM modelamiento_tienda.productos;
SELECT * FROM modelamiento_tienda.proveedores;
SELECT * FROM modelamiento_tienda.tipo_producto;


# La siguiente query muestra el nombre del producto, su stock original, su precio individual y su respectiva inversión total
SELECT nombreProducto, stock, precioProducto, stock*precioProducto AS inversionTotal_porStock 
FROM modelamiento_tienda.productos;

# La siguiente query muestra la cantidad de ventas realizadas y el valor total de ellas
SELECT COUNT(DISTINCT boleta_id) AS total_ventas, SUM(DISTINCT precioCompra) AS precioTotal_ventas
FROM modelamiento_tienda.boletacompra;

#La siguiente query muestra el total de productos comprados y el total invertido en estos productos (la suma de los precios de todo el stock comprado)
SELECT SUM(stock) AS cantidadProductos_comprados, SUM(stock*precioProducto) AS inversion_total
FROM modelamiento_tienda.productos;

#La finalidad de la siguiente query es tener la resta de total_ventas (ganancias) respecto a la inversion_total (gastos), pero tiene un error: la suma de stock*precioProducto da un valor incorrecto (115500 en lugar de 130500), asumo que por perdida de datos luego del INNER JOIN
#Esta resta se puede realizar cambiando la coma de la linea 134 por un signo - 
#SELECT SUM(DISTINCT precioCompra) AS total_ventas, SUM(DISTINCT stock*precioProducto) AS inversion_total
#FROM modelamiento_tienda.productos
#INNER JOIN modelamiento_tienda.boletacompra ON boletacompra.producto_id = productos.producto_id;

# La siguiente query muestra el nombre del producto, su stock original, la cantidad vendida de cada producto en todas las ventas realizadas y el stock actual. Se cumple la consulta con JOIN
SELECT nombreProducto, stock, COUNT(nombreProducto) AS veces_vendido, stock - COUNT(nombreProducto) AS stock_actual
FROM modelamiento_tienda.boletacompra
INNER JOIN modelamiento_tienda.productos ON boletacompra.producto_id = productos.producto_id
GROUP BY nombreProducto;