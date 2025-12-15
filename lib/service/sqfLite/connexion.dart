import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';

import 'package:sqflite/sqflite.dart';
class ConnexionBdd{
  static Future<Database> openMyDatabase(String database_Name, Function onCreated) async {
  final dbPath = await getDatabasesPath();
  final path = '$dbPath$database_Name.db';
  final database = await openDatabase(
    path,
    version: 1,
    onCreate: onCreated(),
  );
  return database;
}
}