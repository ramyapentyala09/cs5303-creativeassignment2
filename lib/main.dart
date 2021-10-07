import 'package:assignmenttwo/pages/bmi/input_page.dart';
import 'package:assignmenttwo/pages/home/home.dart';
import 'package:assignmenttwo/pages/profile/profile.dart';
import 'package:assignmenttwo/pages/signin/signin.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI calculator',
      initialRoute: SignInScreen.routeName,
      routes: {
        SignInScreen.routeName: (context) => SignInScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        InputPage.routeName: (context) => InputPage(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
      },
    );
  }
}
