-- Desarrollado bajo Oracle SQL Developer --
-- Lenguaje: PL/SQL --
-- Eliminar las tablas si existen --
DROP TABLE Distribuidor CASCADE CONSTRAINTS;
DROP TABLE Producto CASCADE CONSTRAINTS;
DROP TABLE Orden_Producto CASCADE CONSTRAINTS;
DROP TABLE Orden CASCADE CONSTRAINTS;
DROP TABLE Cliente CASCADE CONSTRAINTS;
DROP TABLE Usuario CASCADE CONSTRAINTS;
DROP TABLE Historial CASCADE CONSTRAINTS;

-- Crear las tablas --
CREATE TABLE Distribuidor (
    Id_distribuidor NUMBER(8) NOT NULL,
    Nombre_distribuidor VARCHAR2(50) UNIQUE NOT NULL,
    Telefono_distribuidor NUMBER(8) UNIQUE NOT NULL,
    Correo_electronico_distribuidor VARCHAR2(50) UNIQUE NOT NULL
);

CREATE TABLE Producto (
    Id_producto NUMBER(8) NOT NULL,
    Nombre_producto VARCHAR2(25) NOT NULL,
    Descripcion_producto VARCHAR2(50) NOT NULL,
    Precio_unitario NUMBER(8) NOT NULL,
    Cantidad_disponible NUMBER(8) NOT NULL,
    Id_distribuidor NUMBER(8) NOT NULL
);

CREATE TABLE Orden_Producto (
    Id_orden NUMBER(8) NOT NULL,
    Id_producto NUMBER(8) NOT NULL,
    Cantidad_comprada NUMBER(8) NOT NULL,
    Precio_unitario NUMBER(8) NOT NULL
);

CREATE TABLE Historial (
    Id_historial NUMBER(8) NOT NULL,
    Fecha_historial DATE NOT NULL,
    Precio_unitario NUMBER(8) NOT NULL,
    Id_producto NUMBER(8) NOT NULL
);

CREATE TABLE Orden (
    Id_orden NUMBER(8) NOT NULL,
    Cedula_cliente NUMBER(9) NOT NULL,
    Id_usuario NUMBER(9) NOT NULL,
    Total_orden NUMBER(8) NOT NULL,
    Estado_orden VARCHAR2(25) NOT NULL,
    Fecha_orden DATE NOT NULL
);

CREATE TABLE Cliente (
    Cedula_cliente NUMBER(9) UNIQUE NOT NULL,
    Nombre_cliente VARCHAR2(25) NOT NULL,
    Primer_apellido_cliente VARCHAR2(25) NOT NULL,
    Segundo_apellido_cliente VARCHAR2(25) NOT NULL,
    Direccion_cliente VARCHAR2(30) NOT NULL,
    Telefono_cliente NUMBER(9) UNIQUE NOT NULL,
    Correo_electronico_cliente VARCHAR2(50) UNIQUE NOT NULL
);

CREATE TABLE Usuario (
    ID_usuario NUMBER(9) NOT NULL,
    Nombre_usuario VARCHAR2(25) UNIQUE NOT NULL,
    Contrasena VARCHAR2(25) NOT NULL
);

-- Creacion de las llaves primarias --
ALTER TABLE Distribuidor
ADD (CONSTRAINT PK_Distribuidor 
        PRIMARY KEY (Id_distribuidor)
);

ALTER TABLE Producto
ADD (CONSTRAINT PK_Producto 
        PRIMARY KEY (Id_producto)
);

ALTER TABLE Orden 
ADD (CONSTRAINT PK_Orden 
        PRIMARY KEY (Id_orden)
);

ALTER TABLE Usuario
ADD (CONSTRAINT PK_Usuario 
        PRIMARY KEY (ID_usuario)
);

-- Creacion de las llaves foraneas --

-- Agregar las 2 llaves foraneas a la tabla Orden_Producto --
ALTER TABLE Orden_Producto
ADD (CONSTRAINT FK_Orden 
        FOREIGN KEY (Id_orden)
        REFERENCES Orden(Id_orden)
);

ALTER TABLE Orden_Producto
ADD (CONSTRAINT FK_Producto 
        FOREIGN KEY (Id_producto)
        REFERENCES Producto(Id_producto)
);

-- En producto a distribuidor --
ALTER TABLE Producto
ADD (CONSTRAINT FK_Distribuidor 
        FOREIGN KEY (Id_distribuidor)
        REFERENCES Distribuidor(Id_distribuidor)
);

-- En orden a cliente --
ALTER TABLE Orden
ADD (CONSTRAINT FK_Cliente 
        FOREIGN KEY (Cedula_cliente)
        REFERENCES Cliente(Cedula_cliente)
);

ALTER TABLE Orden
ADD (CONSTRAINT FK_Usuario 
        FOREIGN KEY (Id_Usuario)
        REFERENCES Usuario(Id_usuario)
);

-- Borrar las secuencias si existen --
DROP SEQUENCE Secuencia_Distribuidor;
DROP SEQUENCE Secuencia_Producto;
DROP SEQUENCE Secuencia_Orden;
DROP SEQUENCE Secuencia_Usuario;
DROP SEQUENCE Secuencia_Historial;
-- Los clientes no tienen secuencia porque su llave primaria es la cedula --

-- Crear las secuencias --
CREATE SEQUENCE Secuencia_Distribuidor
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE Secuencia_Producto
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE Secuencia_Orden
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE Secuencia_Usuario
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE Secuencia_Historial
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Insertar datos en las tablas --

-- Insertar datos en la tabla Cliente --
-- 1. Juan Pérez Fernández
INSERT INTO Cliente VALUES (112233445, 'Juan', 'Pérez', 'Fernández', 'Calle Principal #123', 601234567, 'juanperez@gmail.com');
-- 2. María Soto Solano
INSERT INTO Cliente VALUES (223344556, 'María', 'Soto', 'Solano', 'Avenida Central #456', 602345678, 'mariasoto@gmail.com');
-- 3. Luis Vargas Jiménez
INSERT INTO Cliente VALUES (334455667, 'Luis', 'Vargas', 'Jiménez', 'Calle de los Pinos #789', 603456789, 'luisvargas@gmail.com');
-- 4. Ana Rodríguez Morales
INSERT INTO Cliente VALUES (445566778, 'Ana', 'Rodríguez', 'Morales', 'Avenida del Sol #101', 604567890, 'anarodriguez@gmail.com');
-- 5. José Chaves González
INSERT INTO Cliente VALUES (556677889, 'José', 'Chaves', 'González', 'Calle de las Flores #202', 605678901, 'josechaves@gmail.com');
-- 6. Laura Castro Rodríguez
INSERT INTO Cliente VALUES (667788990, 'Laura', 'Castro', 'Rodríguez', 'Avenida de las Palmas #303', 606789012, 'lauracastro@gmail.com');
-- 7. Carlos Ramírez Gómez
INSERT INTO Cliente VALUES (778899001, 'Carlos', 'Ramírez', 'Gómez', 'Calle de las Estrellas #404', 607890123, 'carlosramirez@gmail.com');
-- 8. Adriana González Hernández
INSERT INTO Cliente VALUES (889900112, 'Adriana', 'González', 'Hernández', 'Avenida de los Ríos #505', 608901234, 'adrianagonzalez@gmail.com');
-- 9. Francisco Mora López
INSERT INTO Cliente VALUES (990011223, 'Francisco', 'Mora', 'López', 'Calle de las Montañas #606', 609012345, 'franciscomora@gmail.com');
-- 10. Sofía Morales Rodríguez
INSERT INTO Cliente VALUES (101122334, 'Sofía', 'Morales', 'Rodríguez', 'Avenida del Mar #707', 609123456, 'sofiamorales@gmail.com');
-- 11. David Acuña Sánchez
INSERT INTO Cliente VALUES (111223345, 'David', 'Acuña', 'Sánchez', 'Calle de los Bosques #808', 609234567, 'davidacuna@gmail.com');
-- 12. Valeria López Jiménez
INSERT INTO Cliente VALUES (122334456, 'Valeria', 'López', 'Jiménez', 'Avenida de los Lagos #909', 609345678, 'valerialopez@gmail.com');
-- 13. Alejandro Soto Herrera
INSERT INTO Cliente VALUES (133445567, 'Alejandro', 'Soto', 'Herrera', 'Calle de los Ríos #1010', 609456789, 'alejandrosoto@gmail.com');
-- 14. Valentina Fernández Gutiérrez
INSERT INTO Cliente VALUES (144556678, 'Valentina', 'Fernández', 'Gutiérrez', 'Avenida de las Flores #1111', 609567890, 'valentinafernandez@gmail.com');
-- 15. Felipe Sánchez Castro
INSERT INTO Cliente VALUES (155667789, 'Felipe', 'Sánchez', 'Castro', 'Calle del Sol #1212', 609678901, 'felipesanchez@gmail.com');
-- 16. Carolina Chaves Rojas
INSERT INTO Cliente VALUES (166778890, 'Carolina', 'Chaves', 'Rojas', 'Avenida de los Pinos #1313', 609789012, 'carolinachaves@gmail.com');
-- 17. Manuel Ramírez Pérez
INSERT INTO Cliente VALUES (177889001, 'Manuel', 'Ramírez', 'Pérez', 'Calle de las Palmas #1414', 609890123, 'manuelramirez@gmail.com');
-- 18. Gabriela Vargas Solís
INSERT INTO Cliente VALUES (188900112, 'Gabriela', 'Vargas', 'Solís', 'Avenida de las Estrellas #1515', 609901234, 'gabrielavargas@gmail.com');
-- 19. Javier Morales Soto
INSERT INTO Cliente VALUES (199011223, 'Javier', 'Morales', 'Soto', 'Calle de los Ríos #1616', 609912345, 'javiermorales@gmail.com');
-- 20. María Rodríguez Pérez
INSERT INTO Cliente VALUES (200122334, 'María', 'Rodríguez', 'Pérez', 'Avenida del Mar #1717', 609923456, 'mariarodriguez@gmail.com');
-- 21. Ricardo Mora Jiménez
INSERT INTO Cliente VALUES (211223345, 'Ricardo', 'Mora', 'Jiménez', 'Calle de los Bosques #1818', 609934567, 'ricardomora@gmail.com');
-- 22. Camila Castro Rodríguez
INSERT INTO Cliente VALUES (222334456, 'Camila', 'Castro', 'Rodríguez', 'Avenida de los Lagos #1919', 609945678, 'camilacastro@gmail.com');
-- 23. Guillermo González Solano
INSERT INTO Cliente VALUES (233445567, 'Guillermo', 'González', 'Solano', 'Calle del Sol #2020', 609956789, 'guillermogonzalez@gmail.com');
-- 24. Andrea Sánchez Gómez
INSERT INTO Cliente VALUES (244556678, 'Andrea', 'Sánchez', 'Gómez', 'Avenida de las Flores #2121', 609967890, 'andreasanchez@gmail.com');
-- 25. Pedro Acuña Vargas
INSERT INTO Cliente VALUES (255667789, 'Pedro', 'Acuña', 'Vargas', 'Calle de los Pinos #2222', 609978901, 'pedroacuna@gmail.com');
-- 26. Paola Soto Morales
INSERT INTO Cliente VALUES (266778890, 'Paola', 'Soto', 'Morales', 'Avenida Central #2323', 609989012, 'paolasoto@gmail.com');
-- 27. Andrés López Gutiérrez
INSERT INTO Cliente VALUES (277889001, 'Andrés', 'López', 'Gutiérrez', 'Calle de las Estrellas #2424', 609990123, 'andreslopez@gmail.com');
-- 28. Elena Chaves Herrera
INSERT INTO Cliente VALUES (674564554, 'Elena', 'Chaves', 'Herrera', 'Avenida de los Ríos #2525', 609901134, 'elenachaves2@gmail.com');
-- 29. Cristian Mora Rojas
INSERT INTO Cliente VALUES (546754323, 'Cristian', 'Mora', 'Rojas', 'Calle de las Montañas #2626', 435434576, 'cristianmora2@gmail.com');
-- 30. Daniela Ramírez Sánchez
INSERT INTO Cliente VALUES (634564355, 'Daniela', 'Ramírez', 'Sánchez', 'Avenida del Mar #2727', 609977456, 'danielaramirez2@gmail.com');

-- Insertar datos en la tabla Categoria --
-- 1. Importadora de Materiales ConstruMax
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Importadora de Materiales ConstruMax', 12345678, 'construmax@gmail.com');
-- 2. Grupo Construvalle
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Grupo Construvalle', 23456789, 'construvalle@gmail.com');
-- 3. Suministros EcoCemento
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Suministros EcoCemento', 34567890, 'eco-cemento@gmail.com');
-- 4. Distribuidora Arquitectura Verde
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Distribuidora Arquitectura Verde', 45678901, 'arquitectura-verde@gmail.com');
-- 5. Construcentro del Pacífico
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Construcentro del Pacífico', 56789012, 'construcentro@gmail.com');
-- 6. Ferretería Obras Maestras
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Ferretería Obras Maestras', 67890123, 'obras-maestras@gmail.com');
-- 7. Proveedor ConstruExpress
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Proveedor ConstruExpress', 78901234, 'construexpress@gmail.com');
-- 8. Distribuidora de Materiales Ecolux
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Distribuidora de Materiales Ecolux', 89012345, 'materiales-ecolux@gmail.com');
-- 9. Importadora de ConstruInnova
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Importadora de ConstruInnova', 90123456, 'construinnova@gmail.com');
-- 10. Grupo SumiHogar
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Grupo SumiHogar', 71234567, 'sumihogar@gmail.com');
-- 11. Ferretería ConstruVida
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Ferretería ConstruVida', 13579246, 'construvida@gmail.com');
-- 12. Constructora y Distribuidora CR
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Constructora y Distribuidora CR', 24681357, 'distribuidora-cr@gmail.com');
-- 13. Materiales y Proyectos ConstriMax
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Materiales y Proyectos ConstriMax', 98765432, 'constri-max@gmail.com');
-- 14. Importadora ConstruTech
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Importadora ConstruTech', 87654321, 'construtech@gmail.com');
-- 15. Grupo Innovación en Materiales
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Grupo Innovación en Materiales', 43210987, 'innovacion-materiales@gmail.com');
-- 16. Distribuidora ProCemento
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Distribuidora ProCemento', 32109876, 'procemento@gmail.com');
-- 17. Ferretería EcoConstrucción
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Ferretería EcoConstrucción', 65432109, 'eco-construccion@gmail.com');
-- 18. Constructora y Suministros Aquatech
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Constructora y Suministros Aquatech', 76543210, 'aquatech@gmail.com');
-- 19. Importadora de Materiales ArquiVerde
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Importadora de Materiales ArquiVerde', 10987654, 'materiales-arquiverde@gmail.com');
-- 20. Grupo Constructores del Sur
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Grupo Constructores del Sur', 21098765, 'constructores-sur@gmail.com');
-- 21. Ferretería Proyecto Ideal
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Ferretería Proyecto Ideal', 54321098, 'proyecto-ideal@gmail.com');
-- 22. Distribuidora de Materiales ConstruVerde
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Distribuidora de Materiales ConstruVerde', 43218765, 'construverde@gmail.com');
-- 23. Suministros Innovacasa
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Suministros Innovacasa', 98765431, 'innovacasa@gmail.com');
-- 24. Constructora y Ferretería EcoHabitat
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Constructora y Ferretería EcoHabitat', 87654310, 'ecohabitat@gmail.com');
-- 25. Importadora Materiales Sol y Acero
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Importadora Materiales Sol y Acero', 23451876, 'materiales-sol-acero@gmail.com');
-- 26. Grupo ConstruMundo
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Grupo ConstruMundo', 71826354, 'construmundo@gmail.com');
-- 27. Ferretería Ecológica ConstruRama
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Ferretería Ecológica ConstruRama', 81927645, 'ecologica-construrama@gmail.com');
-- 28. Distribuidora EcoProyectos CR
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Distribuidora EcoProyectos CR', 32619784, 'ecoproyectos-cr@gmail.com');
-- 29. Constructora de Materiales VerdeVanguardia
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Constructora de Materiales VerdeVanguardia', 12349876, 'verde-vanguardia@gmail.com');
-- 30. Importadora de ConstruMateriales Costa Rica
INSERT INTO Distribuidor VALUES (Secuencia_Distribuidor.NEXTVAL, 'Importadora de ConstruMateriales Costa Rica', 39482176, 'construmateriales-cr@gmail.com');

-- Insertar datos en la tabla Producto --
-- 1. Cemento
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Cemento', 'Cemento para construcción de casas', 5000, 100, 1);
-- 2. Arena
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Arena', 'Arena para construcción', 3000, 200, 2);
-- 3. Ladrillos
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Ladrillos', 'Ladrillos de construcción', 6000, 150, 3);
-- 4. Madera
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Madera', 'Madera para estructuras', 7000, 50, 4);
-- 5. Cemento Armado
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Cemento Armado', 'Cemento armado para construcción', 5500, 75, 5);
-- 6. Láminas de Yeso
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Láminas de Yeso', 'Láminas de yeso para interiores', 4000, 120, 6);
-- 7. Láminas de Metal
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Láminas de Metal', 'Láminas de metal para techos', 6500, 90, 7);
-- 8. Ladrillos de Vidrio
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Ladrillos de Vidrio', 'Ladrillos de vidrio decorativos', 5500, 40, 8);
-- 9. Tuberías de PVC
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Tuberías de PVC', 'Tuberías de PVC para plomería', 4500, 180, 9);
-- 10. Cemento Blanco
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Cemento Blanco', 'Cemento blanco para acabados', 6000, 60, 10);
-- 11. Bloques de Concreto
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Bloques de Concreto', 'Bloques de concreto para construcción', 5500, 110, 11);
-- 12. Tejas de Barro
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Tejas de Barro', 'Tejas de barro para techos', 7000, 70, 12);
-- 13. Adhesivo para Azulejos
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Adhesivo para Azulejos', 'Adhesivo para azulejos cerámicos', 4000, 150, 13);
-- 14. Ventanas de Aluminio
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Ventanas de Aluminio', 'Ventanas de aluminio para casas', 6500, 85, 14);
-- 15. Grava
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Grava', 'Grava para construcción', 3500, 220, 15);
-- 16. Mármol
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Mármol', 'Mármol para encimeras', 7500, 30, 16);
-- 17. Pintura Interior
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Pintura Interior', 'Pintura interior para paredes', 4500, 120, 17);
-- 18. Pintura Exterior
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Pintura Exterior', 'Pintura exterior para fachadas', 5000, 110, 18);
-- 19. Cables Eléctricos
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Cables Eléctricos', 'Cables eléctricos para instalaciones', 4800, 160, 19);
-- 20. Aislante Térmico
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Aislante Térmico', 'Aislante térmico para techos', 6000, 50, 20);
-- 21. Lámparas
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Lámparas', 'Lámparas para iluminación', 3500, 180, 21);
-- 22. Grifo de Cocina
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Grifo de Cocina', 'Grifo de cocina de acero inoxidable', 4200, 75, 22);
-- 23. Sanitarios
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Sanitarios', 'Sanitarios de porcelana para baños', 5500, 65, 23);
-- 24. Ventiladores
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Ventiladores', 'Ventiladores de techo', 3800, 140, 24);
-- 25. Tornillos
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Tornillos', 'Tornillos de acero', 3200, 300, 25);
-- 26. Clavos
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Clavos', 'Clavos para carpintería', 3400, 250, 26);
-- 27. Tuberías de Hierro
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Tuberías de Hierro', 'Tuberías de hierro para construcción', 4800, 90, 27);
-- 28. Cinta Métrica
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Cinta Métrica', 'Cinta métrica de acero', 1500, 220, 28);
-- 29. Cepillos de Pintura
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Cepillos de Pintura', 'Cepillos de pintura para acabados', 2000, 180, 29);
-- 30. Tubos de masilla
INSERT INTO Producto VALUES (Secuencia_Producto.NEXTVAL, 'Tubos de masilla', 'Tubos de masilla para acabados', 2500, 150, 30);

-- Insertar datos en la tabla Usuario
-- 1. Insertar usuario Juan P�rez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'juan_perez', 'juan123');

-- 2. Insertar usuario Mar�a G�mez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'maria_gomez', 'maria456');

-- 3. Insertar usuario Pedro Mart�nez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'pedro_martinez', 'pedro789');

-- 4. Insertar usuario Laura Rodr�guez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'laura_rodriguez', 'laura012');

-- 5. Insertar usuario Carlos S�nchez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'carlos_sanchez', 'carlos345');

-- 6. Insertar usuario Ana Gonz�lez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'ana_gonzalez', 'ana678');

-- 7. Insertar usuario David L�pez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'david_lopez', 'david901');

-- 8. Insertar usuario Marta Fern�ndez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'marta_fernandez', 'marta234');

-- 9. Insertar usuario Jos� Hern�ndez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'jose_hernandez', 'jose567');

-- 10. Insertar usuario Luisa Mart�nez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'luisa_martinez', 'luisa789');

-- 11. Insertar usuario Carlos G�mez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'carlos_gomez', 'carlos012');

-- 12. Insertar usuario Elena Rodr�guez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'elena_rodriguez', 'elena345');

-- 13. Insertar usuario Pedro Gonz�lez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'pedro_gonzalez', 'pedro678');

-- 14. Insertar usuario Laura Mart�nez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'laura_martinez', 'laura901');

-- 15. Insertar usuario Daniel S�nchez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'daniel_sanchez', 'daniel234');

-- 16. Insertar usuario Mar�a Hern�ndez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'maria_hernandez', 'maria567');

-- 17. Insertar usuario Juan G�mez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'juan_gomez', 'juan234');

-- 18. Insertar usuario Luis Mart�nez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'luis_martinez', 'luisa567');

-- 19. Insertar usuario Sara Gonz�lez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'sara_gonzalez', 'sara234');

-- 20. Insertar usuario Javier Rodr�guez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'javier_rodriguez', 'javier567');

-- 21. Insertar usuario Ana S�nchez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'ana_sanchez', 'ana234');

-- 22. Insertar usuario Jos� Mart�nez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'jose_martinez', 'jose567');

-- 23. Insertar usuario Laura G�mez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'laura_gomez', 'laura234');

-- 24. Insertar usuario David S�nchez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'david_sanchez', 'david567');

-- 25. Insertar usuario Elena Gonz�lez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'elena_gonzalez', 'elena234');

-- 26. Insertar usuario Carlos Mart�nez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'carlos_martinez', 'carlos567');

-- 27. Insertar usuario Mar�a S�nchez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'maria_sanchez', 'maria234');

-- 28. Insertar usuario Pedro Hern�ndez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'pedro_hernandez', 'pedro567');

-- 29. Insertar usuario Javier G�mez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'javier_gomez', 'javier234');

-- 30. Insertar usuario Luis Gonz�lez
INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena)
VALUES (Secuencia_Usuario.NEXTVAL, 'luis_gonzalez', 'luisa567');

-- Insertar datos en la tabla Orden -- -- Estados: Pendiente, Procesada, Completada, Cancelada --
-- Cuando la orden es procesada, el total cambia de 0 a la suma de los subtotales de los productos --
-- Todas las ordenes tiene el estado "Pendiente" hasta que se procesan --
-- 1. Orden #1
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 112233445, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 2. Orden #2
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 223344556, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 3. Orden #3
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 334455667, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 4. Orden #4
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 445566778, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 5. Orden #5
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 556677889, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 6. Orden #6
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 667788990, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 7. Orden #7
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 778899001, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 8. Orden #8
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 889900112, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 9. Orden #9
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 990011223, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 10. Orden #10
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 101122334, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 11. Orden #11
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 111223345, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 12. Orden #12
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 122334456, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 13. Orden #13
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 133445567, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 14. Orden #14
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 144556678, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 15. Orden #15
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 155667789, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 16. Orden #16
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 166778890, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 17. Orden #17
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 177889001, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 18. Orden #18
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 188900112, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 19. Orden #19
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 199011223, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 20. Orden #20
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 200122334, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 21. Orden #21
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 211223345, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 22. Orden #22
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 222334456, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 23. Orden #23
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 233445567, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 24. Orden #24
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 244556678, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 25. Orden #25
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 255667789, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 26. Orden #26
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 266778890, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 27. Orden #27
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 277889001, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 28. Orden #28
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 674564554, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 29. Orden #29
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 546754323, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
-- 30. Orden #30
INSERT INTO Orden VALUES (Secuencia_Orden.NEXTVAL, 634564355, 1, 0, 'Pendiente', TO_DATE('02-02-2023', 'DD-MM-YYYY'));

-- Insertar datos en la tabla Orden_Producto --
-- Son 30 ordenes con 3 productos cada una, para un total de 90 registros --
-- 1. Orden #1 con Producto #1
INSERT INTO Orden_Producto VALUES (1, 1, 5, 5000);
-- 2. Orden #1 con Producto #2 
INSERT INTO Orden_Producto VALUES (1, 2, 10, 3000);
-- 3. Orden #1 con Producto #3
INSERT INTO Orden_Producto VALUES (1, 3, 15, 6000);

-- 4. Orden #2 con Producto #4
INSERT INTO Orden_Producto VALUES (2, 4, 2, 7000);
-- 5. Orden #2 con Producto #5
INSERT INTO Orden_Producto VALUES (2, 5, 3, 5500);
-- 6. Orden #2 con Producto #6
INSERT INTO Orden_Producto VALUES (2, 6, 4, 4000);

-- 7. Orden #3 con Producto #7
INSERT INTO Orden_Producto VALUES (3, 7, 5, 6500);
-- 8. Orden #3 con Producto #8
INSERT INTO Orden_Producto VALUES (3, 8, 6, 5500);
-- 9. Orden #3 con Producto #9
INSERT INTO Orden_Producto VALUES (3, 9, 7, 4500);

-- 10. Orden #4 con Producto #10
INSERT INTO Orden_Producto VALUES (4, 10, 8, 6000);
-- 11. Orden #4 con Producto #11
INSERT INTO Orden_Producto VALUES (4, 11, 9, 5500);
-- 12. Orden #4 con Producto #12
INSERT INTO Orden_Producto VALUES (4, 12, 10, 7000);

-- 13. Orden #5 con Producto #13
INSERT INTO Orden_Producto VALUES (5, 13, 11, 4000);
-- 14. Orden #5 con Producto #14
INSERT INTO Orden_Producto VALUES (5, 14, 12, 6500);
-- 15. Orden #5 con Producto #15
INSERT INTO Orden_Producto VALUES (5, 15, 13, 3500);

-- 16. Orden #6 con Producto #16
INSERT INTO Orden_Producto VALUES (6, 16, 14, 7500);
-- 17. Orden #6 con Producto #17
INSERT INTO Orden_Producto VALUES (6, 17, 15, 4500);
-- 18. Orden #6 con Producto #18
INSERT INTO Orden_Producto VALUES (6, 18, 16, 5000);

-- 19. Orden #7 con Producto #19
INSERT INTO Orden_Producto VALUES (7, 19, 17, 4800);
-- 20. Orden #7 con Producto #20
INSERT INTO Orden_Producto VALUES (7, 20, 18, 6000);
-- 21. Orden #7 con Producto #21
INSERT INTO Orden_Producto VALUES (7, 21, 19, 3500);

-- 22. Orden #8 con Producto #22
INSERT INTO Orden_Producto VALUES (8, 22, 20, 4200);
-- 23. Orden #8 con Producto #23
INSERT INTO Orden_Producto VALUES (8, 23, 21, 5500);
-- 24. Orden #8 con Producto #24
INSERT INTO Orden_Producto VALUES (8, 24, 22, 3800);

-- 25. Orden #9 con Producto #25
INSERT INTO Orden_Producto VALUES (9, 25, 23, 3200);
-- 26. Orden #9 con Producto #26
INSERT INTO Orden_Producto VALUES (9, 26, 24, 3400);
-- 27. Orden #9 con Producto #27
INSERT INTO Orden_Producto VALUES (9, 27, 25, 4800);

-- 28. Orden #10 con Producto #28
INSERT INTO Orden_Producto VALUES (10, 28, 26, 1500);
-- 29. Orden #10 con Producto #29
INSERT INTO Orden_Producto VALUES (10, 29, 27, 2000);
-- 30. Orden #10 con Producto #30
INSERT INTO Orden_Producto VALUES (10, 30, 28, 2500);

-- 31. Orden #11 con Producto #1
INSERT INTO Orden_Producto VALUES (11, 1, 5, 5000);
-- 32. Orden #11 con Producto #2
INSERT INTO Orden_Producto VALUES (11, 2, 10, 3000);
-- 33. Orden #11 con Producto #3
INSERT INTO Orden_Producto VALUES (11, 3, 15, 6000);

-- 34. Orden #12 con Producto #4
INSERT INTO Orden_Producto VALUES (12, 4, 2, 7000);
-- 35. Orden #12 con Producto #5
INSERT INTO Orden_Producto VALUES (12, 5, 3, 5500);
-- 36. Orden #12 con Producto #6
INSERT INTO Orden_Producto VALUES (12, 6, 4, 4000);

-- 37. Orden #13 con Producto #7
INSERT INTO Orden_Producto VALUES (13, 7, 5, 6500);
-- 38. Orden #13 con Producto #8
INSERT INTO Orden_Producto VALUES (13, 8, 6, 5500);
-- 39. Orden #13 con Producto #9
INSERT INTO Orden_Producto VALUES (13, 9, 7, 4500);

-- 40. Orden #14 con Producto #10
INSERT INTO Orden_Producto VALUES (14, 10, 8, 6000);
-- 41. Orden #14 con Producto #11
INSERT INTO Orden_Producto VALUES (14, 11, 9, 5500);
-- 42. Orden #14 con Producto #12
INSERT INTO Orden_Producto VALUES (14, 12, 10, 7000);

-- 43. Orden #15 con Producto #13
INSERT INTO Orden_Producto VALUES (15, 13, 11, 4000);
-- 44. Orden #15 con Producto #14
INSERT INTO Orden_Producto VALUES (15, 14, 12, 6500);
-- 45. Orden #15 con Producto #15
INSERT INTO Orden_Producto VALUES (15, 15, 13, 3500);

-- 46. Orden #16 con Producto #16
INSERT INTO Orden_Producto VALUES (16, 16, 14, 7500);
-- 47. Orden #16 con Producto #17
INSERT INTO Orden_Producto VALUES (16, 17, 15, 4500);
-- 48. Orden #16 con Producto #18
INSERT INTO Orden_Producto VALUES (16, 18, 16, 5000);

-- 49. Orden #17 con Producto #19
INSERT INTO Orden_Producto VALUES (17, 19, 17, 4800);
-- 50. Orden #17 con Producto #20
INSERT INTO Orden_Producto VALUES (17, 20, 18, 6000);
-- 51. Orden #17 con Producto #21
INSERT INTO Orden_Producto VALUES (17, 21, 19, 3500);

-- 52. Orden #18 con Producto #22
INSERT INTO Orden_Producto VALUES (18, 22, 20, 4200);
-- 53. Orden #18 con Producto #23
INSERT INTO Orden_Producto VALUES (18, 23, 21, 5500);
-- 54. Orden #18 con Producto #24
INSERT INTO Orden_Producto VALUES (18, 24, 22, 3800);

-- 55. Orden #19 con Producto #25
INSERT INTO Orden_Producto VALUES (19, 25, 23, 3200);
-- 56. Orden #19 con Producto #26
INSERT INTO Orden_Producto VALUES (19, 26, 24, 3400);
-- 57. Orden #19 con Producto #27
INSERT INTO Orden_Producto VALUES (19, 27, 25, 4800);

-- 58. Orden #20 con Producto #28
INSERT INTO Orden_Producto VALUES (20, 28, 26, 1500);
-- 59. Orden #20 con Producto #29
INSERT INTO Orden_Producto VALUES (20, 29, 27, 2000);
-- 60. Orden #20 con Producto #30
INSERT INTO Orden_Producto VALUES (20, 30, 28, 2500);

-- 61. Orden #21 con Producto #1
INSERT INTO Orden_Producto VALUES (21, 1, 5, 5000);
-- 62. Orden #21 con Producto #2
INSERT INTO Orden_Producto VALUES (21, 2, 10, 3000);
-- 63. Orden #21 con Producto #3
INSERT INTO Orden_Producto VALUES (21, 3, 15, 6000);

-- 64. Orden #22 con Producto #4
INSERT INTO Orden_Producto VALUES (22, 4, 2, 7000);
-- 65. Orden #22 con Producto #5
INSERT INTO Orden_Producto VALUES (22, 5, 3, 5500);
-- 66. Orden #22 con Producto #6
INSERT INTO Orden_Producto VALUES (22, 6, 4, 4000);

-- 67. Orden #23 con Producto #7
INSERT INTO Orden_Producto VALUES (23, 7, 5, 6500);
-- 68. Orden #23 con Producto #8
INSERT INTO Orden_Producto VALUES (23, 8, 6, 5500);
-- 69. Orden #23 con Producto #9
INSERT INTO Orden_Producto VALUES (23, 9, 7, 4500);

-- 70. Orden #24 con Producto #10
INSERT INTO Orden_Producto VALUES (24, 10, 8, 6000);
-- 71. Orden #24 con Producto #11
INSERT INTO Orden_Producto VALUES (24, 11, 9, 5500);
-- 72. Orden #24 con Producto #12
INSERT INTO Orden_Producto VALUES (24, 12, 10, 7000);

-- 73. Orden #25 con Producto #13
INSERT INTO Orden_Producto VALUES (25, 13, 11, 4000);
-- 74. Orden #25 con Producto #14
INSERT INTO Orden_Producto VALUES (25, 14, 12, 6500);
-- 75. Orden #25 con Producto #15
INSERT INTO Orden_Producto VALUES (25, 15, 13, 3500);

-- 76. Orden #26 con Producto #16
INSERT INTO Orden_Producto VALUES (26, 16, 14, 7500);
-- 77. Orden #26 con Producto #17
INSERT INTO Orden_Producto VALUES (26, 17, 15, 4500);
-- 78. Orden #26 con Producto #18
INSERT INTO Orden_Producto VALUES (26, 18, 16, 5000);

-- 79. Orden #27 con Producto #19
INSERT INTO Orden_Producto VALUES (27, 19, 17, 4800);
-- 80. Orden #27 con Producto #20
INSERT INTO Orden_Producto VALUES (27, 20, 18, 6000);
-- 81. Orden #27 con Producto #21
INSERT INTO Orden_Producto VALUES (27, 21, 19, 3500);

-- 82. Orden #28 con Producto #22
INSERT INTO Orden_Producto VALUES (28, 22, 20, 4200);
-- 83. Orden #28 con Producto #23
INSERT INTO Orden_Producto VALUES (28, 23, 21, 5500);
-- 84. Orden #28 con Producto #24
INSERT INTO Orden_Producto VALUES (28, 24, 22, 3800);

-- 85. Orden #29 con Producto #25
INSERT INTO Orden_Producto VALUES (29, 25, 23, 3200);
-- 86. Orden #29 con Producto #26
INSERT INTO Orden_Producto VALUES (29, 26, 24, 3400);
-- 87. Orden #29 con Producto #27
INSERT INTO Orden_Producto VALUES (29, 27, 25, 4800);

-- 88. Orden #30 con Producto #28
INSERT INTO Orden_Producto VALUES (30, 28, 26, 1500);
-- 89. Orden #30 con Producto #29
INSERT INTO Orden_Producto VALUES (30, 29, 27, 2000);
-- 90. Orden #30 con Producto #30
INSERT INTO Orden_Producto VALUES (30, 30, 28, 2500);

-- CRUD --
-- Means Create, Read, Update, Delete --

-- Paquete para Create, Update y Delete --
create or replace package consultas_CRUD as 

-- CRUD Orden --
procedure create_orden (p_cedula_cliente number, p_total_orden number, p_estado_orden varchar2, p_fecha_order date);

procedure update_orden (p_id_orden number, p_cedula_cliente number, p_total_orden number, p_estado_orden varchar2, p_fecha_order date);

procedure cancel_orden (p_id_orden number);

-- CRUD Distribuidor --
procedure create_distribuidor (p_nombre_distribuidor varchar2, p_correo_electronico_distribuidor varchar2, p_telefono_distribuidor number);

procedure update_distribuidor (p_id_distribuidor number, p_nombre_distribuidor varchar2, p_correo_electronico_distribuidor varchar2, p_telefono_distribuidor number);

procedure delete_distribuidor (p_id_distribuidor number);

-- CRUD Cliente --
procedure create_cliente (p_cedula_cliente number, p_nombre_cliente varchar2, p_primer_apellido_cliente varchar2, p_segundo_apellido_cliente varchar2, p_direccion_cliente varchar2, p_telefono_cliente number, p_correo_electronico_cliente varchar2);

procedure update_cliente (p_cedula_cliente number, p_nombre_cliente varchar2, p_primer_apellido_cliente varchar2, p_segundo_apellido_cliente varchar2, p_direccion_cliente varchar2, p_telefono_cliente number, p_correo_electronico_cliente varchar2);

procedure delete_cliente (p_cedula_cliente number);

-- CRUD Producto --
procedure create_producto (p_nombre_producto varchar2, p_descripcion_producto varchar2, p_precio_unitario number, p_cantidad_disponible number, p_id_distribuidor number);

procedure update_producto (p_id_producto number, p_nombre_producto varchar2, p_descripcion_producto varchar2, p_precio_unitario number, p_cantidad_disponible number, p_id_distribuidor number);

procedure delete_producto (p_id_producto number);

-- CRUD Orden_Producto --
procedure create_orden_producto (p_id_orden number, p_id_producto number, p_cantidad_comprada number, p_precio_unitario number);

procedure update_orden_producto (p_id_orden number, p_id_producto number, p_cantidad_comprada number, p_precio_unitario number);

procedure cancel_orden_producto (p_id_orden number, p_id_producto number);

end consultas_CRUD;
/

-- Cuerpo del paquete para Create, Update y Delete --

create or replace package body consultas_CRUD as

-- CRUD Orden --
procedure create_orden (p_cedula_cliente number, p_total_orden number, p_estado_orden varchar2, p_fecha_order date) 
is
begin
    -- La c�dula del cliente debe tener 9 d�gitos
    if length(to_char(p_cedula_cliente)) != 9 then
      raise_application_error(-20001, 'Error en crear orden: la c�dula del cliente debe tener 9 d�gitos');
    end if;
    -- la cedula del cliente no puede ser negativa --
    if p_cedula_cliente < 0 then
        raise_application_error(-20002, 'Error en crear orden: la cedula del cliente no puede ser negativa');
    end if;
    -- el total de la orden debe ser 0, cuando la orden sea procesada, el total se actualizara --
    if p_total_orden != 0 then
        raise_application_error(-20003, 'Error en crear orden: el total de la orden debe ser 0, cuando la orden sea procesada, el total se actualizara');
    end if;
    -- si la cedula del cliente no existe en la base de datos, no se puede crear la orden --
    /*if p_cedula_cliente not in (select cedula_cliente from Cliente) then
        raise_application_error(-20004, 'Error en crear orden: la cedula del cliente no existe en la base de datos');
    end if;*/
    declare
        v_cedula_existente NUMBER;
    begin
        select count(*) into v_cedula_existente from Cliente where cedula_cliente = p_cedula_cliente;
    if v_cedula_existente = 0 then
        raise_application_error(-20004, 'Error en crear orden: la cedula del cliente no existe en la base de datos');
    end if;
    end;
    -- el estado de la orden debe ser "Pendiente", cuando la orden sea procesada, el estado se actualizara --
    if p_estado_orden != 'Pendiente' then
        raise_application_error(-20005, 'Error en crear orden: el estado de la orden debe ser "Pendiente", cuando la orden sea procesada, el estado se actualizara');
    end if;
    -- la fecha de la orden no puede ser mayor a la fecha actual --
    if p_fecha_order > sysdate then
        raise_application_error(-20006, 'Error en crear orden: la fecha de la orden no puede ser mayor a la fecha actual');
    end if;

    insert into Orden(id_orden, cedula_cliente, total_orden, estado_orden, fecha_orden)
    values (Secuencia_Orden.NEXTVAL, p_cedula_cliente, p_total_orden, p_estado_orden, p_fecha_orden);
    commit;
    DBMS_OUTPUT.PUT_LINE('Orden creada exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en crear orden: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la creacion de la orden');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end create_orden;

procedure update_orden (p_id_orden number, p_cedula_cliente number, p_total_orden number, p_estado_orden varchar2, p_fecha_order date)
is
begin
    if p_id_orden not in (select id_orden from Orden) then
        raise_application_error(-20007, 'Error en actualizar orden: el id de la orden no existe en la base de datos');
    end if;

    if length(p_cedula_cliente) != 9 then
        raise_application_error(-20008, 'Error en actualizar orden: la cedula del cliente debe tener 9 digitos');
    end if;

    if p_cedula_cliente < 0 then
        raise_application_error(-20009, 'Error en actualizar orden: la cedula del cliente no puede ser negativa');
    end if;
    
    if p_cedula_cliente not in (select cedula_cliente from Cliente) then
        raise_application_error(-20010, 'Error en actualizar orden: la cedula del cliente no existe en la base de datos');
    end if;

    if p_total_orden < 0 then
        raise_application_error(-20011, 'Error en actualizar orden: el total de la orden no puede ser negativo');
    end if;

    if p_fecha_orden > sysdate then
        raise_application_error(-20012, 'Error en actualizar orden: la fecha de la orden no puede ser mayor a la fecha actual');
    end if;

    update Orden set cedula_cliente = p_cedula_cliente, 
    total_orden = p_total_orden, 
    estado_orden = p_estado_orden, 
    fecha_orden = p_fecha_orden

    where id_orden = p_id_orden;
    commit;
    DBMS_OUTPUT.PUT_LINE('Orden actualizada exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en actualizar orden: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la actualizacion de la orden');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end update_orden;

procedure cancel_orden (p_id_orden number)
is
begin
    if p_id_orden not in (select id_orden from Orden) then
        raise_application_error(-20013, 'Error en cancelar orden: el id de la orden no existe en la base de datos');
    end if;

    update Orden set estado_orden = 'Cancelada'
    where id_orden = p_id_orden;
    commit;
    DBMS_OUTPUT.PUT_LINE('Orden cancelada exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en cancelar orden: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la cancelacion de la orden');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end cancel_orden;

-- CRUD Distribuidor --
procedure create_distribuidor (p_nombre_distribuidor varchar2, p_correo_electronico_distribuidor varchar2, p_telefono_distribuidor number)
is
begin
    if length(p_telefono_distribuidor) != 8 then
        raise_application_error(-20014, 'Error en crear distribuidor: el telefono del distribuidor debe tener 8 digitos');
    end if;

    if p_telefono_distribuidor < 0 then
        raise_application_error(-20015, 'Error en crear distribuidor: el telefono del distribuidor no puede ser negativo');
    end if;

    if length(p_nombre_distribuidor) > 50 then
        raise_application_error(-20016, 'Error en crear distribuidor: el nombre del distribuidor no puede tener mas de 50 caracteres');
    end if;

    if length(p_correo_electronico_distribuidor) > 50 then
        raise_application_error(-20017, 'Error en crear distribuidor: el correo electronico del distribuidor no puede tener mas de 50 caracteres');
    end if; 

    if p_correo_electronico_distribuidor not like '%@%.%' then
        raise_application_error(-20018, 'Error en crear distribuidor: el correo electronico del distribuidor debe tener un formato valido');
    end if;

    insert into Distribuidor(id_distribuidor, nombre_distribuidor, correo_electronico_distribuidor, telefono_distribuidor)
    values (Secuencia_Distribuidor.NEXTVAL, p_nombre_distribuidor, p_correo_electronico_distribuidor, p_telefono_distribuidor);
    commit;
    DBMS_OUTPUT.PUT_LINE('Distribuidor creado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en crear distribuidor: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la creacion del distribuidor');
            DBMS_OUTPUT.PUT_LINE(sqlcode);

end create_distribuidor;

procedure update_distribuidor (p_id_distribuidor number, p_nombre_distribuidor varchar2, p_correo_electronico_distribuidor varchar2, p_telefono_distribuidor number)
is
begin
    if p_id_distribuidor not in (select id_distribuidor from Distribuidor) then
        raise_application_error(-20019, 'Error en actualizar distribuidor: el id del distribuidor no existe en la base de datos');
    end if;

        if length(p_telefono_distribuidor) != 8 then
        raise_application_error(-20020, 'Error en actualizar distribuidor: el telefono del distribuidor debe tener 8 digitos');
    end if;

    if p_telefono_distribuidor < 0 then
        raise_application_error(-20021, 'Error en actualizar distribuidor: el telefono del distribuidor no puede ser negativo');
    end if;

    if length(p_nombre_distribuidor) > 50 then
        raise_application_error(-20022, 'Error en actualizar distribuidor: el nombre del distribuidor no puede tener mas de 50 caracteres');
    end if;

    if length(p_correo_electronico_distribuidor) > 50 then
        raise_application_error(-20023, 'Error en actualizar distribuidor: el correo electronico del distribuidor no puede tener mas de 50 caracteres');
    end if; 

    if p_correo_electronico_distribuidor not like '%@%.%' then
        raise_application_error(-20024, 'Error en actualizar distribuidor: el correo electronico del distribuidor debe tener un formato valido');
    end if;

    update Distribuidor set nombre_distribuidor = p_nombre_distribuidor, 
    correo_electronico_distribuidor = p_correo_electronico_distribuidor, 
    telefono_distribuidor = p_telefono_distribuidor

    where id_distribuidor = p_id_distribuidor;
    commit;
    DBMS_OUTPUT.PUT_LINE('Distribuidor actualizado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en actualizar distribuidor: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la actualizacion del distribuidor');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end update_distribuidor;

procedure delete_distribuidor (p_id_distribuidor number)
is
begin
    if p_id_distribuidor not in (select id_distribuidor from Distribuidor) then
        raise_application_error(-20025, 'Error en eliminar distribuidor: el id del distribuidor no existe en la base de datos');
    end if;

    delete from Distribuidor
    where id_distribuidor = p_id_distribuidor;
    commit;
    DBMS_OUTPUT.PUT_LINE('Distribuidor eliminado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en eliminar distribuidor: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la eliminacion del distribuidor');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end delete_distribuidor;

-- CRUD Cliente --
procedure create_cliente (p_cedula_cliente number, p_nombre_cliente varchar2, p_primer_apellido_cliente varchar2, p_segundo_apellido_cliente varchar2, p_direccion_cliente varchar2, p_telefono_cliente number, p_correo_electronico_cliente varchar2)
is
begin
    if length(p_cedula_cliente) != 9 then
        raise_application_error(-20026, 'Error en crear cliente: la cedula del cliente debe tener 9 digitos');
    end if;

    if p_cedula_cliente < 0 then
        raise_application_error(-20027, 'Error en crear cliente: la cedula del cliente no puede ser negativa');
    end if;

    if length(p_nombre_cliente) > 25 then 
        raise_application_error(-20028, 'Error en crear cliente: el nombre del cliente no puede tener mas de 25 caracteres');
    end if;

    if length(p_primer_apellido_cliente) > 25 then
        raise_application_error(-20029, 'Error en crear cliente: el primer apellido del cliente no puede tener mas de 25 caracteres');
    end if;

    if length(p_segundo_apellido_cliente) > 25 then
        raise_application_error(-20030, 'Error en crear cliente: el segundo apellido del cliente no puede tener mas de 25 caracteres');
    end if;

    if length(p_direccion_cliente) > 30 then
        raise_application_error(-20031, 'Error en crear cliente: la direccion del cliente no puede tener mas de 30 caracteres');
    end if;

    if length(p_telefono_cliente) != 9 then
        raise_application_error(-20032, 'Error en crear cliente: el telefono del cliente debe tener 9 digitos');
    end if;

    if p_telefono_cliente < 0 then
        raise_application_error(-20033, 'Error en crear cliente: el telefono del cliente no puede ser negativo');
    end if;

    if length(p_correo_electronico_cliente) > 50 then
        raise_application_error(-20034, 'Error en crear cliente: el correo electronico del cliente no puede tener mas de 50 caracteres');
    end if;

    if p_correo_electronico_cliente not like '%@%.%' then
        raise_application_error(-20035, 'Error en crear cliente: el correo electronico del cliente debe tener un formato valido');
    end if;

    insert into Cliente(cedula_cliente, nombre_cliente, primer_apellido_cliente, segundo_apellido_cliente, direccion_cliente, telefono_cliente, correo_electronico_cliente)
    values (p_cedula_cliente, p_nombre_cliente, p_primer_apellido_cliente, p_segundo_apellido_cliente, p_direccion_cliente, p_telefono_cliente, p_correo_electronico_cliente);
    commit;
    DBMS_OUTPUT.PUT_LINE('Cliente creado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en crear cliente: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la creacion del cliente');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end create_cliente;

procedure update_cliente (p_cedula_cliente number, p_nombre_cliente varchar2, p_primer_apellido_cliente varchar2, p_segundo_apellido_cliente varchar2, p_direccion_cliente varchar2, p_telefono_cliente number, p_correo_electronico_cliente varchar2)
is
begin
    if p_cedula_cliente not in (select cedula_cliente from Cliente) then
        raise_application_error(-20036, 'Error en actualizar cliente: la cedula del cliente no existe en la base de datos');
    end if;

    if length(p_cedula_cliente) != 9 then
        raise_application_error(-20037, 'Error en actualizar cliente: la cedula del cliente debe tener 9 digitos');
    end if;

    if p_cedula_cliente < 0 then
        raise_application_error(-20038, 'Error en actualizar cliente: la cedula del cliente no puede ser negativa');
    end if;

    if length(p_nombre_cliente) > 25 then 
        raise_application_error(-20039, 'Error en actualizar cliente: el nombre del cliente no puede tener mas de 25 caracteres');
    end if;

    if length(p_primer_apellido_cliente) > 25 then
        raise_application_error(-20040, 'Error en actualizar cliente: el primer apellido del cliente no puede tener mas de 25 caracteres');
    end if;

    if length(p_segundo_apellido_cliente) > 25 then
        raise_application_error(-20041, 'Error en actualizar cliente: el segundo apellido del cliente no puede tener mas de 25 caracteres');
    end if;

    if length(p_direccion_cliente) > 30 then
        raise_application_error(-20042, 'Error en actualizar cliente: la direccion del cliente no puede tener mas de 30 caracteres');
    end if;

    if length(p_telefono_cliente) != 9 then
        raise_application_error(-20043, 'Error en actualizar cliente: el telefono del cliente debe tener 9 digitos');
    end if;

    if p_telefono_cliente < 0 then
        raise_application_error(-20044, 'Error en actualizar cliente: el telefono del cliente no puede ser negativo');
    end if;

    if length(p_correo_electronico_cliente) > 50 then
        raise_application_error(-20045, 'Error en actualizar cliente: el correo electronico del cliente no puede tener mas de 50 caracteres');
    end if;

    if p_correo_electronico_cliente not like '%@%.%' then
        raise_application_error(-20046, 'Error en actualizar cliente: el correo electronico del cliente debe tener un formato valido');
    end if;

    update Cliente set nombre_cliente = p_nombre_cliente, 
    primer_apellido_cliente = p_primer_apellido_cliente, 
    segundo_apellido_cliente = p_segundo_apellido_cliente, 
    direccion_cliente = p_direccion_cliente, 
    telefono_cliente = p_telefono_cliente, 
    correo_electronico_cliente = p_correo_electronico_cliente

    where cedula_cliente = p_cedula_cliente;
    commit;
    DBMS_OUTPUT.PUT_LINE('Cliente actualizado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en actualizar cliente: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la actualizacion del cliente');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end update_cliente;

procedure delete_cliente (p_cedula_cliente number)
is
begin
    if p_cedula_cliente not in (select cedula_cliente from Cliente) then
        raise_application_error(-20047, 'Error en eliminar cliente: la cedula del cliente no existe en la base de datos');
    end if;

    delete from Cliente
    where cedula_cliente = p_cedula_cliente;
    commit;
    DBMS_OUTPUT.PUT_LINE('Cliente eliminado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en eliminar cliente: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la eliminacion del cliente');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end delete_cliente;

-- CRUD Producto --
procedure create_producto (p_nombre_producto varchar2, p_descripcion_producto varchar2, p_precio_unitario number, p_cantidad_disponible number, p_id_distribuidor number)
is
begin
    if length(p_nombre_producto) > 25 then
        raise_application_error(-20048, 'Error en crear producto: el nombre del producto no puede tener mas de 25 caracteres');
    end if;

    if length(p_descripcion_producto) > 50 then
        raise_application_error(-20049, 'Error en crear producto: la descripcion del producto no puede tener mas de 40 caracteres');
    end if;

    if p_precio_unitario < 0 then
        raise_application_error(-20050, 'Error en crear producto: el precio unitario del producto no puede ser negativo');
    end if;

    if p_cantidad_disponible < 0 then
        raise_application_error(-20051, 'Error en crear producto: la cantidad disponible del producto no puede ser negativa');
    end if;

    if p_id_distribuidor not in (select id_distribuidor from Distribuidor) then
        raise_application_error(-20052, 'Error en crear producto: el id del distribuidor no existe en la base de datos');
    end if;

    insert into Producto(id_producto, nombre_producto, descripcion_producto, precio_unitario, cantidad_disponible, id_distribuidor)
    values (Secuencia_Producto.NEXTVAL, p_nombre_producto, p_descripcion_producto, p_precio_unitario, p_cantidad_disponible, p_id_distribuidor);
    commit;
    DBMS_OUTPUT.PUT_LINE('Producto creado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en crear producto: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la creacion del producto');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end create_producto;

procedure update_producto (p_id_producto number, p_nombre_producto varchar2, p_descripcion_producto varchar2, p_precio_unitario number, p_cantidad_disponible number, p_id_distribuidor number)
is
begin
    if p_id_producto not in (select id_producto from Producto) then
        raise_application_error(-20053, 'Error en actualizar producto: el id del producto no existe en la base de datos');
    end if;

    if length(p_nombre_producto) > 25 then
        raise_application_error(-20054, 'Error en actualizar producto: el nombre del producto no puede tener mas de 25 caracteres');
    end if;

    if length(p_descripcion_producto) > 50 then
        raise_application_error(-20055, 'Error en actualizar producto: la descripcion del producto no puede tener mas de 50 caracteres');
    end if;

    if p_precio_unitario < 0 then
        raise_application_error(-20056, 'Error en actualizar producto: el precio unitario del producto no puede ser negativo');
    end if;

    if p_cantidad_disponible < 0 then
        raise_application_error(-20057, 'Error en actualizar producto: la cantidad disponible del producto no puede ser negativa');
    end if;

    if p_id_distribuidor not in (select id_distribuidor from Distribuidor) then
        raise_application_error(-20058, 'Error en actualizar producto: el id del distribuidor no existe en la base de datos');
    end if;

    update Producto set nombre_producto = p_nombre_producto,
    descripcion_producto = p_descripcion_producto,
    precio_unitario = p_precio_unitario,
    cantidad_disponible = p_cantidad_disponible,
    id_distribuidor = p_id_distribuidor

    where id_producto = p_id_producto;
    commit;
    DBMS_OUTPUT.PUT_LINE('Producto actualizado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en actualizar producto: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la actualizacion del producto');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end update_producto;

procedure delete_producto (p_id_producto number)
is
begin
    if p_id_producto not in (select id_producto from Producto) then
        raise_application_error(-20059, 'Error en eliminar producto: el id del producto no existe en la base de datos');
    end if;

    delete from Producto
    where id_producto = p_id_producto;
    commit;
    DBMS_OUTPUT.PUT_LINE('Producto eliminado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en eliminar producto: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la eliminacion del producto');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end delete_producto;

-- CRUD Orden_Producto --
procedure create_orden_producto (p_id_orden number, p_id_producto number, p_cantidad_comprada number, p_precio_unitario number)
is
begin
    if p_id_orden not in (select id_orden from Orden) then
        raise_application_error(-20060, 'Error en crear orden_producto: el id de la orden no existe en la base de datos');
    end if;

    if p_id_producto not in (select id_producto from Producto) then
        raise_application_error(-20061, 'Error en crear orden_producto: el id del producto no existe en la base de datos');
    end if;

    if p_cantidad_comprada < 0 then
        raise_application_error(-20062, 'Error en crear orden_producto: la cantidad comprada no puede ser negativa');
    end if;

    if p_precio_unitario < 0 then
        raise_application_error(-20063, 'Error en crear orden_producto: el precio unitario no puede ser negativo');
    end if;

    if p_cantidad_comprada > (select cantidad_disponible from Producto where id_producto = p_id_producto) then
        raise_application_error(-20064, 'Error en crear orden_producto: la cantidad comprada no puede ser mayor a la cantidad disponible del producto');
    end if;

    if p_precio_unitario != (select precio_unitario from Producto where id_producto = p_id_producto) then
        raise_application_error(-20065, 'Error en crear orden_producto: el precio unitario no puede ser diferente al precio unitario del producto');
    end if;

    insert into Orden_Producto(id_orden, id_producto, cantidad_comprada, precio_unitario)
    values (p_id_orden, p_id_producto, p_cantidad_comprada, p_precio_unitario);
    commit;
    DBMS_OUTPUT.PUT_LINE('Orden_Producto creado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en crear orden_producto: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la creacion del orden_producto');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end create_orden_producto;

procedure update_orden_producto (p_id_orden number, p_id_producto number, p_cantidad_comprada number, p_precio_unitario number)
is
begin
    if p_id_orden not in (select id_orden from Orden) then
        raise_application_error(-20066, 'Error en actualizar orden_producto: el id de la orden no existe en la base de datos');
    end if;

    if p_id_producto not in (select id_producto from Producto) then
        raise_application_error(-20067, 'Error en actualizar orden_producto: el id del producto no existe en la base de datos');
    end if;

    if p_cantidad_comprada < 0 then
        raise_application_error(-20068, 'Error en actualizar orden_producto: la cantidad comprada no puede ser negativa');
    end if;

    if p_precio_unitario < 0 then
        raise_application_error(-20069, 'Error en actualizar orden_producto: el precio unitario no puede ser negativo');
    end if;

    if p_cantidad_comprada > (select cantidad_disponible from Producto where id_producto = p_id_producto) then
        raise_application_error(-20070, 'Error en actualizar orden_producto: la cantidad comprada no puede ser mayor a la cantidad disponible del producto');
    end if;

    if p_precio_unitario != (select precio_unitario from Producto where id_producto = p_id_producto) then
        raise_application_error(-20071, 'Error en actualizar orden_producto: el precio unitario no puede ser diferente al precio unitario del producto');
    end if;

    update Orden_Producto set cantidad_comprada = p_cantidad_comprada,
    precio_unitario = p_precio_unitario

    where id_orden = p_id_orden and id_producto = p_id_producto;
    commit;
    DBMS_OUTPUT.PUT_LINE('Orden_Producto actualizado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en actualizar orden_producto: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la actualizacion del orden_producto');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end update_orden_producto;

procedure cancel_orden_producto (p_id_orden number, p_id_producto number)
is
begin 
    if p_id_orden not in (select id_orden from Orden) then
        raise_application_error(-20072, 'Error en cancelar orden_producto: el id de la orden no existe en la base de datos');
    end if;

    if p_id_producto not in (select id_producto from Producto) then
        raise_application_error(-20073, 'Error en cancelar orden_producto: el id del producto no existe en la base de datos');
    end if;

    update Orden_Producto set cantidad_comprada = 0,
    precio_unitario = 0

    where id_orden = p_id_orden and id_producto = p_id_producto;
    commit;
    DBMS_OUTPUT.PUT_LINE('Orden_Producto cancelado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en cancelar orden_producto: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la cancelacion del orden_producto');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end cancel_orden_producto;

end consultas_CRUD;
/



-- Paquete para Read --
create or replace package read_consultas as 

-- Read Orden --
procedure select_orden (p_id_orden number, cursor_orden out sys_refcursor);

-- Read Distribuidor --
procedure select_distribuidor (p_id_distribuidor number, cursor_distribuidor out sys_refcursor);

-- Read Cliente --
procedure select_cliente (p_cedula_cliente number, cursor_cliente out sys_refcursor);

-- Read Producto --
procedure select_producto (p_id_producto number, cursor_producto out sys_refcursor);

-- Read Orden_Producto --
procedure select_orden_producto (p_id_orden number, p_id_producto number, cursor_orden_producto out sys_refcursor);
end read_consultas;
/

-- cuerpo del paquete Read --
create or replace package body read_consultas as

-- Read Orden --
procedure select_orden (p_id_orden number, cursor_orden out sys_refcursor)
is
begin
    if p_id_orden not in (select id_orden from Orden) then
        raise_application_error(-20074, 'Error en leer orden: el id de la orden no existe en la base de datos');
    end if;

    open cursor_orden for
    select ID_ORDEN ,
           CEDULA_CLIENTE ,
           TOTAL_ORDEN ,
           ESTADO_ORDEN ,
           FECHA_ORDEN  
    from Orden
    where id_orden = p_id_orden;
    DBMS_OUTPUT.PUT_LINE('Orden seleccionada exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en leer orden: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la lectura de la orden');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end select_orden;

-- Read Distribuidor --
procedure select_distribuidor (p_id_distribuidor number, cursor_distribuidor out sys_refcursor)
is
begin
    if p_id_distribuidor not in (select id_distribuidor from Distribuidor) then
        raise_application_error(-20075, 'Error en leer distribuidor: el id del distribuidor no existe en la base de datos');
    end if;

    open cursor_distribuidor for
    select ID_DISTRIBUIDOR ,
           NOMBRE_DISTRIBUIDOR ,
           TELEFONO_DISTRIBUIDOR ,
           CORREO_ELECTRONICO_DISTRIBUIDOR  
    from Distribuidor
    where id_distribuidor = p_id_distribuidor;
    DBMS_OUTPUT.PUT_LINE('Distribuidor seleccionado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en leer distribuidor: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la lectura del distribuidor');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end select_distribuidor;

-- Read Cliente --
procedure select_cliente (p_cedula_cliente number, cursor_cliente out sys_refcursor)
is
begin
    if p_cedula_cliente not in (select cedula_cliente from Cliente) then
        raise_application_error(-20076, 'Error en leer cliente: la cedula del cliente no existe en la base de datos');
    end if;

    if length(p_cedula_cliente) != 9 then
        raise_application_error(-20077, 'Error en leer cliente: la cedula del cliente debe tener 9 digitos');
    end if;

    if p_cedula_cliente < 0 then
        raise_application_error(-20078, 'Error en leer cliente: la cedula del cliente no puede ser negativa');
    end if;

    open cursor_cliente for
    select CEDULA_CLIENTE ,
           NOMBRE_CLIENTE ,
           PRIMER_APELLIDO_CLIENTE ,
           SEGUNDO_APELLIDO_CLIENTE ,
           DIRECCION_CLIENTE ,
           TELEFONO_CLIENTE ,
           CORREO_ELECTRONICO_CLIENTE  from Cliente
    where cedula_cliente = p_cedula_cliente;
    DBMS_OUTPUT.PUT_LINE('Cliente seleccionado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en leer cliente: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la lectura del cliente');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end select_cliente;

-- Read Producto --
procedure select_producto (p_id_producto number, cursor_producto out sys_refcursor)
is
begin
    if p_id_producto not in (select id_producto from Producto) then
        raise_application_error(-20079, 'Error en leer producto: el id del producto no existe en la base de datos');
    end if;

    open cursor_producto for
    select ID_PRODUCTO ,
           NOMBRE_PRODUCTO ,
           DESCRIPCION_PRODUCTO ,
           PRECIO_UNITARIO ,
           CANTIDAD_DISPONIBLE ,
           ID_DISTRIBUIDOR
    from Producto
    where id_producto = p_id_producto;
    DBMS_OUTPUT.PUT_LINE('Producto seleccionado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en leer producto: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la lectura del producto');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end select_producto;

-- Read Orden_Producto --
procedure select_orden_producto (p_id_orden number, p_id_producto number, cursor_orden_producto out sys_refcursor)
is
begin
    if p_id_orden not in (select id_orden from Orden) then
        raise_application_error(-20080, 'Error en leer orden_producto: el id de la orden no existe en la base de datos');
    end if;

    if p_id_producto not in (select id_producto from Producto) then
        raise_application_error(-20081, 'Error en leer orden_producto: el id del producto no existe en la base de datos');
    end if;

    open cursor_orden_producto for
    select ID_ORDEN ,
           ID_PRODUCTO ,
           CANTIDAD_COMPRADA ,
           PRECIO_UNITARIO
    from Orden_Producto
    where id_orden = p_id_orden and id_producto = p_id_producto;
    DBMS_OUTPUT.PUT_LINE('Orden_Producto seleccionado exitosamente');

    exception
        -- otros errores --
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Error inesperado en leer orden_producto: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Error en la lectura del orden_producto');
            DBMS_OUTPUT.PUT_LINE(sqlcode);
end select_orden_producto;
end read_consultas;
/

-- Trigger para actualizar el total de la orden --
create or replace trigger trigger_actualizar_total_orden after insert or update on Orden_Producto 
    for each row
    declare
        v_total_orden number;
    begin
        v_total_orden := funciones_procedimientos.calcular_total_orden(:new.id_orden);
        update Orden set total_orden = v_total_orden,
        estado_orden = 'Procesada'

        where id_orden = :new.id_orden;
        commit;
end;
/

-- Trigger para restar la cantidad comprada del producto a la cantidad disponible del producto --
create or replace trigger trigger_restar_cantidad_comprada after insert or update on Orden_Producto 
    for each row
    declare
        v_cantidad_disponible number;
    begin
        v_cantidad_disponible := funciones_procedimientos.restar_cantidad_comprada(:new.id_orden, :new.id_producto, :new.cantidad_comprada);
        update Producto set cantidad_disponible = v_cantidad_disponible

        where id_producto = :new.id_producto;
        commit;
end;
/

-- Trigger para la inserci�n en la tabla historial
CREATE OR REPLACE TRIGGER trigger_actualizar_historial
AFTER INSERT OR UPDATE OF precio_unitario ON Producto
FOR EACH ROW
BEGIN
    -- Insertar enla tabla Historial
    INSERT INTO Historial(id_historial, fecha_historial, precio_unitario, id_producto)
    VALUES (secuencia_historial.NEXTVAL, SYSDATE, :NEW.precio_unitario, :NEW.id_producto);
END;
/


-- Paquete para Funciones y procedimientos que no sean CRUD --
create or replace package funciones_procedimientos as

-- Funcion para calcular el total de la orden --
function calcular_total_orden (p_id_orden number) return number;

-- Funcion para restar la cantidad comprada del producto a la cantidad disponible del producto --
function restar_cantidad_comprada (p_id_orden number, p_id_producto number, p_cantidad_comprada number) return number;

-- Resumen sobre transacciones --

-- Hacer Por ejemplo, cantidad de arti�culos o montos
    PROCEDURE resumen_transaccional (mes DATE);
-- vendidos por mes. Dicha informacion debe incluir al menos 2 tablas relacionadas. Deben utilizar
-- al menos 2 de los tipo de JOINs vistos en clase.
end funciones_procedimientos;
/

-- cuerpo del paquete Funciones y procedimientos que no sean CRUD --
create or replace package body funciones_procedimientos as

-- Funcion para calcular el total de la orden --
function calcular_total_orden (p_id_orden number) return number
is
    v_total_orden number;
begin
    select sum(cantidad_comprada * precio_unitario) into v_total_orden
    from Orden_Producto
    where id_orden = p_id_orden;

    return v_total_orden;
end calcular_total_orden;

-- Funcion para restar la cantidad comprada del producto a la cantidad disponible del producto --
function restar_cantidad_comprada (p_id_orden number, p_id_producto number, p_cantidad_comprada number) return number
is
    v_cantidad_disponible number;
begin
    select cantidad_disponible into v_cantidad_disponible
    from Producto
    where id_producto = p_id_producto;

    v_cantidad_disponible := v_cantidad_disponible - p_cantidad_comprada;

    return v_cantidad_disponible;
    
    end restar_cantidad_comprada;

PROCEDURE resumen_transaccional (
    mes DATE
    -- Agrega m�s par�metros si es necesario
) AS
    -- Declaraci�n de variables locales
    vdistribuidor Distribuidor.nombre_distribuidor%TYPE;
    vsuma NUMBER(10);
    
    CURSOR dist IS
        SELECT d.nombre_distribuidor AS distribuidor, SUM(op.precio_unitario) AS vendido
        FROM Distribuidor d
        LEFT JOIN Producto p ON d.id_distribuidor = p.id_distribuidor
        INNER JOIN Orden_Producto op ON p.id_producto = op.id_producto
        RIGHT JOIN Orden o ON op.id_orden = o.id_orden
        WHERE o.fecha_orden BETWEEN mes AND mes+30
        GROUP BY d.nombre_distribuidor
        ORDER BY SUM(op.precio_unitario) DESC;
    
    -- Agrega m�s variables si es necesario
BEGIN
    -- Inicio del bloque ejecutable

    -- C�digo del procedimiento aqu�
    -- Usa los par�metros y variables declaradas
    
    FOR reg IN dist LOOP
        DBMS_OUTPUT.put_line('Nombre: ' || reg.distribuidor || ', Vendido: ' || reg.vendido);
    END LOOP;
    -- Si surge alguna excepci�n, se captura y se maneja aqu�
    EXCEPTION
        WHEN OTHERS THEN
            -- C�digo de manejo de cualquier otra excepci�n no especificada
            DBMS_OUTPUT.PUT_LINE('Algo');
            DBMS_OUTPUT.PUT_LINE(sqlcode);

END resumen_transaccional;


end funciones_procedimientos;
/