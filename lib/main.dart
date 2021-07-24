import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/mainAppBar.dart';
import 'package:instagram_clone/widgets/mainScrollNews.dart';
import 'package:instagram_clone/widgets/mainScrollStories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              MainAppBar(),
              MainScrollStories(),
              Divider(),
              Expanded(
                child: MainScrollNews()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
