
import 'dart:async';
import 'dart:convert';
import 'package:caradmin/screens/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:caradmin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  static String id='login';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  int _state=0;

  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  Future login() async {
    var url = Uri.parse("http://10.0.2.2/carshow/admin/login.php");
    var response = await http.post(url, body: {
      "username": username.text,
      "password": password.text,
    });
    var datauser = json.decode(response.body);
    if(datauser.length==0){
      setState(() {
        Fluttertoast.showToast(
                  msg: "اسم المستخدم او كلمه المرور خطاء",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
      });
    }else{
        Fluttertoast.showToast(
            msg: "تم تسجيل الدخول بنجاح",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Get.to(Home());
      setState(() {
        box.write('a_id', datauser[0]['id']);
        box.write('username', datauser[0]['username']);
        box.write('type', datauser[0]['type']);
        box.write('block', datauser[0]['block']);
        //print(datauser[0]['username']);
      });

    }
    // if (data == "Success") {
    //   Fluttertoast.showToast(
    //       msg: "تم تسجيل الدخول بنجاح",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.black,
    //       textColor: Colors.white,
    //       fontSize: 16.0
    //   );
    //   Get.to(Home());
    // } else {
    //   Fluttertoast.showToast(
    //       msg: "اسم المستخدم او كلمه المرور خطاء",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.black,
    //       textColor: Colors.white,
    //       fontSize: 16.0
    //   );
    // }
    return datauser;
  }

  bool _validate = false;
  bool _secureText = true;
  void showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  String? _errorMessage(String hint) {
    if(hint=="أسم المستخدم"){
      return 'الرجاء ادخال اسم المستخدم';
    }else if(hint=="كلمه المرور"){
      return 'الرجاء ادخال كلمه المرور';
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Form(
      key: _globalKey,
      child: SafeArea(
        child: WillPopScope(
          onWillPop:(){
            SystemNavigator.pop();
            return Future.value(false);
          },
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * .2,
                    ),
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return _errorMessage("أسم المستخدم");
                          // ignore: missing_return
                        }
                      },
                      controller: username,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person,color: kMainColor,),
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "أسم المستخدم"
                      ),
                    ),
                    SizedBox(height: 5,),
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return _errorMessage("كلمه المرور");
                          // ignore: missing_return
                        }
                      },
                      controller: password,
                      obscureText: _secureText,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock,color: kMainColor,),
                          suffixIcon: IconButton(
                            onPressed: showHide,
                            icon: Icon(_secureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "كلمه المرور"
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
                      child: Builder(
                        builder: (context) => ElevatedButton(
                          onPressed: () {
                            if (_state == 0) {
                              animateButton();
                            }

                            if (_globalKey.currentState!.validate()){
                              _globalKey.currentState!.save();
                              try{
                                login();
                              }on PlatformException catch(e){

                              }
                            }else{
                              setState(() {
                                _state = 0;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kMainColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 5),
                            child: Center(
                                child:setUpButtonChild()
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget? setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "تسجيل دخول",
        style: GoogleFonts.cairo(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }
  }
  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 0;
      });
    });
  }
}
