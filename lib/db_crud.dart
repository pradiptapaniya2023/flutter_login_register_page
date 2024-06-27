import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
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
          'CREATE TABLE SIGNUPDATA (ID integer primary key autoincrement , NAME text , EMAIL text , MOBILENUMBER text , PASSWORD text , REENTERPASSWORD text)',
        );

        await db.execute(
          'CREATE TABLE CONTACTDATA (ID integer primary key autoincrement , NAME text , MOBILENUMBER text )',
        );
      },
    );
    return database;
  }

  insertContactDatabase(String name, String mobilenumber) {
    Signup_Page.db!.rawInsert(
        "INSERT INTO CONTACTDATA (NAME , MOBILENUMBER) VALUES ('$name' , '$mobilenumber')");
  }

  Future<bool> insertDatabase(
    String name,
    String email,
    String mobilenumber,
    String password,
    String reenterpassword,
    BuildContext context,
  ) async {
    List<Map> list = await Signup_Page.db!
        .rawQuery("SELECT * FROM SIGNUPDATA WHERE EMAIL = '${email}'");

    if (list.length == 0) {
      String insertqry =
          "INSERT INTO SIGNUPDATA (NAME,EMAIL,MOBILENUMBER,PASSWORD,REENTERPASSWORD) VALUES ('$name' , '$email' , '$mobilenumber' , '$password' , '$reenterpassword')";

      int cnt = await Signup_Page.db!.rawInsert(insertqry);

      print("==insert database = ${cnt}");
      return true;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("User Already Exist!")));
      return false;
    }
  }

  Future<List<Map>> selectDatabase(String email, String password) async {
    List<Map> list = await Signup_Page.db!.rawQuery(
        "SELECT * FROM SIGNUPDATA WHERE EMAIL = '${email}' AND PASSWORD = '${password}'");

    print("print list in DBcrud = ${list}");

    return list;
  }

  Future<List<Map>> getAllContacts() async {
    List<Map> list =
        await Signup_Page.db!.rawQuery("SELECT * FROM CONTACTDATA");

    print("All Contact===> $list");

    return list;
  }

  void updateContacts(String name, String mobilenumber, int index) {
    Signup_Page.db!.rawUpdate(
        "UPDATE CONTACTDATA SET NAME = '$name' ,  MOBILENUMBER = '$mobilenumber' WHERE ID = '${index}' ");
  }
}
