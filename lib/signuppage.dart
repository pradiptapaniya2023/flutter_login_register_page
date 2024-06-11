import 'package:flutter/material.dart';
import 'package:flutter_regex/flutter_regex.dart';
import 'package:login_register_page/db_crud.dart';
import 'package:sqflite/sqflite.dart';
import 'loginpage.dart';

class Signup_Page extends StatefulWidget {
  static Database? db;

  @override
  State<StatefulWidget> createState() {
    return State_Signup_Page();
  }
}

class State_Signup_Page extends State<Signup_Page> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reenterPasswordController = TextEditingController();
  bool signinBtnPressedCheck = false;
  bool nameError = false;
  bool emailError = false;
  bool mobilenumberError = false;
  bool passwordError = false;
  bool reenterPasswordError = false;
  // Database? db;


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
                        margin: EdgeInsets.fromLTRB(0, 18, 0, 12),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontFamily: 'fontsfamily'),
                        ),
                      ),
                      TextFiledWidget(
                          Icons.person,
                          nameController,
                          'Name',
                          TextInputType.name,
                          nameError
                              ? 'Please Enter Vaild name'
                              : signinBtnPressedCheck == true &&
                                      nameController.text.isEmpty
                                  ? 'Please Fill Your name'
                                  : null),
                      TextFiledWidget(
                          Icons.email,
                          emailController,
                          'Email',
                          TextInputType.emailAddress,
                          emailError
                              ? 'Please Enter Vaild email'
                              : signinBtnPressedCheck == true &&
                                      emailController.text.isEmpty
                                  ? 'Please Fill Your email'
                                  : null),
                      TextFiledWidget(
                          Icons.call,
                          mobilenoController,
                          'Mobile Number',
                          TextInputType.number,
                          mobilenumberError
                              ? 'Please Enter Vaild mobilenumber'
                              : signinBtnPressedCheck == true &&
                                      mobilenoController.text.isEmpty
                                  ? 'Please Fill Your mobilenumber'
                                  : null),
                      TextFiledWidget(
                          Icons.password,
                          passwordController,
                          'Password',
                          TextInputType.name,
                          passwordError
                              ? 'Please Enter Vaild password'
                              : signinBtnPressedCheck == true &&
                                      passwordController.text.isEmpty
                                  ? 'Please Fill Your password'
                                  : null),
                      TextFiledWidget(
                          Icons.remove_red_eye_outlined,
                          reenterPasswordController,
                          'Re-enter Password',
                          TextInputType.name,
                          reenterPasswordError
                              ? ' Please Enter Vaild re-enter password'
                              : signinBtnPressedCheck == true &&
                                      reenterPasswordController.text.isEmpty
                                  ? 'Please Fill Your re-enter password'
                                  : null),
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
                        // margin: EdgeInsets.fromLTRB(left, top, right, bottom),
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
                              signupFun();
                            },
                            child: Text(
                              'Sign up',
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
                            // margin: EdgeInsets.fromLTRB(left, top, right, bottom),
                            margin: EdgeInsets.fromLTRB(10, 15, 10, 18),
                            child: Text(
                              'Or Sign Up With',
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
      String lblMsg, TextInputType textInputType, String? errorMsg) {
    return Container(
      margin: EdgeInsets.all(10),
      height: errorMsg != null ? 80 : 70,
      child: Card(
        shadowColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: TextField(
          controller: controller,
          style: TextStyle(fontFamily: 'fontsfamily', color: Colors.black),
          maxLength: 250,
          maxLines: null,
          decoration: InputDecoration(
              // counter: Spacer(),
              counterText: "",
              errorText: errorMsg,
              errorStyle: TextStyle(fontFamily: 'fontsfamily'),
              prefixIcon: Icon(icon),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintStyle: TextStyle(fontFamily: 'fontsfamily', fontSize: 17),
              labelText: lblMsg,
              contentPadding: EdgeInsets.all(10)),
          keyboardType: textInputType,
        ),
      ),
    );
  }

  void signupFun() {
    signinBtnPressedCheck = true;
    nameError = false;
    emailError = false;
    mobilenumberError = false;
    passwordError = false;
    reenterPasswordError = false;

    final RegExp nameRegex = RegExp('[a-zA-Z]');
    final RegExp emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    final RegExp mobilenoRegex = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    final RegExp passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (!nameRegex.hasMatch(nameController.text)) {
      nameError = true;
    } else if (!emailRegex.hasMatch(emailController.text)) {
      emailError = true;
    } else if (!mobilenoRegex.hasMatch(mobilenoController.text)) {
      mobilenumberError = true;
    } else if (!passwordRegex.hasMatch(passwordController.text)) {
      passwordError = true;
    } else if (passwordController.text != reenterPasswordController.text) {
      reenterPasswordError = true;
    } else if (signinBtnPressedCheck == true &&
        nameError == false &&
        emailError == false &&
        mobilenumberError == false &&
        passwordError == false &&
        reenterPasswordError == false) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Login_Page();
        },
      ));
    }

    setState(() {});

    DbCrud().insertDatabase(
        nameController.text,
        emailController.text,
        mobilenoController.text,
        passwordController.text,
        reenterPasswordController.text );
  }
}
