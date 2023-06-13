
import 'dart:async';
import 'dart:convert';
import 'package:caradmin/screens/admin/display.dart';
import 'package:caradmin/screens/doors/display.dart';
import 'package:caradmin/screens/exterior_color/display.dart';
import 'package:caradmin/screens/fuel_type/display.dart';
import 'package:caradmin/screens/home.dart';
import 'package:caradmin/screens/interior_color/display.dart';
import 'package:caradmin/screens/make/display.dart';
import 'package:caradmin/screens/regional_spec/display.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:caradmin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class adminEdit extends StatefulWidget {
  final List list;
  final int index;
  adminEdit({required this.list,required this.index});

  @override
  State<adminEdit> createState() => _adminEditState();
}

class _adminEditState extends State<adminEdit> {

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String? dropdownvalue,id,blockdropdownvalue;
  var items = [
    'Super Admin',
    'Admin',
  ];
  var block_items = [
    'محظور',
    'غير محظور',
  ];

  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  Future save() async{
    var url = Uri.parse('http://10.0.2.2/carshow/admin/admin/edit.php');
    var response=await http.post(url, body: {
      "id" : id,
      "username" : username.text,
      "password" : password.text,
      "type" : dropdownvalue,
      "block" : blockdropdownvalue,
    });
    //json.decode(response.body);
    if(response.body.isNotEmpty) {
      json.decode(response.body);
    }
  }

  bool _secureText = true;
  void showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }
  String? _errorMessage(String hint) {
    if(hint=="الاسم"){
      return 'الرجاء ادخال الاسم';
    }else if(hint=="كلمه المرور"){
      return 'الرجاء ادخال كلمه المرور';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id =  widget.list[widget.index]['id'];
    username.text =  widget.list[widget.index]['username'];
    password.text =  widget.list[widget.index]['password'];
    dropdownvalue =  widget.list[widget.index]['type'];
    blockdropdownvalue =  widget.list[widget.index]['block'];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Form(
      key: _globalKey,
      child: SafeArea(
        child: WillPopScope(
          onWillPop:(){
            Get.to(adminDisplay());
            return Future.value(false);
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kMainColor,
              centerTitle: true,
              title: Text(
                'تعديل',
                style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * .1,
                    ),
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return _errorMessage("الاسم");
                          // ignore: missing_return
                        }
                      },
                      controller: username,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person,color: kMainColor,),
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "الاسم"
                      ),
                    ),
                    SizedBox(height: 15,),
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
                    SizedBox(height: 15,),
                    DropdownButton(
                      value: dropdownvalue,
                      hint: Text('اختر نوع الادمن'),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                          print(dropdownvalue);
                        });
                      },
                    ),
                    SizedBox(height: 15,),
                    DropdownButton(
                      value: blockdropdownvalue,
                      hint: Text('اختر عمليه الحظر'),
                      items: block_items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          blockdropdownvalue = newValue!;
                          print(blockdropdownvalue);
                        });
                      },
                    ),
                    SizedBox(height: 15,),
                    Builder(
                      builder: (context) => ElevatedButton(
                        onPressed: () {
                          if (_globalKey.currentState!.validate()){
                            _globalKey.currentState!.save();
                            try{
                              save();
                              Fluttertoast.showToast(
                                  msg: "تم التعديل بنجاح",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              Get.to(adminDisplay());
                            }on PlatformException catch(e){

                            }
                          }else{

                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kMainColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 5),
                          child: Center(
                              child:Text(
                                "تعديل",
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
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
}