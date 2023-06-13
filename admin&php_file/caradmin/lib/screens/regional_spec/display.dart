
import 'dart:convert';

import 'package:caradmin/constants.dart';
import 'package:caradmin/screens/home.dart';
import 'package:caradmin/screens/make/add.dart';
import 'package:caradmin/screens/make/edit.dart';
import 'package:caradmin/screens/regional_spec/add.dart';
import 'package:caradmin/screens/regional_spec/edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class RegionalDisplay extends StatefulWidget {

  @override
  State<RegionalDisplay> createState() => _RegionalDisplayState();
}

class _RegionalDisplayState extends State<RegionalDisplay> {

  Future Display() async{
    var url = Uri.parse('http://10.0.2.2/carshow/admin/regional_specs/read.php');
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
      child: WillPopScope(
        onWillPop:(){
          Get.to(Home());
          return Future.value(false);
        },
        child: Scaffold(
          floatingActionButton: new FloatingActionButton(
            onPressed:(){
              Get.to(RegionalAdd());
            } ,
            child: new Icon(Icons.add,color: Colors.white,),
            backgroundColor: kMainColor,
          ),
          appBar: AppBar(
            backgroundColor: kMainColor,
            centerTitle: true,
            title: Text(
              'المواصفات الاقليميه',
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
          body: StreamBuilder(
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
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: screenHeight * .18,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)
                              ),
                              elevation: 8,
                              child:Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(list[index]['name_ar'],
                                          style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                                fontSize: 20
                                            ),),),
                                        Text(list[index]['name_en'],
                                          style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                                fontSize: 20
                                            ),),),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right:20),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegionalEdit(list: list,index: index,),),);
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(context: context,
                                                    builder: (context){
                                                      return AlertDialog(
                                                        content: Text('هل انت متأكد من انك تريد الحذف'),
                                                        actions: <Widget>[
                                                          ElevatedButton(
                                                              onPressed: (){
                                                                Navigator.of(context).pop();
                                                              },
                                                              child: Text("لا")
                                                          ),
                                                          ElevatedButton(
                                                              onPressed: (){
                                                                setState(() {
                                                                  var url = Uri.parse('http://10.0.2.2/carshow/admin/regional_specs/delete.php');
                                                                  http.post(url,body: {
                                                                    'id' : list[index]['id'],
                                                                  });
                                                                  Navigator.of(context).pop();
                                                                });
                                                              },
                                                              child: Text("نعم")
                                                          ),
                                                        ],
                                                      );
                                                    }
                                                );
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    //Padding(padding: const EdgeInsets.only(right:15)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                      : new Center(
                    child: new CircularProgressIndicator(),
                  );
                }else{
                  return Container(
                    height: screenHeight -
                        (screenHeight * .08) -
                        appBarHeight -
                        statusBarHeight,
                    child: Center(
                      child: Text('لايوجد',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                    ),
                  );
                }
              }catch(e){
                return new Center(
                  child: new CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
