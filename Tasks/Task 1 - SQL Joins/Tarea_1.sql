-- Eliminar las tablas si existen --
DROP TABLE t1_MedicoXEspecialidad;
DROP TABLE t1_MedicoXHospital;
DROP TABLE t1_Especialidad;
DROP TABLE t1_Medico;
DROP TABLE t1_Hospital;

-- Creacion de las tablas junto con sus llaves primarias y foraneas. --
CREATE TABLE t1_Hospital (
    id NUMBER(8),
    nombre VARCHAR2(30),
    provincia VARCHAR2(30)
);

CREATE TABLE t1_Medico (
    id NUMBER(8),
    cedula NUMBER(9),
    nombre VARCHAR2(30),
    primer_apellido VARCHAR2(30),
    direccion_provincia VARCHAR2(30)
);

CREATE TABLE t1_Especialidad (
    id NUMBER(8),
    nombre VARCHAR2(30)
);

CREATE TABLE t1_MedicoXHospital (
    medico_id NUMBER(8),
    hospital_id NUMBER(8)
);

CREATE TABLE t1_MedicoXEspecialidad (
    medico_id NUMBER(8),
    especialidad_id NUMBER(8)
);

-- Creacion de las llaves primarias. --

ALTER TABLE t1_Hospital
ADD ( CONSTRAINT t1_hospital_id_pk
       		 PRIMARY KEY (id)
    );

ALTER TABLE t1_Medico
ADD ( CONSTRAINT t1_medico_id_pk
       		 PRIMARY KEY (id)
    );
    
ALTER TABLE t1_Especialidad
ADD ( CONSTRAINT t1_especialidad_id_pk
       		 PRIMARY KEY (id)
    );

ALTER TABLE t1_MedicoXHospital
ADD ( CONSTRAINT t1_medicoxhospital_id_pk
       		 PRIMARY KEY (medico_id, hospital_id)
    );

ALTER TABLE t1_MedicoXEspecialidad
ADD ( CONSTRAINT t1_medicoxespecialidad_id_pk
       		 PRIMARY KEY (medico_id, especialidad_id)
    );

-- Creacion de las llaves foraneas. --

ALTER TABLE t1_MedicoXHospital
ADD ( CONSTRAINT t1_medicoxhospital_t1_medico_fk
        	 FOREIGN KEY (medico_id)
          	  REFERENCES t1_Medico(id) 
    );

ALTER TABLE t1_MedicoXHospital
ADD ( CONSTRAINT t1_medicoxhospital_t1_hospital_fk
        	 FOREIGN KEY (hospital_id)
          	  REFERENCES t1_Hospital(id) 
    );

ALTER TABLE t1_MedicoXEspecialidad
ADD ( CONSTRAINT t1_medicoxespecialidad_t1_medico_fk
        	 FOREIGN KEY (medico_id)
          	  REFERENCES t1_Medico(id) 
    );

ALTER TABLE t1_MedicoXEspecialidad
ADD ( CONSTRAINT t1_medicoxespecialidad_t1_Especialidad_fk
        	 FOREIGN KEY (especialidad_id)
          	  REFERENCES t1_Especialidad(id) 
    );
    
-- Inserts. --

INSERT INTO t1_Hospital VALUES (1, 'Hospital Max Peralta', 'Cartago');
INSERT INTO t1_Hospital VALUES (2, 'Hospital San Rafael', 'Alajuela');
INSERT INTO t1_Hospital VALUES (3, 'Hospital San Vicente de Paul', 'Heradia');

INSERT INTO t1_Medico VALUES (1, 400710076, 'Gloria', 'Morales', 'Alajuela');
INSERT INTO t1_Medico VALUES (2, 106510656, 'Andrea', 'Porras', 'Heredia');
INSERT INTO t1_Medico VALUES (3, 498766535, 'Aurelio', 'Sanabria', 'Alajuela');
INSERT INTO t1_Medico VALUES (4, 378798765, 'Jaime', 'Vargas', 'Cartago');

INSERT INTO t1_Especialidad VALUES (1, 'Cardiologo');
INSERT INTO t1_Especialidad VALUES (2, 'Alergologo');
INSERT INTO t1_Especialidad VALUES (3, 'Pediatra');
INSERT INTO t1_Especialidad VALUES (4, 'Nutricionista');

INSERT INTO t1_MedicoXHospital VALUES (1, 2);
INSERT INTO t1_MedicoXHospital VALUES (1, 3);
INSERT INTO t1_MedicoXHospital VALUES (4, 3);

INSERT INTO t1_MedicoXEspecialidad(medico_id, especialidad_id) VALUES (1, 1);
INSERT INTO t1_MedicoXEspecialidad(medico_id, especialidad_id) VALUES (1, 2);
INSERT INTO t1_MedicoXEspecialidad(medico_id, especialidad_id) VALUES (2, 3);
INSERT INTO t1_MedicoXEspecialidad(medico_id, especialidad_id) VALUES (2, 4);
INSERT INTO t1_MedicoXEspecialidad(medico_id, especialidad_id) VALUES (3, 4);
INSERT INTO t1_MedicoXEspecialidad(medico_id, especialidad_id) VALUES (4, 4);

-- Consulta 1.1.--
SELECT h.nombre AS nombre, m.cedula, m.nombre AS nombre_1, m.primer_apellido,
       m.direccion_provincia
FROM t1_Hospital h
INNER JOIN t1_MedicoXHospital mxh ON h.id = mxh.hospital_id
INNER JOIN t1_Medico m ON mxh.medico_id = m.id
INNER JOIN t1_MedicoXEspecialidad mxe ON m.id = mxe.medico_id
INNER JOIN t1_Especialidad e ON mxe.especialidad_id = e.id AND e.nombre = 'Cardiologo';

-- Consulta 1.2.--
SELECT m.cedula, m.nombre, m.primer_apellido, m.direccion_provincia, h.nombre as nombre_1, e.nombre as nombre_2
FROM t1_medico m
LEFT JOIN t1_medicoxhospital mh ON m.id = mh.medico_id
LEFT JOIN t1_hospital h ON mh.hospital_id = h.id
FULL JOIN t1_medicoxespecialidad me ON m.id = me.medico_id
FULL JOIN t1_especialidad e ON me.especialidad_id = e.id
ORDER BY m.cedula, h.nombre;

-- Consulta 1.3.--
SELECT h.nombre, e.nombre as nombre_1
FROM t1_hospital h
LEFT JOIN t1_medicoxhospital mh ON h.id = mh.hospital_id
LEFT JOIN t1_medico m ON mh.medico_id = m.id
LEFT JOIN t1_medicoxespecialidad me ON m.id = me.medico_id
LEFT JOIN t1_especialidad e ON me.especialidad_id = e.id
ORDER BY h.id, e.nombre;

-- Consulta 2.1.--
SELECT products.id, products.name 
FROM products 
LEFT JOIN categories ON products.id_categories = categories.id WHERE categories.name LIKE 'super%';

-- Consulta 2.2. --
SELECT c.name, r.rentals_date
FROM customers c
INNER JOIN rentals r
ON c.id = r.id_customers
WHERE r.rentals_date BETWEEN TO_DATE('01/09/2016', 'DD/MM/YYYY') AND 
                             TO_DATE('30/09/2016', 'DD/MM/YYYY');

-- Consulta 2.3. --
SELECT p.name, c.name
FROM products p
LEFT JOIN categories c ON p.id_categories = c.id
WHERE p.amount > 100 AND p.id_categories IN (1, 2, 3, 6, 9)
ORDER BY p.id_categories ASC;