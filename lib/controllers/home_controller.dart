import 'package:exercise_flutter/models/json_holder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../utils/apis.dart';

class HomeController extends GetxController {
  var appBarTitle = "Home";
  var postList = <JsonHolder>[].obs;

  @override
  void onInit() {
    _fetchPostData();
    super.onInit();
  }

  Future<void> _fetchPostData() async {
    //declare object
    Dio dio = Dio(BaseOptions(baseUrl: Apis.baseUrl));
    final connectivityResult = await (Connectivity().checkConnectivity());

    try {
      if (connectivityResult == ConnectivityResult.none) {
        debugPrint("No network!");
        Fluttertoast.showToast(msg: "No network");
      } else {
        debugPrint("Connected.");
        EasyLoading.show(status: "Wait...");

        var response = await dio.get(Apis.getJsonHolderPath);
        if (response.statusCode == 200) {
          // EasyLoading.showSuccess("Success");
          var myPostData = response.data as List;
          var newList = myPostData.map((e) => JsonHolder.fromJson(e)).toList();
          postList.addAll(newList);
        } else {
          debugPrint("Failed to load data, status code error!");
          Fluttertoast.showToast(msg: "Something went wrong");
        }
      }
    } catch (e) {
      debugPrint("ERROR OCCURRED: $e");
      EasyLoading.showError("Something went wrong");
    } finally {
      EasyLoading.dismiss();
    }
  }


}