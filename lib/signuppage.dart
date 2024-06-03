import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup_Page extends StatefulWidget {
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
                        margin: EdgeInsets.fromLTRB(0, 45, 0, 65),
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
                        padding: EdgeInsets.fromLTRB(175, 0, 5, 0),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget Password ?',
                              style: TextStyle(
                                  fontFamily: 'fontsfamily',
                                  fontSize: 20,
                                  color: Colors.red),
                            )),
                      ),
                      Container(
                        // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 25,
                                fontFamily: 'fontsfamily'),
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
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Or Sign Up With',
                                style: TextStyle(
                                    fontFamily: 'fontsfamily',
                                    color: Colors.grey),
                              )),
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
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
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
    );
  }
}
