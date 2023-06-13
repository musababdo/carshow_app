
import 'dart:async';
import 'dart:convert';
import 'package:caradmin/screens/home.dart';
import 'package:caradmin/screens/make/display.dart';
import 'package:caradmin/screens/model/display.dart';
import 'package:caradmin/screens/trim/display.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:caradmin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class TrimAdd extends StatefulWidget {

  @override
  State<TrimAdd> createState() => _TrimAddState();
}

class _TrimAddState extends State<TrimAdd> {

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController name = new TextEditingController();

  Future save() async{
    var url = Uri.parse('http://10.0.2.2/carshow/admin/trim/add.php');
    var response=await http.post(url, body: {
      "name" : name.text,
      "make_id" : selectedMake,
      "model_id" : selectedModel,
    });
    //json.decode(response.body);
    if(response.body.isNotEmpty) {
      json.decode(response.body);
    }
  }

  var selectedMake;
  List myData=[];
  Future getMake() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/make/read.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myData=data;
    });
    return data;
  }
  var selectedModel;
  List myModelData=[];
  Future getModel(String make) async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/model/read_with_make.php');
    var response = await http.post(url, body: {
      "make": make,
    });
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myModelData=data;
    });
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMake();
  }

  String? _errorMessage(String hint) {
    if(hint=="الفئه"){
      return 'الرجاء ادخال الفئه';
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
            Get.to(TrimDisplay());
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
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedMake,
                        hint: Text('اختر النوع'),
                        items: myData.map(( map){
                          return DropdownMenuItem(
                            child: Text(map['name']),
                            value: map['id'],
                          );
                        }).toList(),
                        onChanged:(value){
                          setState(() {
                            selectedMake=value;
                            selectedModel = null;
                            getModel(selectedMake);
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedModel,
                        hint: Text('اختر الطراز'),
                        items: myModelData.map(( map){
                          return DropdownMenuItem(
                            child: Text(map['name']),
                            value: map['id'],
                          );
                        }).toList(),
                        onChanged:(value){
                          setState(() {
                            selectedModel=value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return _errorMessage("الفئه");
                          // ignore: missing_return
                        }
                      },
                      controller: name,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "الفئه"
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
                              Get.to(TrimDisplay());
                              print(selectedMake);
                              print(selectedModel);
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
