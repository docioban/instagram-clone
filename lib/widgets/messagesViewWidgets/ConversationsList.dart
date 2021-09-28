import 'package:flutter/material.dart';

class ConversationsList extends StatefulWidget {
  @override
  _ConversationsListState createState() => _ConversationsListState();
}

class _ConversationsListState extends State<ConversationsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return index == 0 ? 
        // SearchBar(setState: setState, buildDefaultAppBar: build).build(context)
        SizedBox(height: 10,)
         : ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage("images/avatar.jpg"),
          ),
          trailing: Icon(Icons.camera_alt),
          title: Text("Name person $index"),
          subtitle: Text("Active today"),
          onTap: () {Navigator.pushNamed(context, '/message');},
        );
      },
    );
  }
}
