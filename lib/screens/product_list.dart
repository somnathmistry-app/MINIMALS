import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:minimals/Helpers/font_scheme.dart';

import '../Helpers/ColorScheme.dart';
class DiscoverScreen extends StatefulWidget {

  final String category;
  DiscoverScreen({required this.category});

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<String> menItems = ["All", "T-Shirts", "Joggers", "Hoodies"];
  List<String> womenItems = ["All", "T-Shirts", "Joggers", "Hoodies"];
  List<String> menImages = ['asset/images/mens/Mens 1.png', 'asset/images/mens/Mens 2.png', 'asset/images/mens/Mens 3.png', 'asset/images/mens/Mens 4.png'];
  List<String> womenImages = ['asset/images/womens/Women_s 1.png',
    'asset/images/womens/Women_s 2.png',
    'asset/images/womens/Wome_s 3.png',
    'asset/images/womens/Women_s 4.png'];
  List<String> accessoriesImages = ['asset/images/accessories/Wallet 1.png', 'asset/images/accessories/Wallet 2.png'];
  late List<String> items;
  late List<String> productImages;
  late double screenWidth;
  late double screenHeight;
  late int layoutType;
  String banner ="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.category == "MEN'S")
      {
        items = menItems;
        productImages = menImages;
        layoutType = 1;
        banner = "asset/images/mens/banner.png";
      }
    else if(widget.category == "WOMEN'S")
    {
      items = womenItems;
      productImages = womenImages;
      layoutType = 1;
      banner = "asset/images/womens/Women_s Banner.png";
    }
    else
      {
        items = [];
        productImages = accessoriesImages;
        layoutType = 2;
      }
  }
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.category, style: playTitle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16
        )),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_sharp, color: Colors.black,)
        ),
      ),
      body: Container(
        height: screenHeight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(items.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Center(
                        child: Text(items[index], style: adamContent),
                      ),
                    );
                  }),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    if(banner != "")SizedBox(height:20),
                    if(banner != "")ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(banner, width: screenWidth*0.95, height:100, fit: BoxFit.cover,)
                    ),

                    if(banner != "")SizedBox(height: 20,),
                    StaggeredGridView.countBuilder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      itemCount: productImages.length,
                      itemBuilder: (BuildContext context, int index) =>
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/productDetail');
                        },
                        child: new Container(
                            child: Column(
                              children: [
                               Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      image: DecorationImage(
                                        image: AssetImage(productImages[index]),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter
                                      )
                                    ),
                                  ),
                               ),
                                SizedBox(height:5),
                                Text("AUTHIORE BEIGE JACKET", style: playTitle.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.3
                                ),textAlign: TextAlign.center,),
                                Text("₹6599", style: baskerContent)
                              ],
                            )),
                      ),
                      staggeredTileBuilder: (int index) =>
                      layoutType == 1 ? new StaggeredTile.count(2, index.isEven ? 3.5 : 2.8):
                      new StaggeredTile.count(4, 3),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
