import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacespinner/models/ss.dart';
import 'package:spacespinner/screens/home/ss_title.dart';
import 'package:spacespinner/services/auth.dart';

class SSList extends StatefulWidget {
  @override
  _SSListState createState() => _SSListState();
}

class _SSListState extends State<SSList> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final ss = Provider.of<List<SS>>(context) ?? [];

    ss.forEach((ss) {
      print(ss.name);
      print(ss.job);
      print(ss.location);
    });

    if (_auth.verifyUser() != null) {
      return ListView.builder(
        itemCount: ss.length,
        itemBuilder: (context, index) {
          return SStitle(ss: ss[index]);
        },
      );
    }
  }
}
