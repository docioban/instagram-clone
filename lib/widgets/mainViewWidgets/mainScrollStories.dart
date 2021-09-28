import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainScrollStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    return Container(
      height: 100,
      child: StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            List<Widget> items = snapshot.data!.docs
                .map((e) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: e['url'] == ""
                              ? CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      AssetImage("images/avatar.jpg"),
                                )
                              : CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(e['url']),
                                ),
                        ),
                        Center(child: Text(e["name"])),
                      ],
                    ))
                .toList();

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) => items[index],
            );
          } else {
            return Text("Loading");
          }
        },
      ),
    );
  }
}
