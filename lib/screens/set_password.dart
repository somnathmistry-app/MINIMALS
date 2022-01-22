import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minimals/screens/PaymentPage.dart';
import 'package:minimals/screens/SuccessPage.dart';
import 'package:minimals/screens/forgot_password.dart';
import 'package:minimals/screens/otp_verification.dart';
import 'package:minimals/screens/reset_password_success.dart';
import 'package:minimals/screens/signup_page.dart';
//import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'HomeScreen.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({Key? key}) : super(key: key);

  @override
  _SetPasswordState createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {

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
        /*leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),*/
        automaticallyImplyLeading: false,


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
                            Text('Enter new Password',style:
                            TextStyle(fontWeight: FontWeight.w900,fontSize: 28,fontFamily: 'popins-r',color: Colors.black,height: 0.9),),
                            Padding(
                              padding: const EdgeInsets.only(left:0.0,top:20),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(height: 14,),
                                      Text('We have sent you an Email with a code to the\nemail youremail@gmail.com',style:
                                      TextStyle(fontWeight: FontWeight.w700,fontSize: 11,fontFamily: 'popins-r',color: Colors.black,height: 1.5),),
                                      SizedBox(height: 60,),


                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 100,),

                            Text('Password',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,
                                fontFamily: 'popins-r',color: Colors.black,height: 0.7),),
                            SizedBox(height: 10,),
                            Container(
                                height: 30,

                                width: screenWidth-36,
                                child: TextField( style: TextStyle(fontFamily: 'popins-s'),decoration: InputDecoration(
                                  disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  border: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                ),)),
                            SizedBox(height: 24,),





                            Text('Confirm Password',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,
                                fontFamily: 'popins-r',color: Colors.black,height: 0.7),),
                            SizedBox(height: 10,),
                            Container(
                                height: 30,

                                width: screenWidth-36,
                                child: TextField( maxLength: 10,keyboardType: TextInputType.number,style: TextStyle(fontFamily: 'popins-s'),decoration: InputDecoration(
                                  counterText: "",
                                  disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  border: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                ),)),

                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(height:120),

                  Center(
                    child: NeumorphicButton(


                      onPressed: () {
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const ResetSuccess(),
                          ),
                        );

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
                          Text("Save", style: TextStyle(
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
  bool is_checked=true;

}
