import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatefulWidget {
  const SharedPref({Key? key}) : super(key: key);

  @override
  State<SharedPref> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  //variable
  static const likedKey = "liked_key";
  late bool liked = false;

  @override
  void initState() {
    super.initState();
    _restorePersistedPreference();
  }

  _restorePersistedPreference() async {
    var preferences = await SharedPreferences.getInstance();
    var liked = preferences.getBool(likedKey);
    setState(() {
      this.liked = liked!;
    });
  }

  _persistPreference() async {
    setState(() {
      liked = !liked;
    });
    var preferences = await SharedPreferences.getInstance();
    preferences.setBool(likedKey, liked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _persistPreference,

              icon: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                color: liked ? Colors.red : Colors.white,
              ))
        ],
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text("Add"),
        ),
      ),
    );
  }
}
