
import 'dart:async';
import 'dart:convert';
import 'package:caradmin/screens/body_type/display.dart';
import 'package:caradmin/screens/fuel_type/display.dart';
import 'package:caradmin/screens/home.dart';
import 'package:caradmin/screens/horsepower/display.dart';
import 'package:caradmin/screens/make/display.dart';
import 'package:caradmin/screens/regional_spec/display.dart';
import 'package:caradmin/screens/transmission_type/display.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:caradmin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HorseAdd extends StatefulWidget {

  @override
  State<HorseAdd> createState() => _HorseAddState();
}

class _HorseAddState extends State<HorseAdd> {

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController name_ar = new TextEditingController();
  TextEditingController name_en = new TextEditingController();

  Future save() async{
    var url = Uri.parse('http://10.0.2.2/carshow/admin/horsepower/add.php');
    var response=await http.post(url, body: {
      "name_ar" : name_ar.text,
      "name_en" : name_en.text,
    });
    //json.decode(response.body);
    if(response.body.isNotEmpty) {
      json.decode(response.body);
    }
  }

  String? _errorMessage(String hint) {
    if(hint=="قوه الحصان بالعربي"){
      return 'هذا الحقل مطلوب';
    }else if(hint=="قوه الحصان بالانجليزي"){
      return 'هذا الحقل مطلوب';
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
            Get.to(HorseDisplay());
            return Future.value(false);
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kMainColor,
              centerTitle: true,
              title: Text(
                'اضافه',
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
                          return _errorMessage("قوه الحصان بالعربي");
                          // ignore: missing_return
                        }
                      },
                      controller: name_ar,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "قوه الحصان بالعربي"
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return _errorMessage("قوه الحصان بالانجليزي");
                          // ignore: missing_return
                        }
                      },
                      controller: name_en,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "قوه الحصان بالانجليزي"
                      ),
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
                                  msg: "تمت الاضافه بنجاح",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              Get.to(HorseDisplay());
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
                                "اضافه",
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
