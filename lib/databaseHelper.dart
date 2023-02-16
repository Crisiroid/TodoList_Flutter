// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unnecessary_new, camel_case_types


import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class todo {
  final int? id;
  final String name;
  todo({this.id, required this.name});
  factory todo.fromMap(Map<String, dynamic> json) => new todo(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class databaseHelper {
  databaseHelper._privateConstructor();
  static final databaseHelper instance = databaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todolist(
        id INTEGER PRIMARY KEY, 
        name TEXT
      )
''');
  }

  Future<List<todo>> getTodoList() async {
    Database db = await instance.database;
    var todoo = await db.query('todolist', orderBy: 'name');

    List<todo> todolist =
        todoo.isNotEmpty ? todoo.map((e) => todo.fromMap(e)).toList() : [];
    return todolist;
  }

  Future<int> add(todo todooo) async {
    Database db = await instance.database;
    return await db.insert('todolist', todooo.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database; 
    return await db.delete('todolist', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(todo Todo) async{
    Database db = await instance.database;
    return await db.update('todolist', Todo.toMap(), where: 'id = ?', whereArgs: [Todo.id] );
  }
}