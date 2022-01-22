import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:minimals/Helpers/ColorScheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/images/Splash.jpeg",), fit: BoxFit.cover
          ),
        ),
        child: Column(

          children: [
            SizedBox(height:MediaQuery.of(context).size.height*0.136),
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
            NeumorphicButton(


                margin: EdgeInsets.symmetric(vertical: 60),
                onPressed: () async{

                  Navigator.pushReplacementNamed(context, "/landingpage");



                },
                style: NeumorphicStyle(
                  depth: 0,
                  intensity: 0.86,
                  surfaceIntensity: 0.5,
                  shape: NeumorphicShape.flat,
                  boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(25),),
                  color:newPink,

                  /* shadowLightColor: Colors.white*/
                ),

              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                child: Text("Get Started", style: TextStyle(
                    color: Colors.white,
                    fontFamily: "play",
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),),),
            //SizedBox(height:60)
          ],
        ),
      ),
    );
  }
}
