import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui__01/sizedata.dart';
import 'package:http/http.dart' as http;

class Singup extends StatefulWidget {
  @override
  _SingupState createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  bool isChecked = false;

  TextEditingController firstN = TextEditingController();
  TextEditingController lastN = TextEditingController();
  TextEditingController usermail = TextEditingController();
  TextEditingController pass_Word = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController samePhoneNum = TextEditingController();

  Future<dynamic> getDataSignUp(String firstName, String LastName, String Email,
      String PhoneNumber, String PassWord) async {
    var url = Uri.parse("http://merbed.org/farah/public/api/signup");
    var response = await http.post(url, body: {
      "firstname": firstName,
      "lastname": LastName,
      "email": Email,
      "password": PassWord,
      "mobile_no": PhoneNumber
    });

    var responseData = jsonDecode(response.body);
    // print(responseData);
    // print("------\n\n${responseData['message']}");
    if (responseData["success"] == 200) {
      return responseData['success'];
    } else {
      Fluttertoast.showToast(msg: responseData['message']);
    }
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
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 12,
                        margin: EdgeInsets.only(left: 45),
                        child: Image(
                            image: AssetImage("Assets/Singup/Ellipse 22.png"))),
                    Container(
                        width: 14,
                        margin: EdgeInsets.only(right: 45),
                        child: Image(
                            image: AssetImage("Assets/Singup/Ellipse 23.png"))),
                  ],
                ),
              ),
              Image(
                image: AssetImage("Assets/Singup/Union 1.png"),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: sizedata.width! / 3.5,
                    margin: EdgeInsets.only(top: 40, bottom: 5),
                    child:
                        Image(image: AssetImage("Assets/Singup/Group 1.png")),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 60,
                      margin: EdgeInsets.only(left: 45),
                      child:
                          Image(image: AssetImage("Assets/Singup/Signup.png")),
                    ),
                    Container(
                      width: 12,
                      margin: EdgeInsets.only(left: 55),
                      child: Image(
                          image: AssetImage("Assets/Singup/Ellipse 24.png")),
                    ),
                  ],
                ),
                Container(
                  width: 15,
                  margin: EdgeInsets.only(left: 180),
                  child: Image(image: AssetImage("Assets/Singup/close.png")),
                ),
                Row(
                  children: [
                    Container(
                      width: 28,
                      margin: EdgeInsets.only(left: 60),
                      child: Image(image: AssetImage("Assets/Singup/05.png")),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, bottom: 5),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "First name",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff656565),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 30, right: 30),
                        child: TextField(
                          controller: firstN,
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
                        padding:
                            const EdgeInsets.only(left: 30, bottom: 5, top: 5),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Last name",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff656565),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 30, right: 30),
                        child: TextField(
                          controller: lastN,
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
                              )),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, bottom: 5, top: 5),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff656565),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 30, right: 30),
                        child: TextField(
                          controller: usermail,
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
                              )),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, bottom: 5, top: 5),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Phone number",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff656565),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 30, right: 30),
                        child: TextField(
                          controller: phoneNum,
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
                              )),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, bottom: 5, top: 5),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Password",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff656565),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 30, right: 30),
                        child: TextField(
                          controller: pass_Word,
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
                              )),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, bottom: 5, top: 5),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Confirm password",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff656565),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 30, right: 30),
                        child: TextField(
                          controller: samePhoneNum,
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
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: Row(
                          children: [
                            Checkbox(
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
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  child: Text(
                                    "I agree to terms and conditions",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff656565)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          width: sizedata.width! / 3,
                          height: sizedata.width! / 10,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 30, bottom: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff8D5A9B),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() async {
                                if (pass_Word.text == samePhoneNum.text) {
                                  var scs = await getDataSignUp(
                                      firstN.text,
                                      lastN.text,
                                      usermail.text,
                                      phoneNum.text,
                                      pass_Word.text);
                                  if (scs == 200) {
                                    Navigator.pushReplacementNamed(
                                        context, "/");
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "confirm your password");
                                }
                              });
                            },
                            child: Text(
                              "Singup",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "already have an account?",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff656565)),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(context, "/");
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xff8D5A9B)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        ],
      ),
    );
  }
}