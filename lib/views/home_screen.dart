import 'package:flutter/material.dart';
import 'package:exercise_flutter/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../constant.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/homescreen";

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_homeController.appBarTitle),
      ),

      body: FutureBuilder(
        future: checkNet(),
        builder: (context, snap) {
          if(snap.data == true) {
            return Obx(() => ListView.builder(
              itemCount: _homeController.postList.length,
              itemBuilder:(c, i) {
                return ListTile(
                  title: Text(_homeController.postList[i].title.toString()),
                );

              },));
          } else {
            return const Center(child: CircularProgressIndicator());
          }

        },
      ),
    );

  }

}
