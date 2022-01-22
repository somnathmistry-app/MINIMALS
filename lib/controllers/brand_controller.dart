import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:minimals/api_constants/base_url.dart';
import 'package:minimals/models/brand_model.dart';


class BrandController {
  var token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InRlc3Rlcl9taW5pbWFsc0BnbWFpbC5jb20iLCJpZCI6IjMiLCJpYXQiOjE2NDE4MDA2OTgsIm5iZiI6MTY0MTgwMDY5OH0.vpl7LKadF_puaQU8GodfTdPV7a4WnHLoHc7wvefOTSI";

  Future<List<Brand>> getBrandList() async {

    BrandsModel brandsModel;

    try {

      var response = await http.get(Uri.parse("${BaseUrl.baseUrl}/brands"),
         );
      print(response.body.toString());
      if (response.body.isNotEmpty) {

        var jsonString = '{"brands":${response.body}}';
        var jsonMap = json.decode(jsonString);
        brandsModel = BrandsModel.fromJson(jsonMap);
       
        return brandsModel.brands;
      }else{

        return [];
      }
    } catch (e) {

      return [];
    }

  }

  
}