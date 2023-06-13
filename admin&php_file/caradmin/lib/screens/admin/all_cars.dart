
import 'dart:convert';

import 'package:caradmin/constants.dart';
import 'package:caradmin/screens/admin/details.dart';
import 'package:caradmin/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class AllCars extends StatefulWidget {

  @override
  State<AllCars> createState() => _AllCarsState();
}

class _AllCarsState extends State<AllCars> {

  Future Display() async{
    var url = Uri.parse('http://10.0.2.2/carshow/car_view_read.php');
    var response = await http.get(url);
    return json.decode(response.body);
  }

  Stream display() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield await Display();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Display();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return SafeArea(
      child:WillPopScope(
        onWillPop:(){
          Get.to(Home());
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kMainColor,
            centerTitle: true,
            title: Text(
              'جميع السيارات',
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body:StreamBuilder(
            stream: display(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              try {
                if(snapshot.data.length > 0 ){
                  return snapshot.hasData ?
                  ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        List list = snapshot.data;
                        return GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Details(list: list,index: index,),),);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              elevation: 8,
                              child:Column(
                                crossAxisAlignment:CrossAxisAlignment.start ,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(20),
                                      topRight: const Radius.circular(20),
                                    ),
                                    child:FadeInImage.assetNetwork(
                                      image: list[index]['image'],
                                      height: MediaQuery.of(context).size.height * 0.2,
                                      width:  MediaQuery.of(context).size.width,
                                      placeholder: 'assets/image/loader.gif',
                                      imageErrorBuilder: (context, error, stackTrace) {
                                        return Center(
                                          child: Image.asset('assets/image/loader.gif',
                                              height: 50,
                                              width: 50,
                                              fit: BoxFit.contain),
                                        );
                                      },
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:CrossAxisAlignment.start ,
                                      children: [
                                        Text(
                                          // 'AED ${formatter.format(int.parse(list[index]['price']))}',
                                          list[index]['price'],
                                          style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                                fontSize: 18,
                                                color:Colors.red[700],
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${list[index]['make']} . ${list[index]['model']}',
                                          style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                                fontSize: 18,
                                                color:Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'home_kilo'.tr,
                                              style: GoogleFonts.cairo(
                                                textStyle: TextStyle(
                                                    fontSize: 18,
                                                    color:Colors.black,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 3,),
                                            Text(
                                              list[index]['kilometers'],
                                              style: GoogleFonts.cairo(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    color:Colors.black38
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Text('|'),
                                            SizedBox(width: 10,),
                                            Text(
                                              'home_year'.tr,
                                              style: GoogleFonts.cairo(
                                                textStyle: TextStyle(
                                                    fontSize: 18,
                                                    color:Colors.black,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 3,),
                                            Text(
                                              list[index]['year'],
                                              style: GoogleFonts.cairo(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    color:Colors.black38
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                      : new Center(
                    child: Image.asset('assets/image/loader.gif'),
                  );
                }else{
                  return Container(
                    height: screenHeight -
                        (screenHeight * .08) -
                        appBarHeight -
                        statusBarHeight,
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/image/sad.gif'),
                            Text('home_no_result'.tr,
                              style: GoogleFonts.cairo(
                                textStyle: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                  );
                }
              }catch(e){
                return new Center(
                  child: Image.asset('assets/image/loader.gif'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
