
import 'package:dio/dio.dart';
import 'package:exercise_flutter/models/practice_model.dart';
import 'package:get/get.dart';


class PracticeController extends GetxController {
  var postList = <PracticeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchPostData();
  }

  Future<void> _fetchPostData () async {
    var myUrl = "https://jsonplaceholder.typicode.com";
    Dio dio = Dio(BaseOptions(baseUrl: myUrl));
    var response = await dio.get('/posts');

    if(response.statusCode == 200) {
      var myPostData = response.data as List;
      var newList = myPostData.map((e) => PracticeModel.fromJson(e)).toList();
      postList.addAll(newList);
      print("DONE~~~~~~~~~");

    } else {
      print("Failed!!!!!!!!!!!!!!");
    }
  }

}
