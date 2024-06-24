import 'package:flutter/material.dart';
import 'package:login_register_page/db_crud.dart';
import 'package:login_register_page/signuppage.dart';
import 'package:login_register_page/welcomepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_Page extends StatefulWidget {
  static SharedPreferences? sp;

  @override
  State<StatefulWidget> createState() {
    return State_Login_Page();
  }
}

class State_Login_Page extends State<Login_Page> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    DbCrud().createDatabase().then(
      (value) {
        setState(() {
          Signup_Page.db = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'asset/images/Registerpage - Loginpage BG.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // margin: EdgeInsets.fromLTRB(left, top, right, bottom),
                        margin: EdgeInsets.fromLTRB(0, 120, 0, 90),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontFamily: 'fontsfamily'),
                        ),
                      ),
                      TextFiledWidget(Icons.email, emailController, 'Email',
                          TextInputType.emailAddress),
                      TextFiledWidget(Icons.password, passwordController,
                          'Password', TextInputType.name),
                      Container(
                        // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                        padding: EdgeInsets.fromLTRB(217, 0, 0, 0),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget Password ?',
                              style: TextStyle(
                                  fontFamily: 'fontsfamily',
                                  fontSize: 15,
                                  color: Colors.red),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 8),
                        height: 60,
                        width: 180,
                        child: Card(
                          color: Colors.black,
                          shadowColor: Colors.black,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            onPressed: () {
                              loginFun();
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 25,
                                  fontFamily: 'fontsfamily'),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 25),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 17, 10, 19),
                            child: Text(
                              'Or Login With',
                              style: TextStyle(
                                  fontFamily: 'fontsfamily',
                                  color: Colors.grey),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                          SizedBox(width: 25),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              print('Google is tap');
                            },
                            child: Card(
                              shadowColor: Colors.grey,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'asset/images/Google.jpg'))),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print('Facebook is tap');
                            },
                            child: Card(
                              shadowColor: Colors.grey,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'asset/images/Facebook.jpg'))),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print('Twitter is tap');
                            },
                            child: Card(
                              shadowColor: Colors.grey,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'asset/images/Twitter.jpg'))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not registered ?',
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'fontsfamily'),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Signup_Page();
                                  },
                                ));
                              },
                              child: Text(
                                'Sign up now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'fontsfamily'),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget TextFiledWidget(IconData icon, TextEditingController controller,
      String s, TextInputType textInputType) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 60,
      child: Card(
        shadowColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: TextField(
          controller: controller,
          style: TextStyle(fontFamily: 'fontsfamily', color: Colors.black),
          decoration: InputDecoration(
              prefixIcon: Icon(icon),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintStyle: TextStyle(fontFamily: 'fontsfamily', fontSize: 17),
              hintText: s,
              contentPadding: EdgeInsets.all(10)),
          keyboardType: textInputType,
        ),
      ),
    );
  }

  Future<void> loginFun() async {
    print("===in login funciton");
    List<Map> list = await DbCrud()
        .selectDatabase(emailController.text, passwordController.text);

    if (list.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("User Not Found")));
    } else {

      Login_Page.sp!.setString('loginEmail', list[0]['EMAIL']);
      Login_Page.sp!.setString('loginPassword', list[0]['PASSWORD']);
      Login_Page.sp!.setBool('loginCheck', true);

      print(
          '= loginpage = check email or password ==> ${list[0]['EMAIL']} & ${list[0]['PASSWORD']}');
      //
      // String loginemail = Login_Page.sp!.getString('loginEmail') ?? "";
      // String loginpassword = Login_Page.sp!.getString('loginPassword') ?? "";
      //
      // print("= loginpage = getSP ${loginemail}");
      // print("= loginpage = getSP ${loginpassword}");

      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Welcomepage();
        },
      ));
    }
  }
}
