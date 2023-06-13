
import 'package:carshow/constants.dart';
import 'package:carshow/screens/model.dart';
import 'package:carshow/screens/pages/menu.dart';
import 'package:carshow/screens/pages/myfavorite.dart';
import 'package:carshow/screens/pages/myhome.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 0;
  final List<Widget> _children = [
    MyHome(),
    MyFavorite(),
    Menu(),
  ];
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          Get.to(Model());
          return Future.value(false);
        },
        child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.white,
            buttonBackgroundColor: kMainColor,
            color: kMainColor,
            items: <Widget>[
              Icon(Icons.home, size: 30,color: Colors.white,),
              Icon(Icons.favorite, size: 30,color: Colors.white,),
              Icon(Icons.menu, size: 30,color: Colors.white,),
            ],
            onTap: (index) {
              onTabTapped(index);
            },
          ),
          body: _children[currentIndex],
        ),
      ),
    );
  }
}
