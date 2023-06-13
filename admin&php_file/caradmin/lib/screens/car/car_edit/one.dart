
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:caradmin/screens/car/car_add/two.dart';
import 'package:caradmin/screens/car/car_edit/two.dart';
import 'package:caradmin/screens/car/display.dart';
import 'package:caradmin/screens/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:caradmin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class EditOne extends StatefulWidget {
  static String id='editone';
  final List list;
  final int index;
  EditOne({required this.list,required this.index});

  @override
  State<EditOne> createState() => _EditOneState();
}

class _EditOneState extends State<EditOne> {

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController year = new TextEditingController();
  TextEditingController kilo = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController number = new TextEditingController();

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
    var url = Uri.parse('http://10.0.2.2/carshow/admin/model/read_view_with_make.php');
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
  var selectedNewModel;
  List myNewModelData=[];
  Future getNewModel(String make) async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/model/read.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myNewModelData=data;
    });
    return data;
  }

  var selectedTrim;
  List myTrimData=[];
  Future getTrim(String make,String model) async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/trim/read_view_with_make.php');
    var response = await http.post(url, body: {
      "make": make,
      "model": model,
    });
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myTrimData=data;
    });
    return data;
  }
  var selectedNewTrim;
  List myNewTrimData=[];
  Future getNewTrim(String make) async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/trim/read.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myNewTrimData=data;
    });
    return data;
  }
  var selectedRegionalArabic;
  List myRegionalArabicData=[];
  Future getRegionalArabic() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/regional_specs/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myRegionalArabicData=data;
    });
    return data;
  }
  var selectedRegionalEnglish;
  List myRegionalEnglishData=[];
  Future getRegionalEnglish() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/regional_specs/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myRegionalEnglishData=data;
    });
    return data;
  }
  var selectedFuelTypeArabic;
  List myFuelTypeArabicData=[];
  Future getFuelTypeArabic() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/fuel_type/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myFuelTypeArabicData=data;
    });
    return data;
  }
  var selectedFuelTypeEnglish;
  List myFuelTypeEnglishData=[];
  Future getFuelTypeEnglish() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/fuel_type/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myFuelTypeEnglishData=data;
    });
    return data;
  }
  var selectedBodyCondArabic;
  List myBodyCondArabicData=[];
  Future getBodyCondArabic() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/body_condition/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myBodyCondArabicData=data;
    });
    return data;
  }
  var selectedBodyCondEnglish;
  List myBodyCondEnglishData=[];
  Future getBodyCondEnglish() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/body_condition/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myBodyCondEnglishData=data;
    });
    return data;
  }
  var selectedMechCondArabic;
  List myMechCondArabicData=[];
  Future getMechCondArabic() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/mechanical_condition/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myMechCondArabicData=data;
    });
    return data;
  }
  var selectedMechCondEnglish;
  List myMechCondEnglishData=[];
  Future getMechCondEnglish() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/mechanical_condition/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myMechCondEnglishData=data;
    });
    return data;
  }

  String? id,exterior_ar,exterior_en;
  String? interor_ar,interior_en,doors_ar,doors_en,no_of_ar,no_of_en,trans_ar,trans_en;
  String? body_type_ar,body_type_en,horse_ar,horse_en,sterring_ar,sterring_en,extras_ar,extras_en;
  var image =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id =  widget.list[widget.index]['id'];
      selectedMake =  widget.list[widget.index]['make'];
     selectedModel =  widget.list[widget.index]['model'];
     selectedTrim =  widget.list[widget.index]['trim'];
      selectedRegionalArabic =  widget.list[widget.index]['regional_specs_ar'];
      selectedRegionalEnglish =  widget.list[widget.index]['regional_specs_en'];
      selectedFuelTypeArabic =  widget.list[widget.index]['fuel_type_ar'];
      selectedFuelTypeEnglish =  widget.list[widget.index]['fuel_type_en'];
    selectedBodyCondArabic =  widget.list[widget.index]['body_condition_ar'];
     selectedBodyCondEnglish =  widget.list[widget.index]['body_condition_en'];
    selectedMechCondArabic =  widget.list[widget.index]['mech_condition_ar'];
    selectedMechCondEnglish =  widget.list[widget.index]['mech_condition_en'];
     year.text =  widget.list[widget.index]['year'];
     kilo.text =  widget.list[widget.index]['kilometers'];
     price.text =  widget.list[widget.index]['price'];
     number.text =  widget.list[widget.index]['number'];

    exterior_ar =  widget.list[widget.index]['exterior_color_ar'];
    exterior_en =  widget.list[widget.index]['exterior_color_en'];
    interor_ar =  widget.list[widget.index]['interior_color_ar'];
    interior_en =  widget.list[widget.index]['interior_color_en'];
    doors_ar =  widget.list[widget.index]['doors_ar'];
    doors_en =  widget.list[widget.index]['doors_en'];
    no_of_ar =  widget.list[widget.index]['no_of_cylinder_ar'];
    no_of_en =  widget.list[widget.index]['no_of_cylinder_en'];
    trans_ar =  widget.list[widget.index]['transmission_type_ar'];
    trans_en =  widget.list[widget.index]['transmission_type_en'];
    body_type_ar =  widget.list[widget.index]['body_type_ar'];
    body_type_en =  widget.list[widget.index]['body_type_en'];
    horse_ar =  widget.list[widget.index]['horsepower_ar'];
    horse_en =  widget.list[widget.index]['horsepower_en'];
    sterring_ar =  widget.list[widget.index]['steering_side_ar'];
    sterring_en =  widget.list[widget.index]['steering_side_en'];

    extras_ar =  widget.list[widget.index]['extras_ar'];
    extras_en =  widget.list[widget.index]['extras_en'];
    image =  jsonDecode(widget.list[widget.index]['image']);
    getMake();
    getModel(selectedMake);
    getTrim(selectedMake, selectedModel);
    getRegionalArabic();
    getRegionalEnglish();
    getFuelTypeArabic();
    getFuelTypeEnglish();
    getBodyCondArabic();
    getBodyCondEnglish();
    getMechCondArabic();
    getMechCondEnglish();
    print('==============');
    print(selectedTrim);
    print('==============');
  }

  String? _errorMessage(String hint) {
    if(hint=="السنه"){
      return 'هذا الحقل مطلوب';
    }else if(hint=="كيلوميتير"){
      return 'هذا الحقل مطلوب';
    }else if(hint=="السعر"){
      return 'هذا الحقل مطلوب';
    }else if(hint=="رقم الهاتف"){
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
            Get.to(CarDisplay());
            return Future.value(false);
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kMainColor,
              centerTitle: true,
              title: Text(
                'تعديل سياره',
                style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
              persistentFooterButtons: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
                  child: Builder(
                    builder: (context) => ElevatedButton(
                      onPressed: () {
                            print('////////////');
                            print(selectedTrim);
                            print('////////////');
                            box.write('id', id);
                            box.write('tmake', selectedMake);
                            box.write('tmodel', selectedModel);
                            box.write('ttrim', selectedTrim);
                            box.write('tregional_ar', selectedRegionalArabic);
                            box.write('tregional_en', selectedRegionalEnglish);
                            box.write('tfuel_ar', selectedFuelTypeArabic);
                            box.write('tfuel_en', selectedFuelTypeEnglish);
                            box.write('tbody_cond_ar', selectedBodyCondArabic);
                            box.write('tbody_cond_en', selectedBodyCondEnglish);
                            box.write('tmech_cond_ar', selectedMechCondArabic);
                            box.write('tmech_cond_en', selectedMechCondEnglish);
                            box.write('tyear', year.text);
                            box.write('tkilo', kilo.text);
                            box.write('tprice', price.text);
                            box.write('tnumber', number.text);

                            box.write('texterior_ar', exterior_ar);
                            box.write('texterior_en', exterior_en);
                            box.write('tinterior_ar', interor_ar);
                            box.write('tinterior_en', interior_en);
                            box.write('tdoors_ar', doors_ar);
                            box.write('tdoors_en', doors_en);
                            box.write('tno_of_ar', no_of_ar);
                            box.write('tno_of_en', no_of_en);
                            box.write('ttrans_ar', trans_ar);
                            box.write('ttrans_en', trans_en);
                            box.write('tbody_type_ar', body_type_ar);
                            box.write('tbody_type_en', body_type_en);
                            box.write('thorse_ar', horse_ar);
                            box.write('thorse_en', horse_en);
                            box.write('tsterring_ar', sterring_ar);
                            box.write('tsterring_en', sterring_en);

                            box.write('textras_ar', extras_ar);
                            box.write('textras_en', extras_en);
                            box.write('timage', image);
                            Get.to(EditTwo());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kMainColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 5),
                        child: Center(
                            child:Text(
                              "التالي",
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
                ),
              ],
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedMake,
                        hint: Text('اختر النوع'),
                        items: myData.map(( map){
                          return DropdownMenuItem(
                            child: Text(map['name']),
                            value: map['name'],
                          );
                        }).toList(),
                        onChanged:(value){
                          setState(() {
                            selectedMake=value;
                            selectedModel = null;
                            selectedTrim = null;
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
                            value: map['name'],
                          );
                        }).toList(),
                        onChanged:(value){
                          setState(() {
                            selectedModel=value;
                            selectedTrim = null;
                            getTrim(selectedMake, selectedModel);
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedTrim,
                        hint: Text('اختر الفئه'),
                        items: myTrimData.map(( map){
                          return DropdownMenuItem(
                            child: Text(map['name']),
                            value: map['name'],
                          );
                        }).toList(),
                        onChanged:(value){
                          setState(() {
                            selectedTrim=value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedRegionalArabic,
                        hint: Text('اختر المواصفات الاقليميه بالعربيه'),
                        items: myRegionalArabicData.map(( map){
                          return DropdownMenuItem(
                            child: Text(map['name_ar']),
                            value: map['name_ar'],
                          );
                        }).toList(),
                        onChanged:(value){
                          setState(() {
                            selectedRegionalArabic=value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedRegionalEnglish,
                        hint: Text('اختر المواصفات الاقليميه بالانجليزيه'),
                        items: myRegionalEnglishData.map(( map){
                          return DropdownMenuItem(
                            child: Text(map['name_en']),
                            value: map['name_en'],
                          );
                        }).toList(),
                        onChanged:(value){
                          setState(() {
                            selectedRegionalEnglish=value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedFuelTypeArabic,
                        hint: Text('اختر نوع الوقود بالعربيه'),
                        items: myFuelTypeArabicData.map(( map){
                          return DropdownMenuItem(
                            child: Text(map['name_ar']),
                            value: map['name_ar'],
                          );
                        }).toList(),
                        onChanged:(value){
                          setState(() {
                            selectedFuelTypeArabic=value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedFuelTypeEnglish,
                        hint: Text('اختر نوع الوقود بالانجليزيه'),
                        items: myFuelTypeEnglishData.map(( map){
                          return DropdownMenuItem(
                            child: Text(map['name_en']),
                            value: map['name_en'],
                          );
                        }).toList(),
                        onChanged:(value){
                          setState(() {
                            selectedFuelTypeEnglish=value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedBodyCondArabic,
                        hint: Text('اختر الحاله بالعربيه'),
                        items: myBodyCondArabicData.map(( map){
                          return DropdownMenuItem(
                            child: Text(map['name_ar']),
                            value: map['name_ar'],
                          );
                        }).toList(),
                        onChanged:(value){
                          setState(() {
                            selectedBodyCondArabic=value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedBodyCondEnglish,
                        hint: Text('اختر الحاله بالانجليزيه'),
                        items: myBodyCondEnglishData.map(( map){
                          return DropdownMenuItem(
                            child: Text(map['name_en']),
                            value: map['name_en'],
                          );
                        }).toList(),
                        onChanged:(value){
                          setState(() {
                            selectedBodyCondEnglish=value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedMechCondArabic,
                        hint: Text('اختر الحاله الميكانيكيه بالعربيه'),
                        items: myMechCondArabicData.map(( map){
                          return DropdownMenuItem(
                            child: Text(map['name_ar']),
                            value: map['name_ar'],
                          );
                        }).toList(),
                        onChanged:(value){
                          setState(() {
                            selectedMechCondArabic=value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedMechCondEnglish,
                        hint: Text('اختر الحاله الميكانيكيه بالانجليزيه'),
                        items: myMechCondEnglishData.map(( map){
                          return DropdownMenuItem(
                            child: Text(map['name_en']),
                            value: map['name_en'],
                          );
                        }).toList(),
                        onChanged:(value){
                          setState(() {
                            selectedMechCondEnglish=value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return _errorMessage("السنه");
                          // ignore: missing_return
                        }
                      },
                      controller: year,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "السنه"
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return _errorMessage("كيلوميتير");
                          // ignore: missing_return
                        }
                      },
                      controller: kilo,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "كيلوميتير"
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return _errorMessage("السعر");
                          // ignore: missing_return
                        }
                      },
                      controller: price,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "السعر"
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return _errorMessage("رقم الهاتف");
                          // ignore: missing_return
                        }
                      },
                      controller: number,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "رقم الهاتف"
                      ),
                    ),
                    SizedBox(height: 15,),
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