import 'package:flutter/material.dart';
import 'package:instagram_clone/provider/save_info_regist.dart';
import 'package:provider/src/provider.dart';

class TextFieldSecondPage extends StatefulWidget {
  const TextFieldSecondPage({Key? key}) : super(key: key);

  @override
  _TextFieldSecondPageState createState() => _TextFieldSecondPageState();
}

class _TextFieldSecondPageState extends State<TextFieldSecondPage> {
  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      cursorColor: Colors.white70,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
      onSubmitted: (text) => context.read<SaveInfoRegist>().setName(text),
      decoration: InputDecoration(
        hintText: "@username",
        hintStyle: TextStyle(color: Colors.white54),
        contentPadding: EdgeInsets.fromLTRB(9, 1, 9, 1),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.2)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.2)),
      ),
    );
  }
}
