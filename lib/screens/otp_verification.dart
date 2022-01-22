import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'HomeScreen.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,


        // leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
        //   Navigator.pop(context);
        // },),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),


      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left:18.0,top: 50),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(height: 14,),
                            Text('Enter the Code\nto Verify Your Account',style:
                            TextStyle(fontWeight: FontWeight.w700,fontSize: 24,fontFamily: 'popins-r',color: Colors.black,height: 1.1),),
                            SizedBox(height: 30,),


                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:18.0,top:0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(height: 14,),
                            Text('We have sent you an SMS and Email with a code to the\nnumber +91 9874561230 and your\nemail youremail@gmail.com',style:
                            TextStyle(fontWeight: FontWeight.w700,fontSize: 11,fontFamily: 'popins-r',color: Colors.black,height: 1.5),),
                            SizedBox(height: 60,),


                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
             
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,width: 50,
                    decoration: BoxDecoration(
                      //shape: BoxShape.circle,
                     borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.white,
                      border: Border.all(color: Colors.black),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15,top: 10),
                          child: TextField(
                            autofocus: true,
                            onChanged: (val){
                              FocusScope.of(context).requestFocus(focusNode2);
                            },
                            focusNode: focusNode1,
                            keyboardType: TextInputType.phone,
                            maxLength: 1,

                            decoration: InputDecoration(isDense: true,border: InputBorder.none,
                            counterText: ''
                            ),
                            style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,fontFamily: 'popins-r',color: Colors.black,height: 0.7),
                          ),
                        ),
                      ],
                    ),
                    ),
                  SizedBox(width: 10,),
                  Container(
                    height: 50,width: 50,
                    decoration: BoxDecoration(
                      //shape: BoxShape.circle,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.white,
                      border: Border.all(color: Colors.black),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15,top: 10),
                          child: TextField(
                            onChanged: (val){
                              FocusScope.of(context).requestFocus(focusNode3);
                            },
                            focusNode: focusNode2,
                            keyboardType: TextInputType.phone,
                            maxLength: 1,

                            decoration: InputDecoration(isDense: true,border: InputBorder.none,
                                counterText: ''
                            ),
                            style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,fontFamily: 'popins-r',color: Colors.black,height: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 50,width: 50,
                    decoration: BoxDecoration(
                      //shape: BoxShape.circle,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.white,
                      border: Border.all(color: Colors.black),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15,top: 10),
                          child: TextField(
                            focusNode: focusNode3,
                            onChanged: (val){
                              FocusScope.of(context).requestFocus(focusNode4);
                            },
                            keyboardType: TextInputType.phone,
                            maxLength: 1,

                            decoration: InputDecoration(isDense: true,border: InputBorder.none,
                                counterText: ''
                            ),
                            style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,fontFamily: 'popins-r',color: Colors.black,height: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 50,width: 50,
                    decoration: BoxDecoration(
                      //shape: BoxShape.circle,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.white,
                      border: Border.all(color: Colors.black),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15,top: 10),
                          child: TextField(
                            focusNode: focusNode4,
                            onChanged: (val){
                              FocusScope.of(context).unfocus();
                            },
                            keyboardType: TextInputType.phone,
                            maxLength: 1,

                            decoration: InputDecoration(isDense: true,border: InputBorder.none,
                                counterText: ''
                            ),
                            style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,fontFamily: 'popins-r',color: Colors.black,height: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              
              Column(
                children: [
                  SizedBox(height:150),

                  Center(
                    child: NeumorphicButton(


                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/mainContainer");

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
                      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
                      child:  Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Verify", style: TextStyle(
                              color: Colors.white,
                              fontFamily: "gotham",
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),),
                        ],
                      ),),
                  ),
                  SizedBox(height:30)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
   FocusNode focusNode1= FocusNode();
   FocusNode focusNode2= FocusNode();
   FocusNode focusNode3= FocusNode();
   FocusNode focusNode4= FocusNode();
}
