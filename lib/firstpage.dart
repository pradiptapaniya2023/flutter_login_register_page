import 'package:flutter/material.dart';
import 'package:login_register_page/signuppage.dart';

class First_Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return State_First_Page();
  }
}

class State_First_Page extends State<First_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/images/Firstpage BG.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // margin: EdgeInsets.fromLTRB(left, top, right, bottom),
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 40),
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25,
                          fontFamily: 'fontsfamily'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 40),
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Signup_Page();
                        },
                      ));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25,
                          fontFamily: 'fontsfamily'),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
