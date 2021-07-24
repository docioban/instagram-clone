import 'package:flutter/material.dart';

class MainScrollStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage("images/avatar.jpg"),
              ),
            ),
          ],
        ),
        itemCount: 20,
      ),
    );
  }
}
