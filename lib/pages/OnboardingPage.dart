import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:my_project/pages/LoginPage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        buttonColor: Colors.white,
        pages: pages,
        showBullets: true,
        skipCallback: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        finishCallback: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: Color.fromRGBO(24, 132, 111, 0.8),
        imageAssetPath: 'assets/images/banner1.png',
        doAnimateImage: true,
        title: 'Welcome to MONO',
        body: 'Together shopping now',
    ),
    PageModel(
        color: Color.fromRGBO(24, 132, 111, 0.8),
        imageAssetPath: 'assets/images/banner2.png',
        doAnimateImage: true,
        title: 'MONO Fashion Shopping App',
        body: 'Share your ideas with the team',
    ),
    PageModel(
      color: Color.fromRGBO(24, 132, 111, 0.8),
        imageAssetPath: 'assets/images/banner3.png',
        doAnimateImage: true,
        title: 'Fashion of the world in your phone',
        body: 'Your best fashion shopping app',
    ),
  ];
}
