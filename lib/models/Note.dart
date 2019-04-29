import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:dbutils/sqllitedb.dart';

class Note extends DBInterface{

  factory Note() {
    if(_this == null) _this = Note._getInstance();
    return _this;
  }

  /// Make only one instance of this class.
  static Note _this;

  Note._getInstance(): super();

  @override
  get name => 'testing.db';

  @override
  get version => 1;

  

  @override
  Future onCreate(Database db, int version) async {

    await db.execute(""
     "CREATE TABLE Note ("
              "id INTEGER PRIMARY KEY,"
              "title TEXT,"
              "text TEXT,"
              "duration int,"
              "created_at int,"
              "blocked BIT"
              ")");
  }


  Future<bool> save() async{
    var rec = await saveRec('Note');
    return rec.isNotEmpty;
  }


  Future<List<Map>> getNotes() async {
    return await this.rawQuery('SELECT * FROM Note');
  }
}