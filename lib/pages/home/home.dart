import 'package:assignmenttwo/common/userrecord.dart';
import 'package:assignmenttwo/pages/bmi/input_page.dart';
import 'package:assignmenttwo/pages/profile/profile.dart';
import 'package:assignmenttwo/pages/signin/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as UserRecord;
    UserRecord.data = user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.routeName,
                      arguments: UserRecord.data)
                  .then((result) {
                setState(() {});
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.pushReplacementNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Good Morning, ' + UserRecord.data.name,
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            ListTile(
              title: Card(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    'Weight : ' + UserRecord.data.weight,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Card(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    'Height : ' + UserRecord.data.height,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, InputPage.routeName);
              },
              title: const Card(
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text(
                    'Calculate BMI Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
