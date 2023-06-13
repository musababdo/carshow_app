
import 'package:carshow/constants.dart';
import 'package:carshow/local/local_controller.dart';
import 'package:carshow/screens/make.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseLang extends StatefulWidget {
  const ChooseLang({Key? key}) : super(key: key);

  @override
  State<ChooseLang> createState() => _ChooseLangState();
}

class _ChooseLangState extends State<ChooseLang> {
  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.find();
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          SystemNavigator.pop();
          return Future.value(false);
        },
        child: Scaffold(
          body:Center(
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
                        Get.to(Make());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kMainColor, // Background color
                      ),
                      child: Text("English"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        controller.changeLang("ar");
                        Get.to(Make());
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
        ),
      ),
    );
  }
}
