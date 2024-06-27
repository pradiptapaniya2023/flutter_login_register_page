import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_register_page/signuppage.dart';
import 'package:login_register_page/welcomepage.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'db_crud.dart';
import 'loginpage.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SpleachScreenState();
}

class _SpleachScreenState extends State<SplachScreen> {
  bool openWelcomePage = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    Signup_Page.db =  await DbCrud().createDatabase();
    checkValueFun();
  }

  Future<void> checkValueFun() async {
    Login_Page.sp = await SharedPreferences.getInstance();
    openWelcomePage = Login_Page.sp!.getBool('loginCheck') ?? false;
    Future.delayed(Duration(seconds: 2)).then(
      (value) {
        if (openWelcomePage) {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return Welcomepage();
            },
          ));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return Login_Page();
            },
          ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Lottie.asset("asset/lottie/lottiefirst.json"),
      ),
    );
  }
}
