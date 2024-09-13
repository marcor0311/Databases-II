-- tabla categoria
DROP TABLE CATEGORIA;

CREATE TABLE CATEGORIA(
 id VARCHAR2(40) NOT NULL,
 descripcion VARCHAR2(100) NOT NULL,
 CONSTRAINT pk_categoria PRIMARY KEY(id)
)

-- tabla proveedor
DROP TABLE PROVEEDOR;

CREATE TABLE PROVEEDOR(
 id NUMBER(10) NOT NULL,
 nombre VARCHAR2(50) NOT NULL,
 descripcion VARCHAR2(100) NOT NULL,
 direccion VARCHAR2(100) NOT NULL,
 CONSTRAINT pk_proveedor PRIMARY KEY(id)
);

INSERT INTO CATEGORIA (id, descripcion)
VALUES ('Bebida_energetica1', '{"nombre": "Powerade", "detalles": "Bebida energética con electrolitos"}');

INSERT INTO CATEGORIA (id, descripcion)
VALUES ('Bebida_energetica2', '{"nombre": "Gatorade", "detalles": "Bebida energética para rehidratación"}');

INSERT INTO PROVEEDOR (id, nombre, descripcion, direccion)
VALUES ('proveedor1', 'Distribuidora Powerade CR', 
    '{"tipo": "distribuidora de bebidas energéticas", "productos_destacados": ["Powerade Fruit Punch", "Powerade Mixed Berry"]}', 
    '{"calle": "Calle Los laureles", "ciudad": "San Jose", "pais": "Costa Rica"}'
);

INSERT INTO PROVEEDOR (id, nombre, descripcion, direccion)
VALUES ('proveedor2', 'Distribuidora Gatorade CR', 
    '{"tipo": "distribuidora de bebidas energéticas", "productos_destacados": ["Gatorade Tropical Fruit", "Gatorade Cool Blue"]}', 
    '{"calle": "Calle Los Santos", "ciudad": "Heredia", "pais": "Costa Rica"}'
);

UPDATE CATEGORIA
SET descripcion = '{"nombre": "Prime", "detalles": "Bebida energética para deportistas de alto rendimiento"}'
WHERE id = 'Bebida_energetica1';

UPDATE PROVEEDOR
SET descripcion = '{"tipo": "distribuidora de bebidas energéticas", "pais": "Costa Rica", "productos_destacados": ["Powerade Orange", "Powerade Strawberry"]}',
    direccion = '{"calle": "Calle La Arboleda", "ciudad": "Heredia", "pais": "Costa Rica"}'
WHERE id = 'proveedor1';

DELETE FROM CATEGORIA
WHERE id = ('Bebida_energetica2');

DELETE FROM PROVEEDOR
WHERE id = 'proveedor2';

SELECT id
FROM CATEGORIA
WHERE JSON_EXISTS(descripcion, '$.detalles');

SELECT JSON_VALUE(descripcion, '$.nombre') AS nombre
FROM CATEGORIA
WHERE id = 'Bebida_energetica1';

SELECT PROVEEDOR.nombre AS PROVEEDOR, JSON.producto_destacado
FROM PROVEEDOR,
     JSON_TABLE(PROVEEDOR.descripcion, '$.productos_destacados[*]'
       COLUMNS (
         producto_destacado VARCHAR2(50) PATH '$'
       )
     ) JSON;

-- Tira tura porque sí se encontró el wikir.
SELECT CASE WHEN json_exists('{"wikir" : 123}', '$.wikir') THEN 'true' ELSE 'false' END AS ttt FROM DUAL;

-- Tira false porque tamar no es wikir.
SELECT CASE WHEN json_exists('{"tamar" : 123}', '$.wikir') THEN 'true' ELSE 'false' END AS ttt FROM DUAL;

-- Preparación para la prueba 2
CREATE TABLE tartar (
	jalor VARCHAR2(100)
);

-- Índice para la columna
CREATE INDEX ix
  ON tartar(jalor)
  INDEXTYPE IS CTXSYS.CONTEXT
  PARAMETERS ('SECTION GROUP CTXSYS.JSON_SECTION_GROUP SYNC (ON COMMIT)');

INSERT INTO tartar VALUES('{"wikir" : 123}');
INSERT INTO tartar VALUES('{"wikir" : "Wakitaki"}');
INSERT INTO tartar VALUES('{"timar" : "Wakitaki"}');

COMMIT;
-- Devuleve {"wikir" : "Wakitaki"}
SELECT * FROM tartar WHERE json_textcontains(jalor, '$.wikir', '"Wakitaki"');

-- Tira true porque la estructura en sí del texto sí es correcta.
SELECT CASE WHEN '{"hola" : [213, 32432, 23432423, 4]}' IS JSON THEN 'true' ELSE 'false' END AS ttt FROM DUAL;

-- Tira false porque se quitó una doble comilla
SELECT CASE WHEN '{"hola : [213, 32432, 23432423, 4]}' IS JSON THEN 'true' ELSE 'false' END AS ttt FROM DUAL;


-- Preparación del ejemplo
CREATE TYPE t01 AS OBJECT
  (valor1 VARCHAR2(10),
   valor2 int);

CREATE TYPE t02 AS OBJECT
  (valor VARCHAR2(10),
   tipo t01);

CREATE TABLE tamino (
	valor1 t01,
	valor2 t02,
	valor3 int
	);

INSERT INTO tamino VALUES(
	t01('hola', 5), t02('adios', t01('no', 4)), 101
);



-- Serealizamos a “tamino”
SELECT json_object(valor1, valor2, valor3) from tamino;


-- Deserealizamos un JSON en forma textual al tipo t02
SELECT json_value('{"VALOR":"adios","TIPO":{"VALOR1":"no","VALOR2":4}}', '$' RETURNING t02).valor FROM DUAL;
