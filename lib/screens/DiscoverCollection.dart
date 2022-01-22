import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';

import '../Helpers/ColorScheme.dart';
import '../Helpers/font_scheme.dart';
import 'RandomiserGender.dart';
import 'choose_like.dart';

class DiscoverCollection extends StatefulWidget {
  const DiscoverCollection({Key? key}) : super(key: key);

  @override
  _DiscoverCollectionState createState() => _DiscoverCollectionState();
}

class _DiscoverCollectionState extends State<DiscoverCollection> {
  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>  ChooseLike(navigate_page: 'DiscoverCollection',),
      ),
    );
    return true; // return true if the route to be popped
  }
  showAlertDialog(BuildContext context) {

    // set up the buttons



    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      elevation: 0,

      backgroundColor: Colors.white,
      // title: Text("AlertDialog"),
      content:Lottie.asset('asset/images/lf30_editor_tnol3dkf.json'),

    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: alert);
      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      Future.delayed(Duration(seconds: 3)).whenComplete((){
        Navigator.of(context, rootNavigator: true).pop();
      });
      showAlertDialog(context);
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon:Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: (){
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  ChooseLike(navigate_page: 'DiscoverCollection',),
              ),
            );
            //Navigator.pop(context);
          },
        ),
        title: Text("MINIMALS", style:TextStyle(fontFamily: "adam",
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color:Colors.black,
            height: 0.7,
            letterSpacing: 5.7)),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: _willPopCallback,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("asset/images/randomiser/7.png", fit: BoxFit.cover,)
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: newBabyYellow,
                ),

                child: Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may ",
                style: playTitle.copyWith(color: Colors.black, fontSize: 14),
                ),
              ),
             /* InkWell(
                onTap: (){
                  Future.delayed(Duration(seconds: 3)).whenComplete((){
                    Navigator.of(context, rootNavigator: true).pop();
                  });
                  showAlertDialog(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.black,
                    boxShadow: [BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        blurRadius: 10,
                        spreadRadius: 5
                    )],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("asset/images/icons/random.png", color: Colors.white,width: 30,),
                      SizedBox(width:10),
                      Text("DISCOVER", style: TextStyle(
                          color: Colors.white,
                          fontFamily: "gotham",
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                      ),),
                    ],
                  ),
                ),
              ),*/
              NeumorphicButton(


                // margin: EdgeInsets.symmetric(vertical: 60),
                onPressed: () {
                  Future.delayed(Duration(seconds: 3)).whenComplete((){
                    Navigator.of(context, rootNavigator: true).pop();
                  });
                  showAlertDialog(context);
                },
                style: NeumorphicStyle(
                  depth: 10,
                  intensity: 0.86,
                  surfaceIntensity: 0.5,
                  shape: NeumorphicShape.flat,
                  boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(50),),
                  color:Colors.black,

                  /* shadowLightColor: Colors.white*/
                ),

                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("asset/images/icons/random.png", color: Colors.white,width: 30,),
                    SizedBox(width:10),
                    Text("DISCOVER", style: TextStyle(
                        color: Colors.white,
                        fontFamily: "gotham",
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                    ),),
                  ],
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
