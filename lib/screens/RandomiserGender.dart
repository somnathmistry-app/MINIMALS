import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:minimals/screens/DiscoverCollection.dart';
import 'package:minimals/screens/DiscoverMinimals.dart';
import 'package:minimals/screens/choose_like.dart';

import '../Helpers/font_scheme.dart';
import 'Randomiser.dart';
class RandomiserGender extends StatefulWidget {
  const RandomiserGender({Key? key}) : super(key: key);

  @override
  _RandomiserGenderState createState() => _RandomiserGenderState();
}

class _RandomiserGenderState extends State<RandomiserGender> with SingleTickerProviderStateMixin{

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
  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const Randomiser(),
      ),
    );
    return true; // return true if the route to be popped
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
            onPressed: (){
              //Navigator.pop(context);
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const Randomiser(),
                ),
              );
            }
        ),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body:   WillPopScope(
        onWillPop: _willPopCallback,
        child: Container(
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
                          builder: (BuildContext context) =>  ChooseLike(navigate_page: "DiscoverCollection"),
                        ),
                      );
                      /*Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const DiscoverCollection(),
                        ),
                      );*/
                     /* Navigator.push(context, MaterialPageRoute(
                          builder: (_)=>DiscoverCollection()
                      ));*/
                    });
                    setState(() {
                      menScale = 1;
                    });

                  },
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: MediaQuery.of(context).size.height*menScale,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("asset/images/randomiser/10.png"),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          )
                      ),
                      child: Center(
                          child: Column(
                            children: [
                              SizedBox(height:MediaQuery.of(context).size.height*0.27),
                              Container(
                                color: Colors.black,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: Text("DISCOVER", style: playTitle.copyWith(color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                )),
                              ),
                              SizedBox(height:5),
                              Container(
                                color: Colors.black,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: Text("COLLECTION", style: playTitle.copyWith(color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                )),
                              ),
                            ],
                          )
                      )
                  ),
                ),
              ),
              ClipPath(
                child: InkWell(
                  onTap: (){
                    _animationController.forward().whenComplete(() {
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>  ChooseLike(navigate_page: "DiscoverMinimals"),
                        ),
                      );
                      /*Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const DiscoverMinimals(),
                        ),
                      );
*/
                     /* Navigator.push(context, MaterialPageRoute(
                          builder: (_)=>DiscoverMinimals()
                      ));*/
                    });

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*(_animation.value),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/images/randomiser/3.png"),
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.black,
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                  child: Text("DISCOVER", style: playTitle.copyWith(color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  )),
                                ),
                                SizedBox(height:5),
                                Container(
                                  color: Colors.black,
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                  child: Text("MINIMALS", style: playTitle.copyWith(color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  )),
                                ),
                              ],
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