import 'dart:io';
import 'package:lect_list/Data/task.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database dataBase;
  static final String tableTodo = 'todo';
  static final String columnId = '_vid';
  static final String columnTitle = 'title';
  static final String columnDone = 'done';

  DBHelper._();

  static DBHelper dbHelper = DBHelper._();

  Future<Database> initDatabase() async {
    if (dataBase == null) {
      dataBase = await createConnectionWithDatabase();
      return dataBase;
    } else
      return dataBase;
  }

  Future<Database> createConnectionWithDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String databaseName = 'tasks.db';
    String dpPath = appDocPath + '/$databaseName';
    Database dataBase = await openDatabase(
      dpPath,
      version: 1,
      onCreate: (dataBase, v) async {
        await dataBase.execute('''CREATE TABLE $tableTodo ( 
  $columnId INTEGER PRIMARY KEY AUTOINCREMENT, 
  $columnTitle TEXT ,
  $columnDone INTEGER )
        ''');
      },
    );
    return dataBase;
  }

  insertTask(Task task) async {
    Database database = await initDatabase();
    await database.insert(tableTodo, task.toMap());
  }

  Future<List<Task>> getAllTasks() async {
    Database database = await initDatabase();
    List<Map<String, Object>> rows = await database.query(tableTodo);
    List<Task> tasks = rows.map((e) => Task.fromMap(e)).toList();
    return tasks;
  }

  Future<List<Task>> getOneTasks(int id) async {
    Database database = await initDatabase();
    List<Map<String, Object>> rows = await database.query(
      tableTodo,
      where: '$columnId=?',
      whereArgs: [id],
    );
    List<Task> tasks = rows.map((e) => Task.fromMap(e)).toList();
    return tasks;
  }

  deleteTask(int id) async {
    Database database = await initDatabase();
    return await database.delete(
      tableTodo,
      where: '$columnId=?',
      whereArgs: [id],
    );

  }

  upDateTask(Task task) async {
    Database database = await initDatabase();
    task.isComplete = !task.isComplete;
    return await database.update(
      tableTodo,
      task.toMap(),
      where: '$columnId=?',
      whereArgs: [task.id],
    );
  }
}
