import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/mainViewWidgets/mainScrollNews.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Instagram",
          style: TextStyle(
            fontFamily: "Cookie",
            fontSize: 40.0,
          ),
        ),
        actions: <Widget>[
          Icon(Icons.favorite_border),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/messages");
              },
              icon: Icon(Icons.send_outlined))
        ],
      ),
      body: MainScrollNews(),
    );
  }
}
