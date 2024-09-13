// Select the database to use.
use('Suministro_Construccion');

// Insert a few documents into the sales collection.
db.getCollection('Distribuidor').insertMany([
  { 'id': 0, 'nombre': 'Importadora de Materiales ContruMax', 'telefono': 12345678, 'correo': 'construmax@gmail.com' },
  { 'id': 1, 'nombre': 'Grupo Construvalle', 'telefono': 23456789, 'correo': 'construvalle@gmail.com' },
  { 'id': 2, 'nombre': 'Suministros EcoCemento', 'telefono': 34567890, 'correo': 'eco-cemento@gmail.com' },
  { 'id': 3, 'nombre': 'Distribuidora Arquitectura Verde', 'telefono': 45678901, 'correo': 'arquitectura-verde@gmail.com' },
  { 'id': 4, 'nombre': 'Construcentro Pacifico', 'telefono': 56789012, 'correo': 'construcentro@gmail.com' }
]);

db.getCollection('Producto').insertMany([
  { 'id': 0, 'nombre': 'Cemento', 'descripcion': 'Cemento para construccion', 'precio_unitario': 5000, 'cantidad_stock': 100 },
  { 'id': 1, 'nombre': 'Arena', 'descripcion': 'Arena para construccion', 'precio_unitario': 3000, 'cantidad_stock': 200 },
  { 'id': 2, 'nombre': 'Ladrillos', 'descripcion': 'Ladrillos de construccion', 'precio_unitario': 6000, 'cantidad_stock': 150 },
  { 'id': 3, 'nombre': 'Madera', 'descripcion': 'Madera para estructuras', 'precio_unitario': 7000, 'cantidad_stock': 50 },
  { 'id': 4, 'nombre': 'Cemento Armado', 'descripcion': 'Cemento armado para construccion', 'precio_unitario': 5500, 'cantidad_stock': 75 }
])

db.getCollection('Cliente').insertMany([
  { 'id': 112233445, 'nombre': 'Juan', 'primer_apellido': 'Perez', 'segundo_apellido': 'Fernandez', 'direccion': 'Calle Principal #123', 'telefono': 601234567, 'correo_electronico': 'juanperez@gmail.com' },
  { 'id': 223344556, 'nombre': 'Maria', 'primer_apellido': 'Solo', 'segundo_apellido': 'Solano', 'direccion': 'Avenida Central #456', 'telefono': 602345678, 'correo_electronico': 'mariasoto@gmail.com' },
  { 'id': 334455667, 'nombre': 'Luis', 'primer_apellido': 'Vargas', 'segundo_apellido': 'Jimenez', 'direccion': 'Calle de los Pinos #789', 'telefono': 603456789, 'correo_electronico': 'luisvargas@gmail.com' },
  { 'id': 445566778, 'nombre': 'Ana', 'primer_apellido': 'Rodriguez', 'segundo_apellido': 'Morales', 'direccion': 'Avenida del Sol #101', 'telefono': 604567890, 'correo_electronico': 'anarodriguez@gmail.com' },
  { 'id': 556677889, 'nombre': 'Jose', 'primer_apellido': 'Chaves', 'segundo_apellido': 'Gonzalez', 'direccion': 'Calle de las Flores #202', 'telefono': 605678901, 'correo_electronico': 'josechavez@gmail.com' }
])

// Ejemplos CRUD
// Create
use('Suministro_Construccion');
db.getCollection('Distribuidor').insertOne({
  'id': 5,
  'nombre': 'Importadora de Materiales ContruEstebanQuito',
  'telefono': 87654321,
  'correo': 'construestebanquito@gmail.com'
})

db.getCollection('Cliente').insertMany([
  { 'id': 321459879, 'nombre': 'Bruce', 'primer_apellido': 'Wayne', 'segundo_apellido': 'Diaz', 'direccion': 'Ciudad Gotica #123', 'telefono': 607418529, 'correo_electronico': 'soybatman@incwayne.com' },
  { 'id': 789654123, 'nombre': 'Petter', 'primer_apellido': 'B', 'segundo_apellido': 'Parker', 'direccion': 'New York #456', 'telefono': 606548520, 'correo_electronico': 'spiderman@gmail.com' }
])

// Read
use('Suministro_Construccion');
db.getCollection('Cliente').findOne({"nombre": 'Petter'})

use('Suministro_Construccion');
db.getCollection('Distribuidor').find({'telefono': 87654321})

// Update
use('Suministro_Construccion');
db.getCollection('Producto').updateOne({nombre: 'Cemento'}, {$set:{descripcion: "Cemento para simientos."}})

use('Suministro_Construccion');
db.getCollection('Cliente').replaceOne({nombre: 'Bruce'}, {nombre: 'Bruno'})

// Delete
use('Suministro_Construccion');
db.getCollection('Distribuidor').deleteOne({nombre: 'Importadora de Materiales ContruEstebanQuito'})

use('Suministro_Construccion');
db.getCollection('Cliente').deleteMany({nombre: 'Petter'})
//Termina Curd


//INDICES
use('Suministro_Construccion');
db.getCollection('Cliente').createIndex( {id: 1}, {name: "cliente_id"})
db.getCollection('Cliente').getIndexes()

//RESTRICCIONES
//Consulta Compleja
use('Suministro_Construccion');
var nombreCliente = 'Juan'; 
db.getCollection('Cliente').find({ 'nombre': nombreCliente })

//TIPOS DE DATOS
//Fecha y hora
use('Investigacion');

db.getCollection('Tiempo').insertOne({
  usuario: "EjemploUsuario123",
  actividad: "Caminata nocturna",
  fecha_hora: new ISODate("2023-09-15T08:00:00Z")
})


//Geolocalización 
use('Investigacion');

db.getCollection('Transporte').insertOne({
  "camion_id": "CamionIntel21",
  "ubicacion_actual": {
     "type": "Point",
     "coordinates": [ 40.7128, -74.0060 ]
  },
  "entrega": "Pedido54",
  "fecha_registro": "2023-09-25T15:30:00Z"
})

//String
use('Investigacion');

db.getCollection('Universidad').insertMany([
{ "nombre": "Jorge Esteban Benavides Castro",
  "carrera": "Ing. en computación",
  "correo": "est.benavides@estudiantec.cr"},
{"nombre": "P. F. Kvist D.",
  "carrera": "Ing. en computación",
  "correo": "pau.kvist@estudiantec.cr"}
])

//Double
use('Investigacion');

db.getCollection('Transacciones').insertMany([
  {
    "nombre": "George Steven Benson Cast",
    "saldo_bancario": 1500.50 
  },
  {
    "nombre": "Adam Walker",
    "saldo_bancario": 2500.75
  }
]);

//Array
use('Investigacion');

db.getCollection('PizzaPlanet').insertOne({
  "scrum_master": "Cristopher Chanto",
  "tareas_sprint": [
            "Levantar requerimientos",
            "Validar requerimientos con el cliente",
            "Hacer una reunion con el developer team",
            "Sprint retrospective"
  	     ]
})

