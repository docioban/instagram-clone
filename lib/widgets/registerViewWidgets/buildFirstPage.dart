import 'package:flutter/material.dart';
import 'package:instagram_clone/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class BuildFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 3,
          child: Container(),
        ),
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            'images/instagram_icon.png',
            height: 150,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Instagram clone',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () async {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              await provider.login();
              provider.isSigningInSet(false);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FlutterLogo(),
                Text(
                  "Sign in with Google",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }
}
