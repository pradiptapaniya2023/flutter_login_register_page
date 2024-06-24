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
                child: Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 60,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "fontsfamily"),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                height: 35,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: InkWell(
                  onTap: () {
                    dltRecord();
                  },
                  child: Text(
                    textAlign: TextAlign.center,
                    "LOG OUT",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'fontsfamily'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  dltRecord() {




  }
}
