import 'package:flutter/material.dart';

import 'firstpage.dart';

class Welcome_Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return State_Welcome_Page();
  }
}

class State_Welcome_Page extends State<Welcome_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    'asset/images/Registerpage - Loginpage BG.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return First_Page();
                    },
                  ));
                },
                child: Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontFamily: 'fontsfamily',
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
