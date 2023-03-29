import 'package:exercise_flutter/models/json_holder.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class HomeController extends GetxController{
  var appBarTitle = "Home";
  var postList = <JsonHolder>[].obs;

  @override
  void onInit() {
    _fetchPostData();
    super.onInit();
  }

  Future<void> _fetchPostData() async {
    var myUrl = "https://jsonplaceholder.typicode.com";
    Dio dio = Dio(BaseOptions(
      baseUrl: myUrl
    ));
    var response = await dio.get("/posts");
    
    if(response.statusCode == 200){
      debugPrint("-------------------");
      debugPrint("HTTP status code: ${response.statusCode}");
      debugPrint("HTTP status message: ${response.statusMessage}");
      debugPrint("HTTP Method: ${response.requestOptions.method}");
      debugPrint("HTTP URL: ${response.requestOptions.baseUrl}");
      debugPrint("HTTP path: ${response.requestOptions.path}");
      debugPrint("----------");

      var myPostData = response.data as List;
      debugPrint("Data: $myPostData");

      var newList = myPostData.map((e) => JsonHolder.fromJson(e)).toList();
      postList.addAll(newList);
      debugPrint("New List length: ${newList.length}");

    } else {
      debugPrint("Failed to load data");
    }

  }
}