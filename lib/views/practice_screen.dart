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
    );
  }
}
