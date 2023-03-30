import 'package:exercise_flutter/controllers/practice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PracticeScreen extends StatelessWidget {
  PracticeScreen({Key? key}) : super(key: key);
  final PracticeController _practiceController = Get.put(PracticeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
        itemCount: _practiceController.postList.length,
        itemBuilder: (_, i) {
          return ListTile(
            title: Text(_practiceController.postList[i].title.toString()),
            subtitle: Text(_practiceController.postList[i].userId.toString()),
          );
        },
      )),
    );
  }
}
