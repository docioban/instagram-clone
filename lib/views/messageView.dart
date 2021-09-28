import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage("images/avatar.jpg"),
            ),
            SizedBox(width: 5.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name Person",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Active today",
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.call),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.video_call),
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return index % 2 == 0
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Flexible(
                                flex: 3,
                                child: textMessage(
                                    "Message $index tra la lalala fafds ", Colors.blue[300])),
                            Flexible(
                              flex: 2,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 2,
                              child: Container(),
                            ),
                            Flexible(
                              flex: 3,
                              child: textMessage(
                                  "Message $index tra la lalala fafds ", Colors.blue[100]),
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
          MessageTextField(),
        ],
      ),
    );
  }

  Widget textMessage(String text, Color? color) {
    return Container(
      child: Text(
        text,
      ),
      width: 300,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: color),
    );
  }
}

class MessageTextField extends StatelessWidget {
  final TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.face, color: Colors.grey,),
            ),
            Flexible(
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration.collapsed(hintText: 'Type a message', hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.send, color: Colors.blue,),
            ),
          ],
        ),
      ),
    );
  }
}
