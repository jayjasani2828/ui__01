import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui__01/singup.dart';
import 'package:ui__01/sizedata.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = true;
  bool isChecked = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future getRequest1(String mail, String passw) async {
    var url = Uri.parse("http://merbed.org/farah/public/api/login");
    setState(() {
      isLoading = true;
    });
    var response = await http.post(url, body: {"email": mail, "password": passw});
    var responceData = jsonDecode(response.body);
    if (responceData["success"] == 200) {
      Navigator.pushReplacementNamed(context, "/homepage");
      setState(() {
        isLoading = false;
      });
    } else {
      Fluttertoast.showToast(msg: responceData['message']);
    }
  }

  void memory() {
    SharedPreferences.getInstance().then((value) {
      if (value.getBool("isChecked") ?? false)
        email.text = value.getString('mail') ?? "";
      password.text = value.getString('pass') ?? "";
    });
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    memory();
  }

  @override
  Widget build(BuildContext context) {
    sizedata(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 12,
                      margin: EdgeInsets.only(left: 35),
                      child: Image(
                        image: AssetImage("Assets/photo/Ellipse 22.png"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 35),
                      width: 12,
                      child: Image(
                        image: AssetImage("Assets/photo/Ellipse 23.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: sizedata.width,
                child: Image(
                  image: AssetImage("Assets/photo/Union 1.png"),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 85),
                      width: 150,
                      child: Image(
                        image: AssetImage("Assets/photo/Group 1.png"),
                      ),
                    ),
                  ),
                  Container(
                    width: 12,
                    margin: EdgeInsets.only(right: 180),
                    child:
                        Image(image: AssetImage("Assets/photo/Ellipse 24.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xff8D5A9B)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, right: 10, top: 35),
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff656565),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 45,
                          margin: EdgeInsets.only(
                              top: 5, left: 35, right: 35, bottom: 15),
                          child: TextField(
                            controller: email,
                            // isChecked
                            //     ? shared_email as TextEditingController
                            //     : email,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Color(0xff707070),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Color(0xff707070),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Row(
                            children: [
                              Text(
                                "Password",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff656565),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 45,
                          margin: EdgeInsets.only(
                              top: 5, left: 35, right: 35, bottom: 10),
                          child: TextField(
                            obscureText: true,
                            controller: password,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Color(0xff707070),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Color(0xff707070),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 21),
                                  child: Checkbox(
                                    side: BorderSide(color: Colors.black),
                                    value: isChecked,
                                    checkColor: Colors.white,
                                    hoverColor: Colors.orange,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  "Remember me",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff656565),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 34),
                              child: Text(
                                "Forgot Your Password ?",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff656565),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: sizedata.bodyheight! / 5,
                          height: sizedata.width! / 10,
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          decoration: BoxDecoration(
                              color: Color(0xff8D5A9B),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextButton(
                            onPressed: () async {
                              final prefs = await SharedPreferences.getInstance();
                              await prefs.setString('mail', email.text);
                              await prefs.setString('pass', password.text);
                              await prefs.setBool('isChecked', isChecked);
                              getRequest1(email.text, password.text);
                            },
                            child: isLoading
                                ? Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  )
                                : CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dont't have an account?",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff656565),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Singup();
                                  },
                                ));
                              },
                              child: Text(
                                "Sing Up",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff8D5A9B)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5, top: 30),
                        width: sizedata.bodyheight! / 6,
                        child: Container(
                            child: Image(
                                image:
                                    AssetImage("Assets/photo/Group 671.png"))),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 5, top: 30),
                          width: sizedata.bodyheight! / 6,
                          child: Image(
                              image: AssetImage("Assets/photo/Group 672.png"))),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Continue as guest",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    "__________________",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
