import 'package:flutter/material.dart';
import 'package:instagram_clone/provider/save_info_regist.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/src/provider.dart';

class NumberPickerSecondPage extends StatefulWidget {
  const NumberPickerSecondPage({Key? key}) : super(key: key);

  @override
  _NumberPickerSecondPageState createState() => _NumberPickerSecondPageState();
}

class _NumberPickerSecondPageState extends State<NumberPickerSecondPage> {
  int _value = 18;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      minValue: 0,
      maxValue: 99,
      value: _value,
      onChanged: (int number) {
        setState(() {
          _value = number;
        });
        context.read<SaveInfoRegist>().setAge(_value);
      },
      axis: Axis.horizontal,
      textStyle: TextStyle(
        color: Colors.white70,
      ),
      selectedTextStyle: TextStyle(color: Colors.white, fontSize: 24),
      itemWidth: 40,
    );
  }
}
