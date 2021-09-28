import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/messagesViewWidgets/ConversationsList.dart';

class MessagesView extends StatefulWidget {
  @override
  _MessagesViewState createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Flexible(child: Text("Dorin.ciobanu")),
            Icon(
              Icons.expand_more,
              size: 35,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.camera_alt),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.edit),
          ),
        ],
        bottom: TabBar(
          labelColor: Colors.blue[800],
          tabs: <Widget>[
            Tab(
              text: "first",
            ),
            Tab(
              text: "second",
            ),
            Tab(
              text: "third",
            )
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        ConversationsList(),
        Center(
          child: Text("sdaf"),
        ),
        Center(
          child: Text("third"),
        ),
      ]),
    );
  }
}