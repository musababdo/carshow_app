
import 'dart:async';
import 'dart:convert';
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

class DoorsEdit extends StatefulWidget {
  final List list;
  final int index;
  DoorsEdit({required this.list,required this.index});

  @override
  State<DoorsEdit> createState() => _DoorsEditState();
}

class _DoorsEditState extends State<DoorsEdit> {

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController name_ar = new TextEditingController();
  TextEditingController name_en = new TextEditingController();

  String? id;
  Future save() async{
    var url = Uri.parse('http://10.0.2.2/carshow/admin/doors/edit.php');
    var response=await http.post(url, body: {
      "id" : id,
      "name_ar" : name_ar.text,
      "name_en" : name_en.text,
    });
    //json.decode(response.body);
    if(response.body.isNotEmpty) {
      json.decode(response.body);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id =  widget.list[widget.index]['id'];
    name_ar.text =  widget.list[widget.index]['name_ar'];
    name_en.text =  widget.list[widget.index]['name_en'];
  }

  String? _errorMessage(String hint) {
    if(hint=="عدد الابواب بالعربي"){
      return 'هذا الحقل مطلوب';
    }else if(hint=="عدد الابواب بالانجليزي"){
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
            Get.to(DoorsDisplay());
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
                          return _errorMessage("عدد الابواب بالعربي");
                          // ignore: missing_return
                        }
                      },
                      controller: name_ar,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "عدد الابواب بالعربي"
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return _errorMessage("عدد الابواب بالانجليزي");
                          // ignore: missing_return
                        }
                      },
                      controller: name_en,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "عدد الابواب بالانجليزي"
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
                                  msg: "تم التعديل بنجاح",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              Get.to(DoorsDisplay());
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
