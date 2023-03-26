import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class MarqueeScreen extends StatelessWidget {
  MarqueeScreen({Key? key}) : super(key: key);
  final CollectionReference _collectionReference = 
      FirebaseFirestore.instance.collection("Noticeboard");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marquee"),
      ),
      body: Center(
        child: Container(
          height: 40,
          child: StreamBuilder(
            stream: _collectionReference.snapshots(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (_, i) {
                    final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[i];
                    return Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey.withOpacity(.5),
                      child: Stack(
                        children: [
                          Marquee(
                            text: documentSnapshot['notice'],
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
                    );
                  },
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
