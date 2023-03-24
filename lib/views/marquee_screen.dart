import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class MarqueeScreen extends StatelessWidget {
  const MarqueeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marquee"),
      ),
      body: Center(
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.withOpacity(.5),
          child: Stack(
            children: [
              Marquee(
                text: "Today I'll learn about flutter mobile app",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                crossAxisAlignment: CrossAxisAlignment.center,
                blankSpace: 350,
              ),
              Container(
                height: 40,
                width: 60,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    "নোটিশ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
