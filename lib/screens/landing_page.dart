import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:minimals/Helpers/ColorScheme.dart';
import 'package:minimals/screens/login_page.dart';
import 'package:minimals/screens/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/images/Womens 3.jpeg",), fit: BoxFit.cover
          ),
        ),
        child: Column(

          children: [
            InkWell(
              hoverColor: Colors.transparent,
              highlightColor:Colors.transparent,
              focusColor:Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (){
                Navigator.pushReplacementNamed(context, "/mainContainer");
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Skip", style: TextStyle(
                        color: Colors.black,
                        fontFamily: "popins-r",
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),),
                  ],
                ),
              ),
            ),
            /* Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset("asset/images/V.png")
            ),*/
            Spacer(),
            /*  Center(
              child: MaterialButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, "/mainContainer");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color:newPink,
                  ),
                  child: Text("Get Started", style: TextStyle(
                      color: Colors.white,
                      fontFamily: "play",
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),*/
            Column(
              children: [
                NeumorphicButton(


                  margin: EdgeInsets.symmetric(vertical: 30),
                  onPressed: () async{

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));



                  },
                  style: NeumorphicStyle(
                    depth: 0,
                    intensity: 0.86,
                    surfaceIntensity: 0.5,
                    shape: NeumorphicShape.flat,
                    boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(25),),
                    color:Colors.black,

                    /* shadowLightColor: Colors.white*/
                  ),

                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
                  child: Text("Sign Up", style: TextStyle(
                      color: Colors.white,
                      fontFamily: "play",
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),),
                SizedBox(height:0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? ',
                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',
                            color: Colors.black,height: 0.9),),
                      InkWell(
                        hoverColor: Colors.transparent,
                        highlightColor:Colors.transparent,
                        focusColor:Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                        },
                        child: Text('Log in',
                          style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13,fontFamily: 'popins-r',
                              color: Colors.black,height: 0.9,decoration: TextDecoration.underline),),
                      )
                    ],
                  ),
                ),
                SizedBox(height:30),
              ],
            ),

            //SizedBox(height:60)
          ],
        ),
      ),
    );
  }
}
