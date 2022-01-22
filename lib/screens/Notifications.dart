import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool notificationStatus = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
        title: Text("Notifications", style: TextStyle(
            fontFamily: "gotham",
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black
        ),),
      ),
      body: Column(
        children: [
          SizedBox(height:30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("NOTIFICATIONS FROM \nTHE MINIMALS APP", style: TextStyle(
                  fontFamily: "gotham",
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Colors.black
              ),),
              CupertinoSwitch(
                activeColor: Colors.black,
                  value: notificationStatus, onChanged: (val){
                setState(() {
                  notificationStatus = val;
                });
              })
            ],
          )
        ],
      ),
    );
  }
}
