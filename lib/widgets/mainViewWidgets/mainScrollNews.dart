import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/mainViewWidgets/PostContainer.dart';
import 'package:instagram_clone/widgets/mainViewWidgets/mainScrollStories.dart';

class MainScrollNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          index == 0 ? Column(
            children: [
              MainScrollStories(),
              Divider(),
            ],
          ) : PostContainer(),
      itemCount: 20,
    );
  }
}