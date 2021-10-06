import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:assignmenttwo/pages/signin/signin.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () async {
        Navigator.pushReplacementNamed(context, SignInScreen.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 120.0,
            width: 180.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/appicon.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          ),
          Text(
            'BMI',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ],
      )),
    );
  }
}
