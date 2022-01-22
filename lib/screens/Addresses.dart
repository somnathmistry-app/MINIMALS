import 'package:flutter/material.dart';
class Addresses extends StatefulWidget {
  const Addresses({Key? key}) : super(key: key);

  @override
  _AddressesState createState() => _AddressesState();
}

class _AddressesState extends State<Addresses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
        title: Text("Addresses", style: TextStyle(
            fontFamily: "gotham",
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black
        ),),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Saved Addresses", style: TextStyle(
                fontFamily: "gotham",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey
            ),),
            SizedBox(height:20),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(0,2),
                      blurRadius: 5,
                      spreadRadius: .5
                  )]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                      child: Icon(Icons.settings)
                  ),
                  Text("ALEX BENJAMIN", style: TextStyle(
                      fontFamily: "gotham",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),),
                  Text("46, HART ROAD", style: TextStyle(
                      fontSize: 14,
                      fontFamily: "gotham",
                      color: Colors.grey,
                      fontWeight: FontWeight.w700
                  ),),
                  Text("NORTH WOOTTON", style: TextStyle(
                      fontSize: 14,
                      fontFamily: "gotham",
                      color: Colors.grey,
                      fontWeight: FontWeight.w700
                  ),),
                  Text("BA4 9 QT", style: TextStyle(
                      fontSize: 14,
                      fontFamily: "gotham",
                      color: Colors.grey,
                      fontWeight: FontWeight.w700
                  ),),
                  SizedBox(height:5),
                  Text("079 5753 1475", style: TextStyle(
                      fontFamily: "gotham",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: (){},
              ),
            )
          ],
        ),
      ),
    );
  }
}
