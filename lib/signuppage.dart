import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_register_page/welcomepage.dart';

class Signup_Page extends StatefulWidget {
  String name = "";
  String email = "";
  int mobile = 0;
  String password = "";
  String reenter = "";

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
                        margin: EdgeInsets.fromLTRB(0, 45, 0, 50),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontFamily: 'fontsfamily'),
                        ),
                      ),
                      TextFiledWidget(Icons.person, nameController, 'Name',
                          TextInputType.name),
                      TextFiledWidget(Icons.email, emailController, 'Email',
                          TextInputType.emailAddress),
                      TextFiledWidget(Icons.call, mobilenoController,
                          'Mobile Number', TextInputType.number),
                      TextFiledWidget(Icons.password, passwordController,
                          'Password', TextInputType.name),
                      TextFiledWidget(
                          Icons.remove_red_eye_outlined,
                          reenterPasswordController,
                          'Re-enter Password',
                          TextInputType.name),
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

  void signupFun() {
    widget.name = nameController.text;
    widget.email = emailController.text;
    widget.mobile = int.parse(mobilenoController.text);
    widget.password = passwordController.text;
    widget.reenter = reenterPasswordController.text;



    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Welcome_Page();
      },
    ));


  }
}
