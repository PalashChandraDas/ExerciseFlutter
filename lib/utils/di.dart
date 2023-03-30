import 'package:get/get.dart';
import 'package:exercise_flutter/controllers/all_controllers.dart';

class MyDI extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => PracticeController);
  }
}
