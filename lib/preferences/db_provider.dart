import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/Usuarios.dart';
/*Aquí se creará todo lo que tiene que ver con
la base de datos, la tabla con todos sus valores
y las consultas a esta*/

class DBProvider {
  // Todas las consultas y acciones de la base de datos
  static Database? _database;
  static DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database == null) _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'Usuarios.db');
    print(path);
    //Creacion de la BBDD

    return await openDatabase(path,
        version: 1,
        onOpen:
            (db) {}, // Aquí creamos la base de datos con los valores conseguidos del modelo
        onCreate: (Database db, int version) async {
      await db.execute('''
CREATE TABLE Usuarios(
  id INTEGER PRIMARY KEY,
  name TEXT,
  email TEXT,
  address TEXT,
  phone TEXT,
  photo TEXT
)
''');
    });
  }

  Future<int> inserRawScan(Usuaris nouScan) async {
    // Esta es la función que hará de insert, cogiendo los valores de la tabla y haciendo un rawInsert
    final id = nouScan.id;
    final name = nouScan.name;
    final email = nouScan.email;
    final address = nouScan.address;
    final phone = nouScan.phone;
    final photo = nouScan.photo;

    final db = await database;
    final res = await db.rawInsert(''' 
      INSERT INTO Usuarios(id, email, address, phone, photo)
      VALUES ($id, $name, $email, $address, $phone, $photo)
    ''');
    return res;
  }

  Future<int> insertScan(Usuaris nouScan) async {
    final db = await database;

    final res = await db.insert('Usuarios', nouScan.toMap());
    print(res);
    return res;
  }

  Future<List<Usuaris>> getAllScans() async {
    // se consiguen todos los usuarios de la base de datos local
    final db = await database;
    final res = await db.query('Usuarios');
    return res.isNotEmpty ? res.map((e) => Usuaris.fromMap(e)).toList() : [];
  }

  Future<Usuaris?> getScanById(int id) async {
    // se consigue el usuario a partir de su id
    final db = await database;
    final res = await db.query('Usuarios', where: 'id = ?', whereArgs: [id]);
    if (res.isNotEmpty) {
      return Usuaris.fromMap(res.first);
    }
    return null;
  }

  Future<List<Usuaris>?> getScanByName(String name) async {
    // recoge usuario a partir del nombre
    final db = await database;
    final res = await db.rawQuery('''
 SELECT * FROM Usuarios WHERE name = "$name"
''');

    return res.isNotEmpty ? res.map((e) => Usuaris.fromMap(e)).toList() : [];
  }

  Future<int> updateScan(Usuaris nouScan) async {
    // actualiza un usuario por si fuera necesario
    final db = await database;
    final res = db.update('Usuarios', nouScan.toMap(),
        where: 'id = ?', whereArgs: [nouScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    // bora al usuario
    final db = await database;
    final res = await db.rawDelete('''
    DELETE FROM Usuarios where id = $id
''');
    return res;
  }

  Future<int> deleteAllScans() async {
    // borra todos los usuarios
    final db = await database;
    final res = await db.rawDelete(''' 
    DELETE FROM Usuarios
    ''');
    return res;
  }
}
