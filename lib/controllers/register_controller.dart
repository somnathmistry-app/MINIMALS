import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:minimals/api_constants/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterController {
  var token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InRlc3Rlcl9taW5pbWFsc0BnbWFpbC5jb20iLCJpZCI6IjMiLCJpYXQiOjE2NDE4MDA2OTgsIm5iZiI6MTY0MTgwMDY5OH0.vpl7LKadF_puaQU8GodfTdPV7a4WnHLoHc7wvefOTSI";

  Future<String> postRegister(var email,var password,var device_id,var name) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    

    try {

      var response = await http.post(Uri.parse("${BaseUrl.baseUrl}/register"),
          body: {
            "email" : email,
            "password" : password,
            "name" : name,
            "device_id" : device_id
          });
      print(response.body.toString());
      if (response.body.contains('"status": true')) {
        setAsLoggedIn(true);
        return "success";
      }else{

        var convert = json.decode(response.body);

        return "${convert["message"].toString()}";
      }
    } catch (e) {

      return "$e";
    }

  }
  setAsLoggedIn(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', status);
  }

}