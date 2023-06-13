
import 'package:caradmin/constants.dart';
import 'package:caradmin/screens/admin/all_cars.dart';
import 'package:caradmin/screens/admin/display.dart';
import 'package:caradmin/screens/body_condition/display.dart';
import 'package:caradmin/screens/body_type/display.dart';
import 'package:caradmin/screens/car/car_add/three.dart';
import 'package:caradmin/screens/car/display.dart';
import 'package:caradmin/screens/doors/display.dart';
import 'package:caradmin/screens/exterior_color/display.dart';
import 'package:caradmin/screens/fuel_type/display.dart';
import 'package:caradmin/screens/horsepower/display.dart';
import 'package:caradmin/screens/interior_color/display.dart';
import 'package:caradmin/screens/login.dart';
import 'package:caradmin/screens/make/display.dart';
import 'package:caradmin/screens/mechanical_condition/display.dart';
import 'package:caradmin/screens/model/display.dart';
import 'package:caradmin/screens/no_of_cylinders/display.dart';
import 'package:caradmin/screens/profile.dart';
import 'package:caradmin/screens/regional_spec/display.dart';
import 'package:caradmin/screens/steering_side/display.dart';
import 'package:caradmin/screens/transmission_type/display.dart';
import 'package:caradmin/screens/trim/display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String? name,type,block;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = box.read('username');
    type = box.read('type');
    block = box.read('block');
    print(name);
    print(type);
    print(block);
  }

  Future<void> signOut() async {
    setState(() {
      box.remove('id');
      box.remove('username');
      box.remove('type');
      box.remove('block');
      Fluttertoast.showToast(
          msg: "تم تسجيل الخروج",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Get.to(Login());
    //SystemNavigator.pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          SystemNavigator.pop();
          return Future.value(false);
        },
        child: Scaffold(
          drawer: new Drawer(
            child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: kMainColor,
                    ),
                    accountEmail: Text(name !=null?name!:"Your name here",style: GoogleFonts.cairo(
                      textStyle: TextStyle(color: Colors.white,fontSize: 20),),),
                    accountName: Text('مرحبا بك',style: GoogleFonts.cairo(
                      textStyle: TextStyle(color: Colors.white,fontSize: 20),),),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Column(children: <Widget>[
                      ListTile(
                        dense: true,
                        title: Text("الملف الشخصي", style: GoogleFonts.cairo(
                          textStyle: TextStyle(),),),
                        leading: Icon(Icons.person),
                        onTap: (){
                          Navigator.pop(context);
                          Get.to(Profile());
                        },
                      ),
                      Visibility(
                        visible: type=='Admin'?true:false,
                        child: ListTile(
                          dense: true,
                          title: Text("اضافه سياره", style: GoogleFonts.cairo(
                            textStyle: TextStyle(),),),
                          leading: Icon(Icons.add),
                          onTap: (){
                            if(block=='محظور'){
                              Navigator.pop(context);
                              _showDialog();
                            }else{
                              Navigator.pop(context);
                              Get.to(CarDisplay());
                              //Get.to(AddThree());
                            }
                          },
                        ),
                      ),
                      Visibility(
                        visible: type=='Admin'?false:true,
                        child: ListTile(
                          dense: true,
                          title: Text("اضافه ادمن", style: GoogleFonts.cairo(
                            textStyle: TextStyle(),),),
                          leading: Icon(Icons.person_add),
                          onTap: (){
                            Navigator.pop(context);
                            Get.to(adminDisplay());
                          },
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: Text("تسجيل خروج", style: GoogleFonts.cairo(
                          textStyle: TextStyle(),),),
                        leading: Icon(Icons.logout),
                        onTap: (){
                          Navigator.pop(context);
                          signOut();
                        },
                      ),

                    ],),
                  ),
                ]
            ),
          ),
          appBar: AppBar(
            backgroundColor: kMainColor,
            centerTitle: true,
            title: Text('الرئيسيه',
            style: GoogleFonts.cairo(
              textStyle: TextStyle(),),),),
          backgroundColor: kBackColor,
          body: Container(
            padding: EdgeInsets.all(30),
            child: type=='Admin'?
            GridView.count(
              crossAxisCount: 2,
              children: [
                InkWell(
                  onTap: (){
                    Get.to(MakeDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('النوع',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontSize: 20
                          ),),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(ModelDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('الطراز',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20
                          ),),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(TrimDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('الفئه',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20
                          ),),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(RegionalDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('المواصفات الاقليميه',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 18
                          ),),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(FuelTypeDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('نوع الوقود',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20
                          ),),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(BodyCondDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('الحاله',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20
                          ),),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(MechaCondDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('الحاله الميكانيكيه',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20
                          ),),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(ExteriorDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('اللون الخارجي',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20
                          ),),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(InteriorDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('اللون الداخلي',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20
                          ),),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(DoorsDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('عدد الابواب',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20
                          ),),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(NoOfDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('عدد الاسطوانات',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20
                          ),),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(TransmissionDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('نوع النقل',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20
                          ),),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(BodyTypeDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('نوع الجسم',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20
                          ),),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(HorseDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('قوه الحصان',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20
                          ),),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(SteeringDisplay());
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text('جهه القياده',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20
                          ),),),
                    ),
                  ),
                ),
              ],
            ):
                GridView.count(
                  crossAxisCount: 2,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(adminDisplay());
                      },
                      child: Card(
                        margin: EdgeInsets.all(5),
                        child: Center(
                          child: Text('المشرفين',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                  fontSize: 20
                              ),),),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(AllCars());
                      },
                      child: Card(
                        margin: EdgeInsets.all(5),
                        child: Center(
                          child: Text('السيارات',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                  fontSize: 20
                              ),),),
                        ),
                      ),
                    ),
                  ],
                ),

          ),
        ),
      ),
    );
  }
  _showDialog(){
    showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Text("تنبيه"),
            content: Text("لايمكنك اضافه سياره لقد تم حظرك"),
            actions: <Widget>[
              TextButton(
                  onPressed: (){
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text("حسنا")
              ),
            ],
          );
        }
    );
  }
}
