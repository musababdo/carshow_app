
import 'package:caradmin/constants.dart';
import 'package:caradmin/screens/admin/all_cars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  final List list;
  final int index;
  Details({required this.list,required this.index});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  final formatter = new NumberFormat("###,###");

  String? admin_name,make,model,trim,regional_ar,regional_en,fuel_type_ar,fuel_type_en,body_cond_ar,body_cond_en;
  String? mech_cond_ar,mech_cond_en,year,kilo,price,phone,exterior_color_ar,exterior_color_en;
  String? interior_color_ar,interior_color_en,doors_ar,doors_en,no_of_ar,no_of_en,trans_ar,trans_en;
  String? body_type_ar,body_type_en,horse_ar,horse_en,sterring_ar,sterring_en,extra_ar,extra_en,image,date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    admin_name = widget.list[widget.index]['admin_name'];
    make = widget.list[widget.index]['make'];
    model = widget.list[widget.index]['model'];
    trim = widget.list[widget.index]['trim'];
    regional_ar = widget.list[widget.index]['regional_specs_ar'];
    regional_en = widget.list[widget.index]['regional_specs_en'];
    fuel_type_ar = widget.list[widget.index]['fuel_type_ar'];
    fuel_type_en = widget.list[widget.index]['fuel_type_en'];
    body_cond_ar = widget.list[widget.index]['body_condition_ar'];
    body_cond_en = widget.list[widget.index]['body_condition_en'];
    mech_cond_ar = widget.list[widget.index]['mech_condition_ar'];
    mech_cond_en = widget.list[widget.index]['mech_condition_en'];
    year = widget.list[widget.index]['year'];
    kilo = widget.list[widget.index]['kilometers'];
    price = widget.list[widget.index]['price'];
    phone = widget.list[widget.index]['number'];
    exterior_color_ar = widget.list[widget.index]['exterior_color_ar'];
    exterior_color_en = widget.list[widget.index]['exterior_color_en'];
    interior_color_ar = widget.list[widget.index]['interior_color_ar'];
    interior_color_en = widget.list[widget.index]['interior_color_en'];
    doors_ar = widget.list[widget.index]['doors_ar'];
    doors_en = widget.list[widget.index]['doors_en'];
    no_of_ar = widget.list[widget.index]['no_of_cylinder_ar'];
    no_of_en = widget.list[widget.index]['no_of_cylinder_en'];
    trans_ar = widget.list[widget.index]['transmission_type_ar'];
    trans_en = widget.list[widget.index]['transmission_type_en'];
    body_type_ar = widget.list[widget.index]['body_type_ar'];
    body_type_en = widget.list[widget.index]['body_type_en'];
    horse_ar = widget.list[widget.index]['horsepower_ar'];
    horse_en = widget.list[widget.index]['horsepower_en'];
    sterring_ar = widget.list[widget.index]['steering_side_ar'];
    sterring_en = widget.list[widget.index]['steering_side_en'];
    extra_ar = widget.list[widget.index]['extras_ar'];
    extra_en = widget.list[widget.index]['extras_en'];
    image = widget.list[widget.index]['image'];
    date = widget.list[widget.index]['date'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          Get.to(AllCars());
          return Future.value(false);
        },
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 120,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.white,
                        child:GestureDetector(
                          onTap: (){
                            Get.to(AllCars());
                          },
                          child: SizedBox(
                            child: Icon(Icons.arrow_back,color: Colors.black),
                            height: 32,
                            width: 32,
                          ),
                        )
                      ),
                    ),
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)
                          ),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              Text(
                                'AED ${formatter.format(int.parse(price!))}',
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pinned: true,
                backgroundColor: kMainColor,
                expandedHeight: 400,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(image!,width: double.maxFinite,
                    fit: BoxFit.cover,),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 20,
                      color: Color(0xFFCDCBCE),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'التفاصيل',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                  fontSize: 25,
                                  color:Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Column(
                            children: [
                              Text(
                                'الفئه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                trim!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'السنه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                year!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'كيلومترات',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                kilo!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'المواصفات الاقليميه بالعربيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                regional_ar!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'المواصفات الاقليميه بالانجليزيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                regional_en!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'اللون الخارجي بالعربيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                exterior_color_ar!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'اللون الخارجي بالانجليزيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                exterior_color_en!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'عدد الابواب بالعربيه'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                doors_ar!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'عدد الابواب بالانجليزيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                doors_en!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'الحاله بالعربيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                body_cond_ar!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'الحاله بالانجليزيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                body_cond_en!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'الحاله الميكانيكيه بالعربيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                mech_cond_ar!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'الحاله الميكانيكيه بالانجليزيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                mech_cond_en!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'اللون الداخلي بالعربيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                interior_color_ar!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'اللون الداخلي بالانجليزيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                interior_color_en!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'قوه الحصان بالعربيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                horse_ar!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'قوه الحصان بالانجليزيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                horse_en!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'نوع الجسم بالعربيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                body_type_ar!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'نوع الجسم بالانجليزيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                body_type_en!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'عدد الاسطوانات بالعربيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                no_of_ar!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'عدد الاسطوانات بالانجليزيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                no_of_en!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'نوع النقل بالعربيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                trans_ar!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'نوع النقل بالانجليزيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                trans_en!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'نوع الوقود بالعربيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                fuel_type_ar!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'نوع الوقود بالانجليزيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                fuel_type_en!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'جهه القياده بالعربيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                sterring_ar!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'جهه القياده بالانجليزيه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                sterring_en!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Visibility(
                            visible: extra_ar!.isEmpty?false:true,
                            child: Column(
                              children: [
                                Text(
                                  'الاضافات بالعربيه',
                                  style: GoogleFonts.cairo(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        color:Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Text(
                                  extra_ar!,
                                  style: GoogleFonts.cairo(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        color:Colors.black38,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: extra_en!.isEmpty?false:true,
                            child: Column(
                              children: [
                                Text(
                                  'الاضافات بالانجليزيه',
                                  style: GoogleFonts.cairo(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        color:Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Text(
                                  extra_en!,
                                  style: GoogleFonts.cairo(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        color:Colors.black38,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                'تاريخ النشر',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                date!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'نشر بواسطه',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                admin_name!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
