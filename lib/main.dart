import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/views/mainView.dart';
import 'package:instagram_clone/views/messageView.dart';
import 'package:instagram_clone/views/messagesView.dart';
import 'package:instagram_clone/views/registerView.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          toolbarTextStyle: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontFamily: "MerriweatherSans",
              fontSize: 25.0,
            ),
          ).bodyText2,
          titleTextStyle: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontFamily: "MerriweatherSans",
              fontSize: 25.0,
            ),
          ).headline6,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/main": (context) => MainView(),
        "/register": (context) => RegisterView(),
        "/messages": (context) => MessagesView(),
        "/message": (context) => MessageView(),
      },
      initialRoute: "/register",
      // home: MainView(),
    );
  }
}
