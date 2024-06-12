import 'package:login_register_page/signuppage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbCrud {
  Future<Database> createDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'signup.db');

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE SIGNUPDATA (ID integer primary key autoincrement , NAME text , EMAIL text , MOBILENUMBER integer , PASSWORD text , REENTERPASSWORD text)');
      },
    );
    return database;
  }

  Future<void> insertDatabase(
    String name,
    String email,
    String mobilenumber,
    String password,
    String reenterpassword,
  ) async {
    String insertqry =
        "INSERT INTO SIGNUPDATA (NAME,EMAIL,MOBILENUMBER,PASSWORD,REENTERPASSWORD) VALUES ('$name' , '$email' , '$mobilenumber' , '$password' , '$reenterpassword')";

    int cnt = await Signup_Page.db!.rawInsert(insertqry);

    print("==insert database = ${cnt}");
  }

  Future<List<Map>> selectDatabase(String email, String password) async {
    List<Map> list = await Signup_Page.db!.rawQuery(
        "SELECT * FROM SIGNUPDATA WHERE EMAIL = '${email}' AND PASSWORD = '${password}'");

    print("print list in DBcrud = ${list}");

    return list;
  }
}
