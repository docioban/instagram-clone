import 'package:flutter/material.dart';

class MainScrollNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Column(
        children: [
          ContainerPostHeader(),
          Image(
            image: AssetImage("images/avatar.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerPostReact(),
                Text("120 likes"),
                DescriptionPostText(),
              ],
            ),
          ),
        ],
      ),
      itemCount: 20,
    );
  }
}

class ContainerPostHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage("images/avatar.jpg"),
              ),
              SizedBox(width: 10),
              Text("Name_account"),
            ],
          ),
          Icon(Icons.more_horiz),
        ],
      ),
    );
  }
}

class ContainerPostReact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.favorite_border),
            SizedBox(width: 15),
            Icon(Icons.chat_bubble_outline),
            SizedBox(width: 15),
            Icon(Icons.send_rounded),
          ],
        ),
        Icon(Icons.ios_share),
      ],
    );
  }
}

class DescriptionPostText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        // text: "Hello",
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(text: "Name_account ", style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: "dsafsadfadsgasdfasdfsag asdf as sadfasf asdf dsafasd fsad"),
        ]
      ),
    );
  }
}
