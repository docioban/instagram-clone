import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Text(
              "Instagram",
              style: TextStyle(
                fontFamily: "Cookie",
                fontSize: 40.0,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.favorite_border),
                  Icon(Icons.send_outlined),
                ]),
          )
        ],
      ),
    );
  }
}
