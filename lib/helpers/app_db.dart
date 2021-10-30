import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:project/helpers/constants.dart';
import 'package:project/helpers/logs.dart';
import 'package:project/models/user.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class AppDB {
  static final _databaseName = 'app_users.db';
  static final _databaseVersion = '1.0';

  AppDB._privateContructor();
  static final AppDB instance = AppDB._privateContructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabases();
    return _database!;
  }

  _initDatabases() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, _databaseName);
    return await openDatabase(path,
        version: int.parse(_databaseVersion), onCreate: _onCreate);
  }

  Future<dynamic> _onCreate(Database db, int version) async {
    String sql = """
      CREATE TABLE ${AppConstants.TABLE_NAME}(
        ${AppConstants.ID_COLUMN} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        ${AppConstants.NAME_COLUMN} TEXT NOT NULL,
        ${AppConstants.EMAIL_COLUMN} TEXT NOT NULL UNIQUE,
        ${AppConstants.PHONE_COLUMN} TEXT NOT NULL,
        ${AppConstants.DATE_COLUMN} DATETIME DEFAULT CURRENT_TIMESTAMP
      )
    """;

    await db.execute(sql);
  }

  Future<int> insert(User user) async {
    Database db = await instance.database;
    int id = await db.insert(AppConstants.TABLE_NAME, user.toJson());
    printLog('User:$id added successfully', DateTime.now());
    return id;
  }

  Future<List<User>> getAllUsers() async {
    Database db = await instance.database;
    var userListFromDb = await db.query(AppConstants.TABLE_NAME,
        orderBy: '${AppConstants.ID_COLUMN} DESC');
    int count = userListFromDb.length;

    List<User> allUsers = [];

    for (var user in userListFromDb) {
      allUsers.add(User.fromJson(user));
    }
    printLog(
        '=======================================Count: $count======================================',
        DateTime.now());
    printLog(
        '==================================Users==================================${json.encode(allUsers)}====================',
        DateTime.now());
    return allUsers;
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    int deleteId = await db.delete(AppConstants.TABLE_NAME,
        where: '${AppConstants.ID_COLUMN} = ?', whereArgs: [id]);
    printLog('User:$id Deleted Successfully', DateTime.now());
    return deleteId;
  }

  Future<bool> checkUser({required String email, required String phone}) async {
    Database db = await instance.database;
    int count = Sqflite.firstIntValue(await db.rawQuery(
        'SELECT COUNT(*) FROM ${AppConstants.TABLE_NAME} WHERE ${AppConstants.EMAIL_COLUMN} = $email OR ${AppConstants.PHONE_COLUMN} = $phone'))!;
    //return db.query(table);
    return count >= 1;
  }
}
