import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Instagram",
        style: TextStyle(
          fontFamily: "Cookie",
          fontSize: 10.0,
          color: Colors.black
        ),
      ),
      actions: <Widget>[
        Icon(Icons.favorite_border),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/messages");
            },
            icon: Icon(Icons.send_outlined))
      ],
    );



    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Flexible(
    //         flex: 3,
    //         child: Text(
    //           "Instagram",
    //           style: TextStyle(
    //             fontFamily: "Cookie",
    //             fontSize: 40.0,
    //           ),
    //         ),
    //       ),
    //       Flexible(
    //         flex: 1,
    //         child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: [
    //               Icon(Icons.favorite_border),
    //               IconButton(
    //                   onPressed: () {
    //                     Navigator.pushNamed(context, "/messages");
    //                   },
    //                   icon: Icon(Icons.send_outlined))
    //             ]),
    //       )
    //     ],
    //   ),
    // );
  }
}
