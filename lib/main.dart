import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';
import 'pages/CartPage.dart';
import 'pages/HomePage.dart';
import 'pages/ItemPage.dart';
import 'pages/LoginPage.dart';
import 'pages/OnboardingPage.dart';
import 'pages/RegisterPage.dart';
import 'pages/SplashPage.dart';
import 'provider/ItemProvider.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        routes: {
          "/" : (context) => SplashPage(),
          "onboardingPage" : (context) => OnboardingPage(),
          "homePage" : (context) => HomePage(),
          "itemPage" : (context) => ItemPage(),
          "cartPage" : (context) => CartPage(),
          "loginPage" : (context) => LoginPage(),
          "registerPage" : (context) => RegisterPage(),
        },
      ),
    );
  }
}


