import 'package:flutter/material.dart';
import 'package:spacespinner/screens/authenticate/register.dart';
import 'package:spacespinner/screens/authenticate/signin.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSign = true;
  void toggleView() {
    setState(() {
      showSign = !showSign;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showSign == true)
      {
        return SignIn(toggleView: toggleView);

      }
    else
    {
      return Register(toggleView: toggleView);
    }

  }
}
