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
        child: ListTile(
          leading:  FlatButton.icon(
              onPressed: () {
              },
              icon: Icon(Icons.person,color: Colors.deepOrangeAccent,),
              label: Text(
                '',
                style: TextStyle(color: Colors.white),
              )),
          title: Text(ss.name),
          subtitle: Text(ss.job),
        ),
      ),
    );
  }
}
