import 'package:flutter/material.dart';

import 'loginpage.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    'asset/images/Registerpage - Loginpage BG.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return Login_Page();
                      },
                    ));
                  },
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 60,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "fontsfamily"),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
