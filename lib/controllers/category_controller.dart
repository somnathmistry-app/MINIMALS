import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:minimals/api_constants/base_url.dart';
import 'package:minimals/models/brand_model.dart';
import 'package:minimals/models/category_model.dart';


class CategoryController {
  var token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InRlc3Rlcl9taW5pbWFsc0BnbWFpbC5jb20iLCJpZCI6IjMiLCJpYXQiOjE2NDE4MDA2OTgsIm5iZiI6MTY0MTgwMDY5OH0.vpl7LKadF_puaQU8GodfTdPV7a4WnHLoHc7wvefOTSI";

  Future<List<Category>> getCategoryList() async {

    CategoryModel categoryModel;

    try {

      var response = await http.get(Uri.parse("${BaseUrl.baseUrl}/category"),
      );
      print(response.body.toString());
      if (response.body.isNotEmpty) {

        var jsonString = '{"categories":${response.body}}';
        var jsonMap = json.decode(jsonString);
        categoryModel = CategoryModel.fromJson(jsonMap);

        return categoryModel.categories;
      }else{

        return [];
      }
    } catch (e) {

      return [];
    }

  }


}