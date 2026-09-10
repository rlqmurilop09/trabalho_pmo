import 'package:projeto_pmo/db/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:projeto_pmo/domain/user.dart';

class UserDao {

  Future<bool> login(String username, String password) async {
    Database db = await DbHelper().initDB();
    String sql = '''
        SELECT *
       FROM USER
       WHERE username = ? AND password = ?;
    ''';

   var result = await db.rawQuery(sql, [username, password]);
   return result.isNotEmpty;
  }

  save(User user) async {
    Database db = await DbHelper().initDB();
    db.insert('USER', user.toJson());
  }
}