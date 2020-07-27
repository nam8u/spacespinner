import 'package:flutter/material.dart';
import 'package:spacespinner/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:spacespinner/models/user.dart';
import 'package:flutter/services.dart';


import 'package:spacespinner/services/auth.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
       home: Wrapper(),
      ),
    );
  }
}
