import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child : SpinKitChasingDots(
        color: Colors.teal,
        size: 50.0,
      )
    );
  }
}
