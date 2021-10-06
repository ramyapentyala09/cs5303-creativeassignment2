import 'package:assignmenttwo/common/userrecord.dart';
import 'package:assignmenttwo/common/styles.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  static String routeName = 'profile_screen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controllerFirstName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerHeight = TextEditingController();
  final _controllerProteinLevel = TextEditingController();
  final _controllerWeight = TextEditingController();

  bool flag = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        final user = ModalRoute.of(context)!.settings.arguments as UserRecord;
        _controllerFirstName.text = user.name;
        _controllerEmail.text = user.email;
        _controllerHeight.text = user.height;
        _controllerProteinLevel.text = user.protein;
        _controllerWeight.text = user.weight;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as UserRecord;
    Future<bool> _onWillPop() async {
      print('hello');
      Navigator.pop(context, 'refresh');
      return false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
        ),
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            enabled: flag,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                labelText: 'First Name',
                                hintText: 'Enter First Name'),
                            controller: _controllerFirstName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter First Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            enabled: flag,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                labelText: 'Email',
                                hintText: 'Enter Email'),
                            controller: _controllerEmail,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            enabled: flag,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                labelText: 'Height',
                                hintText: 'Enter Height'),
                            controller: _controllerHeight,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Height';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            enabled: flag,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                labelText: 'Protein Level',
                                hintText: 'Enter Protein Level'),
                            controller: _controllerProteinLevel,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Protein Level';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            enabled: flag,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                labelText: 'Weight',
                                hintText: 'Enter Weight'),
                            controller: _controllerWeight,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Weight';
                              }
                              return null;
                            },
                          ),
                        ),
                        
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    if (flag)
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: raisedButtonStyle,
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    user.name = _controllerFirstName.text;
                                    user.email = _controllerEmail.text;
                                    user.protein = _controllerProteinLevel.text;
                                    user.weight = _controllerWeight.text;
                                    user.height = _controllerHeight.text;
                                    UserRecord.data = user;

                                    setState(() {
                                      const snackBar = SnackBar(
                                          content: Text(
                                        'Profile Updated',
                                        style: TextStyle(color: Colors.white),
                                      ));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      flag = false;
                                    });
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Update',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (!flag)
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: raisedButtonStyle,
                                onPressed: () async {
                                  setState(() {
                                    flag = true;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Edit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
