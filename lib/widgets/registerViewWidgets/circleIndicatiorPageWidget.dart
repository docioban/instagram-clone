import 'package:flutter/material.dart';

class CircleIndicatorPage extends StatefulWidget {
  final bool isActive;
  const CircleIndicatorPage(this.isActive);

  @override
  _CircleIndicatorPageState createState() => _CircleIndicatorPageState();
}

class _CircleIndicatorPageState extends State<CircleIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      height: widget.isActive ? 12 : 8,
      width: widget.isActive ? 12 : 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: widget.isActive ? Colors.white : Colors.white70,
      ),
    );
  }
}
