import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:minimals/controllers/category_controller.dart';
import 'package:minimals/controllers/size_controller.dart';
import 'package:minimals/models/category_model.dart';
import 'package:minimals/models/size_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../Helpers/ColorScheme.dart';
import 'HomeScreen.dart';
import 'NewDiscoverScreen.dart';
class FilterScreen extends StatefulWidget {
  final String title;
  final String sub_title;
  final String brand_id;
  const FilterScreen({required this.title,required this.sub_title,required this.brand_id});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late double screenWidth;
  late double screenHeight;
  double prize_min=50;
  double prize_max=1000;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Column(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor:Colors.transparent,
                  focusColor:Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top:18.0,right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.close,size: 30,color: Colors.black,)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0,left: 18),
                  child: Text("Filters",style: TextStyle(
                    fontFamily: "popins-s",
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                    color:Colors.black,
                    height: 0.7,
                    //letterSpacing: 1.2

                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:28.0,left: 18),
                  child: Text("Price Range",style: TextStyle(
                    fontFamily: "popins-r",
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color:Colors.black,
                    height: 0.7,
                    //letterSpacing: 1.2

                  ),),
                ),

                Padding(
                  padding: const EdgeInsets.only(left:18.0,right: 18,top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("₹",style: TextStyle(
                            fontFamily: "adam",
                            fontSize: 17.5,
                            fontWeight: FontWeight.w700,
                            color:Colors.black,
                            height: 0.7,
                            //letterSpacing: 1.2

                          ),),
                          Text("50",style: TextStyle(
                            fontFamily: "popins-b",
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color:Colors.black,
                            height: 0.7,
                            //letterSpacing: 1.2

                          ),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("₹",style: TextStyle(
                            fontFamily: "adam",
                            fontSize: 17.5,
                            fontWeight: FontWeight.w700,
                            color:Colors.black,
                            height: 0.7,
                            //letterSpacing: 1.2

                          ),),
                          Text("1000",style: TextStyle(
                            fontFamily: "popins-b",
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color:Colors.black,
                            height: 0.7,
                            //letterSpacing: 1.2

                          ),),
                        ],
                      ),
                    ],
                  ),
                ),

                Center(
                  child: Container(
                    width: screenWidth-36,
                    child: SfRangeSliderTheme(
                      data:SfRangeSliderThemeData(

                        thumbColor: Colors.black,
                        activeTrackColor: Colors.grey.withOpacity(0.5),
                        inactiveTrackColor: Colors.grey.withOpacity(0.1),
                        activeTrackHeight: 4,
                        inactiveTrackHeight: 4,
                        thumbStrokeWidth: 5,


                        tooltipBackgroundColor: Colors.black,
                        tooltipTextStyle: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'popins-r'),

                      ),
                      child: SfRangeSlider(


                        min: 50.0,
                        max: 1000.0,
                        values: _values,

                        stepSize: 10,

                       // labelPlacement: LabelPlacement.onTicks,
                        showTicks: false,
                        showLabels: false,
                        enableTooltip: true,


                        //minorTicksPerInterval: 1,
                        onChanged: (SfRangeValues values){
                          setState(() {
                            _values = values;
                            prize_max=double.parse(_values.end.toString());
                            prize_min=double.parse(_values.start.toString());
                          });
                        },
                        trackShape: SfTrackShape(

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(top:0.0,left: 18,bottom: 10),
                  child: Text("Sizes",style: TextStyle(
                    fontFamily: "popins-r",
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color:Colors.black,
                    height: 0.7,
                    //letterSpacing: 1.2

                  ),),
                ),
                FutureBuilder<List<Sizes>>(
                    future: SizeController().getSizeList(),
                    builder: (context, snapshot) {
                      if(snapshot.data?.length==0){
                        return  Container();
                      }
                      else if(snapshot.hasData){


                        return   Center(
                          child: Container(
                            height: 80,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: AlwaysScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  hoverColor: Colors.transparent,
                                  highlightColor:Colors.transparent,
                                  focusColor:Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: (){
                                    setState(() {
                                      selected_size_index=int.parse(snapshot.data![index].id.toString());
                                    });
                                  },
                                  child: Padding(
                                    padding: index!=snapshot.data!.length-1? EdgeInsets.only(right:18.0):EdgeInsets.all(0),
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selected_size_index==int.parse(snapshot.data![index].id.toString())?Colors.black:Colors.white
                                      ),
                                      child: Center(
                                        child: Text(snapshot.data![index].name.substring(0,1).toUpperCase(), style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: selected_size_index==int.parse(snapshot.data![index].id.toString())?Colors.white:Colors.grey.withOpacity(0.7),
                                            fontFamily: "popins-r"
                                        ),),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );

                      }
                      else{

                        return  Center(child: Padding(
                          padding: const EdgeInsets.only(left:18.0,right: 18,top: 18),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:  MediaQuery.of(context).size.width-48,
                                height: 50,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10), )),

                                    child: Container(
                                      width:  (MediaQuery.of(context).size.width-48)/2,
                                      height: 250,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10),)
                                      ),

                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ));
                      }
                    }),


                Padding(
                  padding: const EdgeInsets.only(left:18.0,right: 18,top: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Clothing",style: TextStyle(
                          fontFamily: "popins-r",
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color:Colors.black,
                          height: 0.7,
                          //letterSpacing: 1.2

                        ),),
                        Container()
                        /*Text("Select All",style: TextStyle(
                          fontFamily: "popins-r",
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color:Colors.black,
                          height: 0.7,
                          //letterSpacing: 1.2

                        ),),*/
                      ]),
                ),
                SizedBox(height: 25,),

                FutureBuilder<List<Category>>(
                    future: CategoryController().getCategoryList(),
                    builder: (context, snapshot) {
                      if(snapshot.data?.length==0){
                        return  Container();
                      }
                      else if(snapshot.hasData){


                        return   Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                hoverColor: Colors.transparent,
                                highlightColor:Colors.transparent,
                                focusColor:Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: (){
                                  setState(() {
                                    /*if(selected_clothing_index.contains(index)){
                                      selected_clothing_index.remove(index);
                                    }else{
                                      selected_clothing_index.add(index);
                                    }*/
                                    selected_clothing_index=int.parse(snapshot.data![index].id.toString());
                                  });
                                },
                                child: Column(

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:18.0,right: 18,top: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(snapshot.data![index].name,style: TextStyle(
                                              fontFamily: 'popins-r',fontSize: 12,
                                              color: selected_clothing_index==int.parse(snapshot.data![index].id.toString())?Colors.black:Colors.grey

                                          ),),
                                          selected_clothing_index==int.parse(snapshot.data![index].id.toString())?Icon(Icons.check,color: Colors.black,size: 18,):Container()
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(left:18.0,right: 18,top: 0),
                                      child: Divider(),
                                    ),
                                    SizedBox(height: 5,),
                                  ],
                                ),
                              );
                            },
                          ),
                        );

                      }
                      else{

                        return  Center(child: Padding(
                          padding: const EdgeInsets.only(left:18.0,right: 18,top: 18),
                          child: Column(
                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:  MediaQuery.of(context).size.width-48,
                                height: 50,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10), )),

                                    child: Container(
                                      width:  (MediaQuery.of(context).size.width-48)/2,
                                      height: 250,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10),)
                                      ),

                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              SizedBox(
                                width:  MediaQuery.of(context).size.width-48,
                                height: 50,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10), )),

                                    child: Container(
                                      width:  (MediaQuery.of(context).size.width-48)/2,
                                      height: 250,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10),)
                                      ),

                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              SizedBox(
                                width:  MediaQuery.of(context).size.width-48,
                                height: 50,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10), )),

                                    child: Container(
                                      width:  (MediaQuery.of(context).size.width-48)/2,
                                      height: 250,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10),)
                                      ),

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                      }
                    }),
              ],
            )),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width-54)/2,
                    height: 45,
                    child: NeumorphicButton(


                      onPressed: () {
                        setState(() {
                          selected_clothing_index=-1;
                          selected_size_index=-1;
                          _values = SfRangeValues(50.0, 1000.0);
                        });

                      },
                      style: NeumorphicStyle(
                        depth: 0,
                        intensity: 0.0,
                        surfaceIntensity: 0.0,
                        shape: NeumorphicShape.flat,
                        boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(40),),
                        color: Colors.white,
                        border: NeumorphicBorder(color: Colors.black)

                        /* shadowLightColor: Colors.white*/
                      ),
                      //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

                      child:  Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Clear", style: TextStyle(
                              color: Colors.black,
                              fontFamily: "gotham",
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),),
                        ],
                      ),),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width-54)/2,
                    height: 45,
                    child: NeumorphicButton(


                      onPressed: ()async {
                        SharedPreferences prefs=await SharedPreferences.getInstance();

                        int selected_clothing_index=0;
                        if(selected_size_index==0){
                          setState(() {
                            selected_size='null';
                          });
                        }else{
                          setState(() {
                            selected_size=selected_size_index;
                          });
                        }
                        if(selected_clothing_index==0){
                          setState(() {
                            selected_category='null';
                          });
                        }else{
                          setState(() {
                            selected_category=selected_clothing_index;
                          });
                        }
                        if(prize_min==50&&prize_max==1000){
                          setState(() {
                            selected_prize='null';
                          });
                        }else{
                          setState(() {
                            selected_prize='$prize_min,$prize_max';
                          });
                        }
                        /*Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>  NewDiscover(
                              brand_id: widget.brand_id,title: widget.title,
                            sub_title: widget.sub_title,
                            sizes: selected_size,
                            category: selected_category,
                            prize: '$selected_prize',
                            color: 'null',
                            gender: 'null',),
                          ),
                        );*/
                        prefs.setString('size', '$selected_size');
                        prefs.setString('categ', '$selected_category');
                        prefs.setString('prize', '$selected_prize');
                        Navigator.of(context).pop();
                      },
                      style: NeumorphicStyle(
                        depth: 10,
                        intensity: 0.86,
                        surfaceIntensity: 0.5,
                        shape: NeumorphicShape.flat,
                        boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(40),),
                        color: Colors.black,

                        /* shadowLightColor: Colors.white*/
                      ),
                      //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

                      child:  Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Apply", style: TextStyle(
                              color: Colors.white,
                              fontFamily: "gotham",
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),),
                        ],
                      ),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,)


          ],
        ),
      ),
    );
  }
  var selected_size;
  var selected_category;
  var selected_prize;
  int selected_size_index=0;
  int selected_clothing_index=0;
  SfRangeValues _values = SfRangeValues(50.0, 1000.0);
  List<String>sizes=["XS","S","M","L","XL"];
  List<String>clothings=['Shoes', 'Shirts', 'Basics', 'Suits & Blazers', 'Shorts','Trousers','Jeans','Swimwear','Underwear & Innerwear','Socks','Accessories','Sportswear','Extended Sizes','Premium Selection'];
}
