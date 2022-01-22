import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import '../Helpers/font_scheme.dart';
import 'RandomiserGender.dart';
class Randomiser extends StatefulWidget {
  const Randomiser({Key? key}) : super(key: key);

  @override
  _RandomiserState createState() => _RandomiserState();
}

class _RandomiserState extends State<Randomiser> with SingleTickerProviderStateMixin{

  late Animation<double> _animation;
  late Animation<double> _leftAnimation;
  late Tween<double> _tween;
  late Tween<double> _leftTween;
  late AnimationController _animationController;
  double menScale = 0.6;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _tween = Tween(begin: 0.6, end: 1);
    _animation = _tween.animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _leftTween = Tween(begin: 0.4, end:1);
    _leftAnimation = _leftTween.animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          }
        ),
        backgroundColor: Colors.transparent,
       systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body:   Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: (){
                  _tween = Tween(begin: 0.6, end: 0);
                  _leftTween = Tween(begin:0.4, end:0);

                  _animation = _tween.animate(_animationController)
                    ..addListener(() {
                      setState(() {});
                    });
                  _leftAnimation = _leftTween.animate(_animationController)
                    ..addListener(() {
                      setState(() {});
                    });

                  _animationController.forward().whenComplete(() {
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const RandomiserGender(),
                      ),
                    );
                   // Navigator.pushNamed(context, '/randomiserGender');
                    //menScale=0.6;

                  });
                  setState(() {
                    menScale = 1;
                  });
                   //Navigator.pushNamed(context, '/randomiserGender');
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: MediaQuery.of(context).size.height*menScale,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("asset/images/randomiser/9.png"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      )
                    ),
                    child: Center(
                        child: Text("MEN", style: playTitle.copyWith(color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold
                        ))
                    )
                ),
              ),
            ),
            ClipPath(
              child: InkWell(
                onTap: (){
                  _animationController.forward().whenComplete(() {
                    //Navigator.pushNamed(context, '/randomiserGender');
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const RandomiserGender(),
                      ),
                    );
                  });
                  // Navigator.pushNamed(context, '/randomiserGender');
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height*(_animation.value),
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage("asset/images/randomiser/2.png"),
                       alignment: Alignment.topCenter,
                     fit: BoxFit.cover
                   ),
                 ),
                child: Column(
                  children: [
                    SizedBox(height:MediaQuery.of(context).size.height*0.24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Text("WOMEN", style: playTitle.copyWith(color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                            ))
                          ),
                      ],
                    ),
                  ],
                ),
                ),
              ),
              clipper: FirstClipPath(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height, cropValLeft: _leftAnimation.value, cropValRight: _animation.value),
            ),
            

          ],
        ),
      ),
    );


  }
}

class FirstClipPath extends CustomClipper<Path> {
  FirstClipPath({required this.width,required this.height,required this.cropValRight, required this.cropValLeft});
  double width,height,cropValRight, cropValLeft;
  var radius=10.0;

  @override
  Path getClip(Size size) {
    print(cropValLeft);
    print(cropValRight);
    Path path = Path();
    path.lineTo(0, height*cropValRight);
    path.lineTo(width,height*cropValLeft);
    path.lineTo(width,0);
    path.lineTo(0, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}