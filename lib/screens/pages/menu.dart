
import 'package:carshow/constants.dart';
import 'package:carshow/local/local_controller.dart';
import 'package:carshow/screens/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatefulWidget {

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        centerTitle: true,
        title: Text('home_page3_title'.tr,
          style: GoogleFonts.cairo(
            textStyle: TextStyle(),),),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("menu_setting".tr, style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      fontSize: 20,
                  ),
                ),),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    dense: true,
                    trailing: Icon(Icons.arrow_forward_ios,size: 18,),
                    title: Text("menu_change_lang".tr, style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 18
                      ),
                    ),
                    ),
                    leading: Icon(Icons.g_translate,color: kMainColor,),
                    onTap: (){
                      chooseLang();
                    },
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 18,),
                    title: Text("menu_location".tr, style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 18
                      ),
                    ),),
                    leading: Icon(Icons.map,color: kMainColor),
                    onTap: (){
                      Get.to(Location());
                    },
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    dense: true,
                    trailing: Icon(Icons.arrow_forward_ios,size: 18,),
                    title: Text("menu_exit".tr, style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 18
                      ),
                    ),),
                    leading: Icon(Icons.logout,color: kMainColor),
                    onTap: (){
                      exitDialog();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
  chooseLang(){
    showModalBottomSheet(context: context, builder: (context){
      MyLocalController controller = Get.find();
      return WillPopScope(
        onWillPop:(){
          Navigator.pop(context);
          return Future.value(false);
        },
        child: SafeArea(
            child: Container(
              color: Color(0xFF737373),
              height: 180,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('choose_lang'.tr,
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            controller.changeLang("en");
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kMainColor, // Background color
                          ),
                          child: Text("English"),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            controller.changeLang("ar");
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kMainColor, // Background color
                          ),
                          child: Text("عربي"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
        ),
      );
    });
  }
  exitDialog(){
    showModalBottomSheet(context: context, builder: (context){
      return WillPopScope(
        onWillPop:(){
          Navigator.pop(context);
          return Future.value(false);
        },
        child: SafeArea(
            child: Container(
              color: Color(0xFF737373),
              height: 180,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Text("menu_exit".tr,style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),),
                    const SizedBox(height:8),
                    Text('menu_alert_message'.tr,style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),),
                    const SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text('menu_alert_btn_cancel'.tr,
                              style: GoogleFonts.cairo(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                SystemNavigator.pop();
                              });
                            },
                            child: Text('menu_alert_btn_ok'.tr,
                              style: GoogleFonts.cairo(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        ),
      );
    });
  }
}
