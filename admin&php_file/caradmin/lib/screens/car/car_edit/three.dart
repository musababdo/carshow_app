
import 'dart:convert';
import 'dart:io';

import 'package:caradmin/constants.dart';
import 'package:caradmin/screens/car/car_add/two.dart';
import 'package:caradmin/screens/car/car_edit/two.dart';
import 'package:caradmin/screens/car/display.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditThree extends StatefulWidget {

  @override
  State<EditThree> createState() => _EditThreeState();
}

class _EditThreeState extends State<EditThree> {

  DateTime currentdate=new DateTime.now();
  String? formatdate;

  final ImagePicker picker = ImagePicker();
  List<File> imageList = [];
  File? _image;
  XFile? image;
  void openGallery()async{
    //image = await picker.pickImage(source: ImageSource.camera);
    List<XFile> images = await picker.pickMultiImage();
    //final File file_gallery = File(image!.path);
    setState(() {
      //_image=file_gallery;
      imageList.addAll(images.map((xfile) => File(xfile.path)));
      //imageList.add(file_gallery);
    });
  }

  TextEditingController extra_ar = new TextEditingController();
  TextEditingController extra_en = new TextEditingController();

  String? a_id,id,make,model,trim,regional_ar,regional_en,fuel_ar,fuel_en,body_cond_ar,body_cond_en;
  String? mech_cond_ar,mech_cond_en,year,kilo,price,phone,exterior_ar,exterior_en;
  String? interor_ar,interior_en,doors_ar,doors_en,no_of_ar,no_of_en,trans_ar,trans_en;
  String? body_type_ar,body_type_en,horse_ar,horse_en,sterring_ar,sterring_en,img;
  var theimg =[];
  Future edit() async{
    final uri = Uri.parse('http://10.0.2.2/carshow/car_edit.php');
    List<String> base64Images = [];
    String jsonImages;
    for (File imageFile in imageList) {
      List<int> imageBytes = await imageFile.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      base64Images.add(base64Image);
    }
    jsonImages = jsonEncode(base64Images);
    final response = await http.post(
      uri,
      body: {
        'id' : id,
        'a_id' : a_id,
        'make' : make,
        'model': model,
        'trim' : trim,
        'regional_specs_ar' : regional_ar,
        'regional_specs_en': regional_en,
        'fuel_type_ar' : fuel_ar,
        'fuel_type_en' : fuel_en,
        'body_condition_ar' : body_cond_ar,
        'body_condition_en' : body_cond_en,
        'mech_condition_ar' : mech_cond_ar,
        'mech_condition_en' : mech_cond_en,
        'year' : year,
        'kilometers' : kilo,
        'price' : price,
        'number' : phone,
        'exterior_color_ar' : exterior_ar,
        'exterior_color_en' : exterior_en,
        'interior_color_ar' : interor_ar,
        'interior_color_en' : interior_en,
        'doors_ar' : doors_ar,
        'doors_en' : doors_en,
        'no_of_cylinder_ar' : no_of_ar,
        'no_of_cylinder_en' : no_of_en,
        'transmission_type_ar' : trans_ar,
        'transmission_type_en' : trans_en,
        'body_type_ar' : body_type_ar,
        'body_type_en' : body_type_en,
        'horsepower_ar' : horse_ar,
        'horsepower_en' : horse_en,
        'steering_side_ar' : sterring_ar,
        'steering_side_en' : sterring_en,
        'extras_ar' : extra_ar.text,
        'extras_en' : extra_en.text,
        'images' : jsonImages,
        'date' : formatdate,
      },
    );

    if (response.statusCode == 200) {
      print('Images saved successfully');
    } else {
      print('Failed to save images');
    }
  }
  Future editwithnew() async{
    final uri = Uri.parse('http://10.0.2.2/carshow/car_editwithnew.php');
    String jsonImages;
    // for (File imageFile in theimg) {
    //   List<int> imageBytes = await imageFile.readAsBytesSync();
    //   String base64Image = base64Encode(imageBytes);
    //   base64Images.add(base64Image);
    // }
    jsonImages = jsonEncode(theimg);
    final response = await http.post(
      uri,
      body: {
        'id' : id,
        'a_id' : a_id,
        'make' : make,
        'model': model,
        'trim' : trim,
        'regional_specs_ar' : regional_ar,
        'regional_specs_en': regional_en,
        'fuel_type_ar' : fuel_ar,
        'fuel_type_en' : fuel_en,
        'body_condition_ar' : body_cond_ar,
        'body_condition_en' : body_cond_en,
        'mech_condition_ar' : mech_cond_ar,
        'mech_condition_en' : mech_cond_en,
        'year' : year,
        'kilometers' : kilo,
        'price' : price,
        'number' : phone,
        'exterior_color_ar' : exterior_ar,
        'exterior_color_en' : exterior_en,
        'interior_color_ar' : interor_ar,
        'interior_color_en' : interior_en,
        'doors_ar' : doors_ar,
        'doors_en' : doors_en,
        'no_of_cylinder_ar' : no_of_ar,
        'no_of_cylinder_en' : no_of_en,
        'transmission_type_ar' : trans_ar,
        'transmission_type_en' : trans_en,
        'body_type_ar' : body_type_ar,
        'body_type_en' : body_type_en,
        'horsepower_ar' : horse_ar,
        'horsepower_en' : horse_en,
        'steering_side_ar' : sterring_ar,
        'steering_side_en' : sterring_en,
        'extras_ar' : extra_ar.text,
        'extras_en' : extra_en.text,
        'images' : jsonImages,
        'date' : formatdate,
      },
    );

    if (response.statusCode == 200) {
      print('Images saved successfully');
    } else {
      print('Failed to save images');
    }
  }
  // Future edit() async{
  //   List<int> imageBytes = _image!.readAsBytesSync();
  //   String baseimage = base64Encode(imageBytes);
  //   var url = Uri.parse('http://10.0.2.2/carshow/car_edit.php');
  //   var response=await http.post(url, body: {
  //     'id' : id,
  //     'a_id' : a_id,
  //     'make' : make,
  //     'model': model,
  //     'trim' : trim,
  //     'regional_specs_ar' : regional_ar,
  //     'regional_specs_en': regional_en,
  //     'fuel_type_ar' : fuel_ar,
  //     'fuel_type_en' : fuel_en,
  //     'body_condition_ar' : body_cond_ar,
  //     'body_condition_en' : body_cond_en,
  //     'mech_condition_ar' : mech_cond_ar,
  //     'mech_condition_en' : mech_cond_en,
  //     'year' : year,
  //     'kilometers' : kilo,
  //     'price' : price,
  //     'number' : phone,
  //     'exterior_color_ar' : exterior_ar,
  //     'exterior_color_en' : exterior_en,
  //     'interior_color_ar' : interor_ar,
  //     'interior_color_en' : interior_en,
  //     'doors_ar' : doors_ar,
  //     'doors_en' : doors_en,
  //     'no_of_cylinder_ar' : no_of_ar,
  //     'no_of_cylinder_en' : no_of_en,
  //     'transmission_type_ar' : trans_ar,
  //     'transmission_type_en' : trans_en,
  //     'body_type_ar' : body_type_ar,
  //     'body_type_en' : body_type_en,
  //     'horsepower_ar' : horse_ar,
  //     'horsepower_en' : horse_en,
  //     'steering_side_ar' : sterring_ar,
  //     'steering_side_en' : sterring_en,
  //     'extras_ar' : extra_ar.text,
  //     'extras_en' : extra_en.text,
  //     'image' : baseimage,
  //     'date' : formatdate,
  //   });
  //   //json.decode(response.body);
  //   if(response.body.isNotEmpty) {
  //     json.decode(response.body);
  //   }
  // }

  Future saveImage() async{
    var url = Uri.parse('http://10.0.2.2/carshow/image_add.php');
    var response=await http.post(url, body: {
      //"name_ar" : name_ar.text,
    });
    //json.decode(response.body);
    if(response.body.isNotEmpty) {
      json.decode(response.body);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a_id = box.read('a_id');
    id = box.read('id');
    print('///////////');
    print(id);
    print('///////////');
    make = box.read('tmake');
    model = box.read('tmodel');
    trim = box.read('ttrim');
    regional_ar = box.read('tregional_ar');
    regional_en = box.read('tregional_en');
    fuel_ar = box.read('tfuel_ar');
    fuel_en = box.read('tfuel_en',);
    body_cond_ar = box.read('tbody_cond_ar');
    body_cond_en = box.read('tbody_cond_en',);
    mech_cond_ar = box.read('tmech_cond_ar');
    mech_cond_en = box.read('tmech_cond_en');
    year = box.read('tyear');
    kilo = box.read('tkilo');
    price = box.read('tprice');
    phone = box.read('tnumber');

    exterior_ar = box.read('texterior_ar');
    exterior_en = box.read('texterior_en');
    interor_ar = box.read('tinterior_ar');
    interior_en = box.read('tinterior_en');
    doors_ar = box.read('tdoors_ar');
    doors_en = box.read('tdoors_en');
    no_of_ar = box.read('tno_of_ar');
    no_of_en = box.read('tno_of_en');
    trans_ar = box.read('ttrans_ar');
    trans_en = box.read('ttrans_en');
    body_type_ar = box.read('tbody_type_ar');
    body_type_en = box.read('tbody_type_en');
    horse_ar = box.read('thorse_ar');
    horse_en = box.read('thorse_en');
    sterring_ar = box.read('tsterring_ar');
    sterring_en = box.read('tsterring_en');

    extra_ar.text = box.read('textras_ar');
    extra_en.text = box.read('textras_en');
    theimg = box.read('timage');

    // List<File> addImagesToFilesList(List<dynamic> imagePaths) {
    //   List<File> filesList = [];
    //   for (String imagePath in imagePaths) {
    //     File file = File(imagePath);
    //     filesList.add(file);
    //   }
    //   return filesList;
    // }
    // imageList = addImagesToFilesList(theimg);

    // for (var item in theimg) {
    //   File file = File(item);
    //   imageList.add(file);
    // }
  }

  @override
  Widget build(BuildContext context) {
    formatdate=new DateFormat('dd-MM-yyyy hh:mm:ss aaa').format(currentdate);
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          Get.to(EditTwo());
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
                    //saveImage();
                     if(imageList.isNotEmpty){
                       edit();
                       Fluttertoast.showToast(
                           msg: "تم التعديل بنجاح",
                           toastLength: Toast.LENGTH_SHORT,
                           gravity: ToastGravity.CENTER,
                           timeInSecForIosWeb: 1,
                           backgroundColor: Colors.black,
                           textColor: Colors.white,
                           fontSize: 16.0
                       );
                       Get.to(CarDisplay());
                     }else{
                       editwithnew();
                       Fluttertoast.showToast(
                           msg: "تم التعديل بنجاح",
                           toastLength: Toast.LENGTH_SHORT,
                           gravity: ToastGravity.CENTER,
                           timeInSecForIosWeb: 1,
                           backgroundColor: Colors.black,
                           textColor: Colors.white,
                           fontSize: 16.0
                       );
                       Get.to(CarDisplay());
                     }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kMainColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 5),
                    child: Center(
                        child:Text(
                          "تعديل سياره",
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
          body: Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 5,
                    controller: extra_ar,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.blue),
                        hintText: "ادخل الاضافات بالعربيه (اختياري)"
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    maxLines: 5,
                    controller: extra_en,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.blue),
                        hintText: "ادخل الاضافات بالانجليزيه (اختياري)"
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
                    child: Builder(
                      builder: (context) => ElevatedButton(
                        onPressed: () {
                          openGallery();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kMainColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 5),
                          child: Center(
                              child:Text(
                                "اختر صوره",
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
                  SizedBox(height: 10,),
                  // img!.isNotEmpty && _image == null?
                  // Container(
                  //     height: 120.0,
                  //     width: 190.0,
                  //     child:Image.network(img!)
                  // ):
                  // Container(
                  //     height: 120.0,
                  //     width: 190.0,
                  //     child:Image.file(_image!)
                  // )
                  imageList.isEmpty && theimg.isNotEmpty?
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemCount: theimg.length,
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: EdgeInsets.all(2),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                theimg[index],
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                right: -4,
                                top: -4,
                                child: Container(
                                    color: Colors.white,
                                    child: IconButton(
                                      onPressed: (){
                                        setState(() {
                                          theimg.removeAt(index);
                                        });
                                      },
                                      icon: Icon(Icons.delete),
                                      color: Colors.black,
                                    )
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ):
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                        itemCount: imageList.length,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: EdgeInsets.all(2),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.file(
                                  imageList[index],
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  right: -4,
                                  top: -4,
                                  child: Container(
                                    color: Colors.white,
                                    child: IconButton(
                                      onPressed: (){
                                        setState(() {
                                          imageList.removeAt(index);
                                        });
                                      },
                                      icon: Icon(Icons.delete),
                                      color: Colors.black,
                                    )
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
