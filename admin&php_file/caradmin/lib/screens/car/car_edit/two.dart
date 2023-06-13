
import 'dart:async';
import 'dart:convert';
import 'package:caradmin/screens/car/car_add/one.dart';
import 'package:caradmin/screens/car/car_add/three.dart';
import 'package:caradmin/screens/car/car_add/two.dart';
import 'package:caradmin/screens/car/car_edit/one.dart';
import 'package:caradmin/screens/car/car_edit/three.dart';
import 'package:caradmin/screens/car/display.dart';
import 'package:caradmin/screens/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:caradmin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class EditTwo extends StatefulWidget {
  const EditTwo({Key? key}) : super(key: key);

  @override
  State<EditTwo> createState() => _EditTwoState();
}

class _EditTwoState extends State<EditTwo> {

  var selectedExteriorArabic;
  List myExteriorArabicData=[];
  Future getExteriorArabic() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/exterior_color/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myExteriorArabicData=data;
    });
    return data;
  }
  var selectedExteriorEnglish;
  List myExteriorEnglishData=[];
  Future getExteriorEnglish() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/exterior_color/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myExteriorEnglishData=data;
    });
    return data;
  }
  var selectedInteriorArabic;
  List myInteriorArabicData=[];
  Future getInteriorArabic() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/interior_color/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myInteriorArabicData=data;
    });
    return data;
  }
  var selectedInteriorEnglish;
  List myInteriorEnglishData=[];
  Future getInteriorEnglish() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/interior_color/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myInteriorEnglishData=data;
    });
    return data;
  }
  var selectedDoorsArabic;
  List myDoorsArabicData=[];
  Future getDoorsArabic() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/doors/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myDoorsArabicData=data;
    });
    return data;
  }
  var selectedDoorsEnglish;
  List myDoorsEnglishData=[];
  Future getDoorsEnglish() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/doors/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myDoorsEnglishData=data;
    });
    return data;
  }
  var selectedNoOfArabic;
  List myNoOfArabicData=[];
  Future getNoOfArabic() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/no_of_cylinders/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myNoOfArabicData=data;
    });
    return data;
  }
  var selectedNoOfEnglish;
  List myNoOfEnglishData=[];
  Future getNoOfEnglish() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/no_of_cylinders/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myNoOfEnglishData=data;
    });
    return data;
  }
  var selectedTransArabic;
  List myTransArabicData=[];
  Future getTransArabic() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/transmission_type/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myTransArabicData=data;
    });
    return data;
  }
  var selectedTransEnglish;
  List myTransEnglishData=[];
  Future getTransEnglish() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/transmission_type/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myTransEnglishData=data;
    });
    return data;
  }
  var selectedBodyTypeArabic;
  List myBodyTypeArabicData=[];
  Future getBodyTypeArabic() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/body_type/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myBodyTypeArabicData=data;
    });
    return data;
  }
  var selectedBodyTypeEnglish;
  List myBodyTypeEnglishData=[];
  Future getBodyTypeEnglish() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/body_type/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myBodyTypeEnglishData=data;
    });
    return data;
  }
  var selectedHorseArabic;
  List myHorseArabicData=[];
  Future getHorseArabic() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/horsepower/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myHorseArabicData=data;
    });
    return data;
  }
  var selectedHorseEnglish;
  List myHorseEnglishData=[];
  Future getHorseEnglish() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/horsepower/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myHorseEnglishData=data;
    });
    return data;
  }
  var selectedSteeringArabic;
  List mySteeringArabicData=[];
  Future getSteeringArabic() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/steering_side/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      mySteeringArabicData=data;
    });
    return data;
  }
  var selectedSteeringEnglish;
  List mySteeringEnglishData=[];
  Future getSteeringEnglish() async {
    var url = Uri.parse('http://10.0.2.2/carshow/admin/steering_side/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      mySteeringEnglishData=data;
    });
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     selectedExteriorArabic = box.read('texterior_ar');
     selectedExteriorEnglish = box.read('texterior_en');
     selectedInteriorArabic = box.read('tinterior_ar');
     selectedInteriorEnglish = box.read('tinterior_en');
     selectedDoorsArabic = box.read('tdoors_ar');
     selectedDoorsEnglish = box.read('tdoors_en');
     selectedNoOfArabic = box.read('tno_of_ar');
     selectedNoOfEnglish = box.read('tno_of_en');
     selectedTransArabic = box.read('ttrans_ar');
     selectedTransEnglish = box.read('ttrans_en');
     selectedBodyTypeArabic = box.read('tbody_type_ar');
     selectedBodyTypeEnglish = box.read('tbody_type_en');
     selectedHorseArabic= box.read('thorse_ar');
     selectedHorseEnglish = box.read('thorse_en');
    selectedSteeringArabic = box.read('tsterring_ar');
    selectedSteeringEnglish =  box.read('tsterring_en');

    getExteriorArabic();
    getExteriorEnglish();
    getInteriorArabic();
    getInteriorEnglish();
    getDoorsArabic();
    getDoorsEnglish();
    getNoOfArabic();
    getNoOfEnglish();
    getTransArabic();
    getTransEnglish();
    getBodyTypeArabic();
    getBodyTypeEnglish();
    getHorseArabic();
    getHorseEnglish();
    getSteeringArabic();
    getSteeringEnglish();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
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
                    // box.write('texterior_ar', selectedExteriorArabic);
                    // box.write('texterior_en', selectedExteriorEnglish);
                    // box.write('tinterior_ar', selectedInteriorArabic);
                    // box.write('tinterior_en', selectedInteriorEnglish);
                    // box.write('tdoors_ar', selectedDoorsArabic);
                    // box.write('tdoors_en', selectedDoorsEnglish);
                    // box.write('tno_of_ar', selectedNoOfArabic);
                    // box.write('tno_of_en', selectedNoOfEnglish);
                    // box.write('ttrans_ar', selectedTransArabic);
                    // box.write('ttrans_en', selectedTransEnglish);
                    // box.write('tbody_type_ar', selectedBodyTypeArabic);
                    // box.write('tbody_type_en', selectedBodyTypeEnglish);
                    // box.write('thorse_ar', selectedHorseArabic);
                    // box.write('thorse_en', selectedHorseEnglish);
                    // box.write('tsterring_ar', selectedSteeringArabic);
                    // box.write('tsterring_en', selectedSteeringEnglish);
                    Get.to(EditThree());
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
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedExteriorArabic,
                      hint: Text('اختر اللون الخارجي بالعربيه'),
                      items: myExteriorArabicData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_ar']),
                          value: map['name_ar'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedExteriorArabic=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedExteriorEnglish,
                      hint: Text('اختر اللون الخارجي بالانجليزيه'),
                      items: myExteriorEnglishData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_en']),
                          value: map['name_en'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedExteriorEnglish=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedInteriorArabic,
                      hint: Text('اختر اللون الداخلي بالعربيه'),
                      items: myInteriorArabicData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_ar']),
                          value: map['name_ar'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedInteriorArabic=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedInteriorEnglish,
                      hint: Text('اختر اللون الداخلي بالانجليزيه'),
                      items: myInteriorEnglishData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_en']),
                          value: map['name_en'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedInteriorEnglish=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedDoorsArabic,
                      hint: Text('اختر عدد الابواب بالعربيه'),
                      items: myDoorsArabicData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_ar']),
                          value: map['name_ar'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedDoorsArabic=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedDoorsEnglish,
                      hint: Text('اختر عدد الابواب بالانجليزيه'),
                      items: myDoorsEnglishData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_en']),
                          value: map['name_en'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedDoorsEnglish=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedNoOfArabic,
                      hint: Text('اختر عدد الاسطوانات بالعربيه'),
                      items: myNoOfArabicData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_ar']),
                          value: map['name_ar'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedNoOfArabic=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedNoOfEnglish,
                      hint: Text('اختر عدد الاسطوانات بالانجليزيه'),
                      items: myNoOfEnglishData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_en']),
                          value: map['name_en'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedNoOfEnglish=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedTransArabic,
                      hint: Text('اختر نوع النقل بالعربيه'),
                      items: myTransArabicData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_ar']),
                          value: map['name_ar'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedTransArabic=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedTransEnglish,
                      hint: Text('اختر نوع النقل بالانجليزيه'),
                      items: myTransEnglishData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_en']),
                          value: map['name_en'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedTransEnglish=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedBodyTypeArabic,
                      hint: Text('اختر نوع الجسم بالعربيه'),
                      items: myBodyTypeArabicData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_ar']),
                          value: map['name_ar'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedBodyTypeArabic=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedBodyTypeEnglish,
                      hint: Text('اختر نوع الجسم بالانجليزيه'),
                      items: myBodyTypeEnglishData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_en']),
                          value: map['name_en'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedBodyTypeEnglish=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedHorseArabic,
                      hint: Text('اختر قوه الحصان بالعربيه'),
                      items: myHorseArabicData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_ar']),
                          value: map['name_ar'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedHorseArabic=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedHorseEnglish,
                      hint: Text('اختر قوه الحصان بالانجليزيه'),
                      items: myHorseEnglishData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_en']),
                          value: map['name_en'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedHorseEnglish=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedSteeringArabic,
                      hint: Text('اختر جهه القياده بالعربيه'),
                      items: mySteeringArabicData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_ar']),
                          value: map['name_ar'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedSteeringArabic=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedSteeringEnglish,
                      hint: Text('اختر جهه القياده بالانجليزيه'),
                      items: mySteeringEnglishData.map(( map){
                        return DropdownMenuItem(
                          child: Text(map['name_en']),
                          value: map['name_en'],
                        );
                      }).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedSteeringEnglish=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
