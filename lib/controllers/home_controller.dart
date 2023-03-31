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
    // _fetchPostData();
    // _postDataToJsonHolder();
    // _putDataToJsonHolder();
    // _patchDataToJsonHolder();
    _deleteDataToJsonHolder();
    super.onInit();
  }

  /*
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
  */

  /*
  Future<void> _postDataToJsonHolder() async {
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

        var response = await dio.post(Apis.getJsonHolderPostData,
          data: {
          'userId':'10',
          'title':"Hello! Now I learn rest API",
          'body':'my body is here',
          }
        );
        if (response.statusCode == 201) {
          debugPrint("-------------------");
          debugPrint("HTTP status code: ${response.statusCode}");
          debugPrint("HTTP status message: ${response.statusMessage}");
          debugPrint("HTTP Method: ${response.requestOptions.method}");
          debugPrint("HTTP URL: ${response.requestOptions.baseUrl}");
          debugPrint("HTTP path: ${response.requestOptions.path}");
          debugPrint("----------");

          var myPostData = response.data;
          EasyLoading.showSuccess("Post Success\nId:${myPostData['id']}", duration: const Duration(seconds: 10));

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
  */

  /*
  Future<void> _putDataToJsonHolder() async {
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

        var response = await dio.put('${Apis.getJsonHolderPostId}1',
            data: {
              'userId':'10',
              'title':"Hello! Now I learn rest API",
              'body':'my body is here',
            }
        );
        if (response.statusCode == 200) {
          debugPrint("-------------------");
          debugPrint("HTTP status code: ${response.statusCode}");
          debugPrint("HTTP status message: ${response.statusMessage}");
          debugPrint("HTTP Method: ${response.requestOptions.method}");
          debugPrint("HTTP URL: ${response.requestOptions.baseUrl}");
          debugPrint("HTTP path: ${response.requestOptions.path}");
          debugPrint("----------");

          var myPostData = response.data;
          EasyLoading.showSuccess("Update success\nId:${myPostData['id']}", duration: const Duration(seconds: 10));

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
  */

  /*
  Future<void> _patchDataToJsonHolder() async {
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

        var response = await dio.patch('${Apis.getJsonHolderPostId}20',
            data: {
              'userId':'11',
              'title':"Hello! Now I learn rest API",
              'body':'my body is here',
            }
        );
        if (response.statusCode == 200) {
          debugPrint("-------------------");
          debugPrint("HTTP status code: ${response.statusCode}");
          debugPrint("HTTP status message: ${response.statusMessage}");
          debugPrint("HTTP Method: ${response.requestOptions.method}");
          debugPrint("HTTP URL: ${response.requestOptions.baseUrl}");
          debugPrint("HTTP path: ${response.requestOptions.path}");
          debugPrint("----------");

          var myPostData = response.data;
          EasyLoading.showSuccess("Updated success\nId:${myPostData['id']}", duration: const Duration(seconds: 10));

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

   */


  Future<void> _deleteDataToJsonHolder() async {
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

        var response = await dio.delete('${Apis.getJsonHolderPostId}29',
        );
        if (response.statusCode == 200) {
          debugPrint("-------------------");
          debugPrint("HTTP status code: ${response.statusCode}");
          debugPrint("HTTP status message: ${response.statusMessage}");
          debugPrint("HTTP Method: ${response.requestOptions.method}");
          debugPrint("HTTP URL: ${response.requestOptions.baseUrl}");
          debugPrint("HTTP path: ${response.requestOptions.path}");
          debugPrint("----------");

          EasyLoading.showSuccess("Record deleted success", duration: const Duration(seconds: 10));

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