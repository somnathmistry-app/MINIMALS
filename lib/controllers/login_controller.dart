import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:minimals/api_constants/base_url.dart';
import 'package:minimals/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginController {
  var token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InRlc3Rlcl9taW5pbWFsc0BnbWFpbC5jb20iLCJpZCI6IjMiLCJpYXQiOjE2NDE4MDA2OTgsIm5iZiI6MTY0MTgwMDY5OH0.vpl7LKadF_puaQU8GodfTdPV7a4WnHLoHc7wvefOTSI";

  Future<String> postLogin(var email,var password,var device_id) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    LoginModel loginModel;

    try {

      var response = await http.post(Uri.parse("${BaseUrl.baseUrl}/login"),
          body: {
            "email" : email,
            "password" : password,
            "device_id" : device_id
          });
      print(response.body.toString());
      if (response.body.contains('token')) {
        print('hhhhhhhhhhhhhhheeeeeeeeeeeeeeeeee');

        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        loginModel = LoginModel.fromJson(jsonMap);
        prefs.setString('token', '${loginModel.token}');
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
    print("JJJJJJJJJJJJ $status" );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', status);
  }

}