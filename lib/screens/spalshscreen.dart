import 'dart:async';

import 'package:carshow/constants.dart';
import 'package:carshow/screens/choose_lang.dart';
import 'package:carshow/screens/home.dart';
import 'package:carshow/screens/make.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {

  var wifiBSSID;
  var wifiIP;
  var wifiName;
  bool iswificonnected = false;
  bool isInternetOn = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getConnect();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainColor,
        body:showText(),
      ),
    );
  }

  showText(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .7,
              child: Center(
                child: SizedBox(
                    child: DefaultTextStyle(
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ScaleAnimatedText('Car Show'),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  )
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child:CircularProgressIndicator(),
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                child: Text("splash_connect".tr,style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      color: Colors.white
                  ),
                )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 5), () {
      Get.to(ChooseLang());
    });
  }

  _showDialog(){
    showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Text("splash_alert_title".tr),
            content: Text("splash_alert_message".tr),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      Navigator.of(context).pop();
                      SystemNavigator.pop();
                    });
                  },
                  child: Text("splash_alert_ok".tr)
              ),
            ],
          );
        }
    );
  }

  void getConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _showDialog();
      });
    } else if (connectivityResult == ConnectivityResult.mobile) {
      startTimer();
      //iswificonnected = false;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      startTimer();
      /*iswificonnected = true;
      setState(() async {
        wifiBSSID = await (Connectivity().getWifiBSSID());
        wifiIP = await (Connectivity().getWifiIP());
        wifiName = await (Connectivity().getWifiName());
      });*/
    }
  }
}