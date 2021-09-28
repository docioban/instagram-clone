import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/provider/google_sign_in.dart';
import 'package:instagram_clone/widgets/registerViewWidgets/buildFirstPage.dart';
import 'package:instagram_clone/widgets/registerViewWidgets/buildSecondPage.dart';
import 'package:instagram_clone/widgets/registerViewWidgets/circleIndicatiorPageWidget.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _firstPage = true;
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue[600]!,
              Colors.blue[300]!,
            ],
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ChangeNotifierProvider(
              create: (context) => GoogleSignInProvider(),
              child: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  final provider = Provider.of<GoogleSignInProvider>(context);

                  if (snapshot.hasData) {
                    if (_pageController.page! < 2) {
                      _pageController.nextPage(
                          duration: Duration(microseconds: 500),
                          curve: Curves.easeIn);
                      _firstPage = false;
                    }
                  } else if (provider.isSigningInGet()) {
                    _pageController.jumpToPage(1);
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                  }

                  return PageView(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      BuildFirstPage(),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                      BuildSecondPage(),
                    ],
                  );
                },
              ),
            ),
            Opacity(
              opacity: MediaQuery.of(context).viewInsets.bottom == 0 ? 1 : 0,
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                child: buildNavigationPoints(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavigationPoints() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _firstPage
            ? const CircleIndicatorPage(true)
            : const CircleIndicatorPage(false),
        SizedBox(
          width: 10,
        ),
        _firstPage
            ? const CircleIndicatorPage(false)
            : const CircleIndicatorPage(true),
      ],
    );
  }
}
