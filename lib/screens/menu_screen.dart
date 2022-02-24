import 'package:flutter/material.dart';
class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),

        title: Text("Menu", style: TextStyle(
            fontFamily: "gotham",
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black
        ),),
      ),
      body: Column(
        children: [
          Expanded(

             child: Column(
               children: [
                 SizedBox(height: 25,),
                 Padding(
                   padding: const EdgeInsets.only(left:10,right: 10),
                   child: Row(
                     children: [
                       Text("GENERAL", style: TextStyle(
                           fontFamily: "popins-r",
                           fontSize: 14,
                           fontWeight: FontWeight.w900,
                           color: Colors.black,
                           letterSpacing: 0.9,
                           height: 0.7
                       ),),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left:10,right: 10),
                   child: Divider(),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left:30,right: 10),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                       SizedBox(height: 8,),

                       InkWell(
                         onTap: (){
                           Navigator.pushNamed(context, "/myOrder");
                         },
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Text("ORDERS", style: TextStyle(
                                 fontFamily: "popins-r",
                                 fontSize: 13,
                                 fontWeight: FontWeight.w900,
                                 color: Colors.grey,
                                 height: 0.7,letterSpacing: 0.9

                             ),
                             ),
                             Icon(Icons.arrow_forward,color: Colors.grey,size: 18,)
                           ],
                         ),
                       ),

                       SizedBox(height: 5,),
                       InkWell(
                         onTap: (){
                           Navigator.pushNamed(context, "/returns");
                         },
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Text("RETURNS", style: TextStyle(
                                 fontFamily: "popins-r",
                                 fontSize: 13,
                                 fontWeight: FontWeight.w900,
                                 color: Colors.grey,
                                 height: 0.7,letterSpacing: 0.9

                             ),
                             ),
                             Icon(Icons.arrow_forward,color: Colors.grey,size: 18,)
                           ],
                         ),
                       ),

                       SizedBox(height: 5,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text("FAVOURITES", style: TextStyle(
                               fontFamily: "popins-r",
                               fontSize: 13,
                               fontWeight: FontWeight.w900,
                               color: Colors.grey,
                               height: 0.7,letterSpacing: 0.9

                           ),
                           ),
                           Icon(Icons.arrow_forward,color: Colors.grey,size: 18,)
                         ],
                       ),

                     ],
                   ),
                 ),


                 SizedBox(height: 35,),
                 Padding(
                   padding: const EdgeInsets.only(left:10,right: 10),
                   child: Row(
                     children: [
                       Text("ACCOUNT", style: TextStyle(
                           fontFamily: "popins-r",
                           fontSize: 14,
                           fontWeight: FontWeight.w900,
                           color: Colors.black,
                           letterSpacing: 0.9,
                           height: 0.7
                       ),),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left:10,right: 10),
                   child: Divider(),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left:30,right: 10),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                       SizedBox(height: 8,),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text("PROFILE", style: TextStyle(
                               fontFamily: "popins-r",
                               fontSize: 13,
                               fontWeight: FontWeight.w900,
                               color: Colors.grey,
                               height: 0.7,letterSpacing: 0.9

                           ),
                           ),
                           Icon(Icons.arrow_forward,color: Colors.grey,size: 18,)
                         ],
                       ),

                       SizedBox(height: 5,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text("ADDRESSES", style: TextStyle(
                               fontFamily: "popins-r",
                               fontSize: 13,
                               fontWeight: FontWeight.w900,
                               color: Colors.grey,
                               height: 0.7,letterSpacing: 0.9

                           ),
                           ),
                           Icon(Icons.arrow_forward,color: Colors.grey,size: 18,)
                         ],
                       ),

                       SizedBox(height: 5,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text("SECURITY", style: TextStyle(
                               fontFamily: "popins-r",
                               fontSize: 13,
                               fontWeight: FontWeight.w900,
                               color: Colors.grey,
                               height: 0.7,letterSpacing: 0.9

                           ),
                           ),
                           Icon(Icons.arrow_forward,color: Colors.grey,size: 18,)
                         ],
                       ),

                       SizedBox(height: 5,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text("CREDITS", style: TextStyle(
                               fontFamily: "popins-r",
                               fontSize: 13,
                               fontWeight: FontWeight.w900,
                               color: Colors.grey,
                               height: 0.7,letterSpacing: 0.9

                           ),
                           ),
                           Icon(Icons.arrow_forward,color: Colors.grey,size: 18,)
                         ],
                       ),

                     ],
                   ),
                 ),


                 SizedBox(height: 35,),
                 Padding(
                   padding: const EdgeInsets.only(left:10,right: 10),
                   child: Row(
                     children: [
                       Text("SUPPORT", style: TextStyle(
                           fontFamily: "popins-r",
                           fontSize: 14,
                           fontWeight: FontWeight.w900,
                           color: Colors.black,
                           letterSpacing: 0.9,
                           height: 0.7
                       ),),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left:10,right: 10),
                   child: Divider(),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left:30,right: 10),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                       SizedBox(height: 8,),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text("TERMS OF USE", style: TextStyle(
                               fontFamily: "popins-r",
                               fontSize: 13,
                               fontWeight: FontWeight.w900,
                               color: Colors.grey,
                               height: 0.7,letterSpacing: 0.9

                           ),
                           ),
                           Icon(Icons.arrow_forward,color: Colors.grey,size: 18,)
                         ],
                       ),

                       SizedBox(height: 5,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text("PRIVACY POLICY", style: TextStyle(
                               fontFamily: "popins-r",
                               fontSize: 13,
                               fontWeight: FontWeight.w900,
                               color: Colors.grey,
                               height: 0.7,letterSpacing: 0.9

                           ),
                           ),
                           Icon(Icons.arrow_forward,color: Colors.grey,size: 18,)
                         ],
                       ),

                       SizedBox(height: 5,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text("RETURN POLICY", style: TextStyle(
                               fontFamily: "popins-r",
                               fontSize: 13,
                               fontWeight: FontWeight.w900,
                               color: Colors.grey,
                               height: 0.7,letterSpacing: 0.9

                           ),
                           ),
                           Icon(Icons.arrow_forward,color: Colors.grey,size: 18,)
                         ],
                       ),

                       SizedBox(height: 5,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text("CUSTOMER CARE", style: TextStyle(
                               fontFamily: "popins-r",
                               fontSize: 13,
                               fontWeight: FontWeight.w900,
                               color: Colors.grey,
                               height: 0.7,letterSpacing: 0.9

                           ),
                           ),
                           Icon(Icons.arrow_forward,color: Colors.grey,size: 18,)
                         ],
                       ),

                     ],
                   ),
                 ),
               ],
             ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:18.0,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:4.0),
                  child: Text("Logout", style: TextStyle(
                      fontFamily: "popins-r",
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey,
                      height: 0.7,letterSpacing: 0.9

                  ),
                  ),
                ),
                SizedBox(width: 10,),
                Icon(Icons.arrow_forward,color: Colors.grey,size: 18,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
