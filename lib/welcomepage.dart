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
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "fontsfamily"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: Icon(
                Icons.login_outlined,
                color: Colors.black,
                size: 23,
              ),
              onPressed: () {
                checkLogout();
              },
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'asset/images/Registerpage - Loginpage BG.jpg'))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addContact();
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }

  checkLogout() {
    Login_Page.sp!.setBool('loginCheck', false);
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return Login_Page();
      },
    ));
    setState(() {});
  }

  addContact() {
    showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 210, 20, 210),
          child: Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 100, left: 10, right: 10),
                      child: Card(
                        shadowColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.white,
                        child: TextField(
                          style: TextStyle(
                              fontFamily: 'fontsfamily', color: Colors.black),
                          maxLength: 250,
                          maxLines: null,
                          decoration: InputDecoration(
                              counterText: "",
                              errorStyle: TextStyle(fontFamily: 'fontsfamily'),
                              prefixIcon: Icon(Icons.person),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintStyle: TextStyle(
                                  fontFamily: 'fontsfamily', fontSize: 17),
                              labelText: "Enter Your Name",
                              contentPadding: EdgeInsets.all(10)),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Card(
                        shadowColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.white,
                        child: TextField(
                          style: TextStyle(
                              fontFamily: 'fontsfamily', color: Colors.black),
                          maxLength: 250,
                          maxLines: null,
                          decoration: InputDecoration(
                              counterText: "",
                              errorStyle: TextStyle(fontFamily: 'fontsfamily'),
                              prefixIcon: Icon(Icons.call),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintStyle: TextStyle(
                                  fontFamily: 'fontsfamily', fontSize: 17),
                              labelText: "Enter Your Mobilenumber",
                              contentPadding: EdgeInsets.all(10)),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 100),
                      child: Container(
                        height: 60,
                        width: 70,
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shadowColor: Colors.white,
                          child: Center(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "fontsfamily",
                                    color: Colors.black45,
                                    fontSize: 27),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
