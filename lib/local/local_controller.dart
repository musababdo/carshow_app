
import 'package:carshow/constants.dart';
import 'package:carshow/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocalController extends GetxController{

  //Locale intiallang = sharedpref!.getString("lang")=="ar"?Get.deviceLocale!:Locale(sharedpref!.getString("lang")!);

  void changeLang(String codelang){
    Locale locale = Locale(codelang);
    //sharedpref!.setString("lang",codelang);
    box.write('lang',codelang);
    Get.updateLocale(locale);
  }

}