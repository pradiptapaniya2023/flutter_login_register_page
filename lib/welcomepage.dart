import 'package:flutter/material.dart';
import 'package:login_register_page/db_crud.dart';
import 'loginpage.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController editNameController = TextEditingController();
  TextEditingController editMobileumberController = TextEditingController();
  bool nameError = false;
  bool mobilernumberError = false;
  bool addBtnPressedCheck = false;
  List<Map> contact = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    contact = await DbCrud().getAllContacts();
    setState(() {});
  }

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
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: contact.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[200]),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            "${contact[index]['NAME']}",
                            style: TextStyle(
                                fontFamily: 'fontsfamily',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            "${contact[index]['MOBILENUMBER']}",
                            style: TextStyle(
                                fontFamily: 'fontsfamily',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                        ),
                        trailing: PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'edit') {
                              editShowDialog(index);
                            } else if (value == 'delete') {}
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                      fontFamily: 'fontsfamily',
                                      fontWeight: FontWeight.bold),
                                ),
                                value: 'edit',
                              ),
                              PopupMenuItem(
                                child: Text(
                                  "Delete",
                                  style: TextStyle(
                                      fontFamily: 'fontsfamily',
                                      fontWeight: FontWeight.bold),
                                ),
                                value: 'delete',
                              ),
                            ];
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addShowDialog();
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

  addShowDialog() {
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
                      child: Container(
                        height:
                            nameError || mobilernumberError != null ? 80 : 70,
                        child: Card(
                          shadowColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.white,
                          child: TextField(
                            controller: nameController,
                            style: TextStyle(
                                fontFamily: 'fontsfamily', color: Colors.black),
                            maxLength: 250,
                            maxLines: null,
                            decoration: InputDecoration(
                                errorText: nameError
                                    ? 'Please Enter Vaild name'
                                    : null,
                                counterText: "",
                                errorStyle:
                                    TextStyle(fontFamily: 'fontsfamily'),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: mobilernumberError != null ? 80 : 70,
                        child: Card(
                          shadowColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.white,
                          child: TextField(
                            controller: mobilenumberController,
                            style: TextStyle(
                                fontFamily: 'fontsfamily', color: Colors.black),
                            maxLength: 250,
                            maxLines: null,
                            decoration: InputDecoration(
                                errorText: mobilernumberError
                                    ? 'Please Enter Vaild mobilenumber'
                                    : null,
                                counterText: "",
                                errorStyle:
                                    TextStyle(fontFamily: 'fontsfamily'),
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
                              onPressed: () {
                                addContact();
                              },
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "fontsfamily",
                                    color: Colors.black45,
                                    fontSize: 25),
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

  addContact() {
    addBtnPressedCheck = true;
    nameError = false;
    mobilernumberError = false;

    final RegExp nameRegex = RegExp('[a-zA-Z]');
    final RegExp mobilenoRegex = RegExp(r'^(?:[+0]9)?[0-9]{10}$');

    if (!nameRegex.hasMatch(nameController.text)) {
      nameError = true;
    } else if (!mobilenoRegex.hasMatch(mobilenumberController.text)) {
      mobilernumberError = true;
    } else {
      DbCrud().insertContactDatabase(
          nameController.text, mobilenumberController.text);

      nameController.text = "";
      mobilenumberController.text = "";

      Navigator.pop(context);
      fetchData();
    }

    setState(() {});
  }

  editShowDialog(int index) {
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
                      child: Container(
                        height: 70,
                        child: Card(
                          shadowColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.white,
                          child: TextField(
                            controller: editNameController,
                            style: TextStyle(
                                fontFamily: 'fontsfamily', color: Colors.black),
                            decoration: InputDecoration(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: 70,
                        child: Card(
                          shadowColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.white,
                          child: TextField(
                            controller: editMobileumberController,
                            style: TextStyle(
                                fontFamily: 'fontsfamily', color: Colors.black),
                            decoration: InputDecoration(
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
                              onPressed: () {
                                setState(() {
                                  DbCrud().updateContacts(
                                      editNameController.text,
                                      editMobileumberController.text,
                                      index);

                                  editNameController.text = "";
                                  editMobileumberController.text = "";
                                });

                                Navigator.pop(context);
                                fetchData();
                              },
                              child: Text(
                                "Ok",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "fontsfamily",
                                    color: Colors.black45,
                                    fontSize: 20),
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
