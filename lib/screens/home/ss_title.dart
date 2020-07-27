import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacespinner/models/ss.dart';

class SStitle extends StatelessWidget {
  final SS ss;
  SStitle({this.ss});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
        child: ListTile(
          leading:  FlatButton.icon(
              onPressed: () {
              },
              icon: Icon(Icons.person),
              label: Text(
                ss.name,
                style: TextStyle(color: Colors.white),
              )),
          title: Text(ss.name),
          subtitle: Text(ss.job),
        ),
      ),
    );
  }
}
