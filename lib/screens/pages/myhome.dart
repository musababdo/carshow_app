
import 'dart:convert';

import 'package:carshow/constants.dart';
import 'package:carshow/screens/details.dart';
import 'package:carshow/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:carousel_pro/carousel_pro.dart';

class MyHome extends StatefulWidget {

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  final formatter = new NumberFormat("###,###");

  String? make,model,lang;
  bool choiceA = false;
  bool choiceB = false;
  bool choiceC = false;
  bool choiceD = false;
  bool choiceE = false;
  bool choiceF = false;
  Future Display() async{
    if(choiceA){
      var url = Uri.parse('http://10.0.2.2/carshow/sort/price/read_max_to_min.php?lang=$lang');
      var response = await http.post(url, body: {
        "make": make,
        "model": model,
      });
      var data= json.decode(response.body);
      return data;
    }else if(choiceB){
      var url = Uri.parse('http://10.0.2.2/carshow/sort/price/read_min_to_max.php?lang=$lang');
      var response = await http.post(url, body: {
        "make": make,
        "model": model,
      });
      var data= json.decode(response.body);
      return data;
    }else if(choiceC){
      var url = Uri.parse('http://10.0.2.2/carshow/sort/kilo/read_max_to_min.php?lang=$lang');
      var response = await http.post(url, body: {
        "make": make,
        "model": model,
      });
      var data= json.decode(response.body);
      return data;
    }else if(choiceD){
      var url = Uri.parse('http://10.0.2.2/carshow/sort/kilo/read_min_to_max.php?lang=$lang');
      var response = await http.post(url, body: {
        "make": make,
        "model": model,
      });
      var data= json.decode(response.body);
      return data;
    }else if(choiceE==true){
      var url = Uri.parse('http://10.0.2.2/carshow/sort/year/read_max_to_min.php?lang=$lang');
      var response = await http.post(url, body: {
        "make": make,
        "model": model,
      });
      var data= json.decode(response.body);
      return data;
    }else if(choiceF==true){
      var url = Uri.parse('http://10.0.2.2/carshow/sort/year/read_min_to_max.php?lang=$lang');
      var response = await http.post(url, body: {
        "make": make,
        "model": model,
      });
      var data= json.decode(response.body);
      return data;
    }else{
      var url = Uri.parse('http://10.0.2.2/carshow/car_read_with_make_model.php?lang=$lang');
      var response = await http.post(url, body: {
        "make": make,
        "model": model,
      });
      var data= json.decode(response.body);
      return data;
    }
  }

  Stream display() async* {
    while (true) {
      await Future.delayed(Duration(microseconds: 1));
      yield await Display();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lang = box.read('lang');
    make = box.read('make');
    model = box.read('model');
    Display();
  }

  Future editFavorite(String id,String isfavorite) async{
    var url = Uri.parse('http://10.0.2.2/carshow/favorite_edit.php');
    var response=await http.post(url, body: {
      "id"         : id,
      "isfavorite" : isfavorite,
    });
    //json.decode(response.body);
    if(response.body.isNotEmpty) {
      json.decode(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        centerTitle: true,
        title: Text('home_page1_title'.tr,
          style: GoogleFonts.cairo(
            textStyle: TextStyle(),),),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(Search());
            },
            child: Icon(
              Icons.search,
            ),
          ),
          PopupMenuButton(
              itemBuilder: (context){
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("home_sort_price_maxtomin".tr),
                  ),

                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("home_sort_price_mintomax".tr),
                  ),

                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("home_sort_kilo_maxtomin".tr),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Text("home_sort_kilo_mintomax".tr),
                  ),
                  PopupMenuItem<int>(
                    value: 4,
                    child: Text("home_sort_year_maxtomin".tr),
                  ),
                  PopupMenuItem<int>(
                    value: 5,
                    child: Text("home_sort_year_mintomax".tr),
                  ),
                ];
              },
              onSelected:(value){
                if(value == 0){
                  setState(() {
                    choiceA = true;
                    choiceB = false;
                    choiceC = false;
                    choiceD = false;
                    choiceE = false;
                    choiceF = false;
                  });
                }else if(value == 1){
                  setState(() {
                    choiceB = true;
                    choiceA = false;
                    choiceC = false;
                    choiceD = false;
                    choiceE = false;
                    choiceF = false;
                  });
                }else if(value == 2){
                  setState(() {
                    choiceC = true;
                    choiceB = false;
                    choiceA = false;
                    choiceD = false;
                    choiceE = false;
                    choiceF = false;
                  });
                }else if(value == 3){
                  setState(() {
                    choiceD = true;
                    choiceB = false;
                    choiceA = false;
                    choiceC = false;
                    choiceE = false;
                    choiceF = false;
                  });
                }else if(value == 4){
                  setState(() {
                    choiceE = true;
                    choiceA = false;
                    choiceB = false;
                    choiceC = false;
                    choiceD = false;
                    choiceF = false;
                  });
                }else if(value == 5){
                  setState(() {
                    choiceF = true;
                    choiceA = false;
                    choiceB = false;
                    choiceC = false;
                    choiceD = false;
                    choiceE = false;
                  });
                }
              }
          ),

        ],
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
                    var image=[];
                    image = jsonDecode(list[index]['image']);
                    // print('//////////////');
                    // print(image);
                    // print('//////////////');
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
                              Container(
                                height: 220.0,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(20),
                                        topRight: const Radius.circular(20),
                                      ),
                                      child: Carousel(
                                        dotIncreaseSize: 0.8,
                                        dotSize: 8,
                                        dotColor: Color(0xFFE4E5E5),
                                        dotBgColor: Colors.transparent,
                                        borderRadius: true,
                                        boxFit: BoxFit.cover,
                                        images: List.generate(
                                          image.length,
                                              (index) => Image.network(image[index],
                                            fit: BoxFit.cover,),
                                        ),
                                      ),
                                      // FadeInImage.assetNetwork(
                                      //   image: list[index]['image'],
                                      //   height: MediaQuery.of(context).size.height * 0.2,
                                      //   width:  MediaQuery.of(context).size.width,
                                      //   placeholder: 'assets/image/loader.gif',
                                      //   imageErrorBuilder: (context, error, stackTrace) {
                                      //     return Center(
                                      //       child: Image.asset('assets/image/loader.gif',
                                      //           height: 50,
                                      //           width: 50,
                                      //           fit: BoxFit.contain),
                                      //     );
                                      //   },
                                      //   fit: BoxFit.cover,
                                      // ),
                                    ),
                                    Positioned(
                                      right: 10,
                                      top: 10,
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            ClipOval(
                                              child: Material(
                                                color: Colors.white,
                                                child:list[index]['isfavorite']=="0" ?
                                                GestureDetector(
                                                  onTap:(){
                                                    setState(() {
                                                      editFavorite(list[index]['id'], "1");
                                                    });
                                                  },
                                                  child: SizedBox(
                                                    child: Icon(Icons.favorite_border,color: Colors.black),
                                                    height: 32,
                                                    width: 32,
                                                  ),
                                                ):
                                                GestureDetector(
                                                  onTap:(){
                                                    setState(() {
                                                      editFavorite(list[index]['id'], "0");
                                                    });
                                                  },
                                                  child: SizedBox(
                                                    child: Icon(Icons.favorite,color: Colors.redAccent),
                                                    height: 32,
                                                    width: 32,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start ,
                                  children: [
                                    Text(
                                      // 'AED ${formatter.format(int.parse(list[index]['price']))}',
                                      'AED ${list[index]['price']}',
                                      style: GoogleFonts.cairo(
                                        textStyle: TextStyle(
                                          fontSize: 18,
                                          color:Colors.red[700],
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${make} . ${model}',
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
                                          //'${formatter.format(int.parse(list[index]['kilometers']))}',
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
    );
  }
}