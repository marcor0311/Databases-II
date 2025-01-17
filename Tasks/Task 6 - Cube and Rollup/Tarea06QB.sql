DROP TABLE ventas;

CREATE TABLE ventas ( sucursal_id NUMBER NOT NULL,
linea_distribucion_id NUMBER NOT NULL, producto_id NUMBER NOT NULL, cantidad_producto NUMBER NOT NULL, monto NUMBER(10,2) NOT NULL);

INSERT INTO ventas SELECT
TRUNC(DBMS_RANDOM.value(low => 1, high => 3)) , TRUNC(DBMS_RANDOM.value(low => 1, high => 6)) , TRUNC(DBMS_RANDOM.value(low => 1, high => 11)) , TRUNC(DBMS_RANDOM.value(low => 1, high => 7)) , ROUND(DBMS_RANDOM.value(low => 1000, high => 10000), 2)
FROM dual CONNECT BY level <= 1000;

--1.1
SELECT sucursal_id, producto_id, COUNT(cantidad_producto) AS cantidad_producto, SUM(monto) AS monto
FROM ventas
GROUP BY sucursal_id, producto_id
ORDER BY sucursal_id, producto_id;

--1.2
SELECT v.sucursal_id AS sucursal, v.producto_id AS producto, COUNT(*) AS filas, SUM(v.monto) AS monto
FROM ventas v
GROUP BY ROLLUP (v.sucursal_id, v.producto_id)
ORDER BY v.sucursal_id, v.producto_id;

--1.3
SELECT sucursal_id, producto_id, COUNT(*) AS filas, SUM(monto) AS monto
FROM ventas 
GROUP BY CUBE (sucursal_id, producto_id);

--1.4
SELECT 
DECODE(GROUPING(sucursal_id), 1, 'Todos', sucursal_id) as sucursal_id, 
DECODE(GROUPING(producto_id), 1, 'Todos', producto_id) AS producto_id, COUNT(*) AS filas, SUM(monto) AS monto
FROM ventas 
GROUP BY CUBE (sucursal_id, producto_id);
