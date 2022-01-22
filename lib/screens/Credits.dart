import 'package:flutter/material.dart';
class Credits extends StatefulWidget {
  const Credits({Key? key}) : super(key: key);

  @override
  _CreditsState createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
        title: Text("Credits", style: TextStyle(
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
            Text("CREDITS", style: TextStyle(
                fontSize: 14,
                fontFamily: "gotham",
                color: Colors.grey,
                fontWeight: FontWeight.w700
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height:30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AVAILABLE MINIMAL CREDITS", style: TextStyle(
                          fontFamily: "gotham",
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.black
                      ),),
                    ],
                  ),
                  SizedBox(height:10),
                 Text("₹ 1999", style: TextStyle(
                      fontFamily: "gotham",
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),),
                  SizedBox(height:10),
                  Text("EXPIRES 20-12-2021", style: TextStyle(
                      fontSize: 14,
                      fontFamily: "gotham",
                      color: Colors.grey,
                      fontWeight: FontWeight.w700
                  ),),
                  SizedBox(height:30),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Text("TRANSACTION LOG", style: TextStyle(
                 fontSize: 14,
                 fontFamily: "gotham",
                 color: Colors.grey,
                 fontWeight: FontWeight.w700
             ),),
            SizedBox(height:20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(0,2),
                      blurRadius: 5,
                      spreadRadius: .5
                  )]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height:10),
                      Text("01-12-2021", style: TextStyle(
                          fontSize: 14,
                          fontFamily: "gotham",
                          color: Colors.grey,
                          fontWeight: FontWeight.w700
                      ),),
                      SizedBox(height:10),
                      Text("ORDER #101213", style: TextStyle(
                          fontSize: 14,
                          fontFamily: "gotham",
                          color: Colors.grey,
                          fontWeight: FontWeight.w700
                      ),),
                      SizedBox(height:10),
                      Text("EXPIRY 20-12-2021", style: TextStyle(
                          fontSize: 14,
                          fontFamily: "gotham",
                          color: Colors.grey,
                          fontWeight: FontWeight.w700
                      ),),
                      SizedBox(height:10),
                    ],
                  ),
                  Text("+₹ 1999", style: TextStyle(
                      fontFamily: "gotham",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
