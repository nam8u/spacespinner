import 'package:flutter/material.dart';
import 'package:spacespinner/models/user.dart';
import 'package:spacespinner/services/database.dart';
import 'package:spacespinner/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:spacespinner/shared/loading.dart';

class UserDataForm extends StatefulWidget {
  @override
  _UserDataFormState createState() => _UserDataFormState();
}

class _UserDataFormState extends State<UserDataForm> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {

    return Container
      (
            child: Form (
              child: Column(
                children: <Widget>[

                  SizedBox(height: 50.0),
                  Text('User Details.',style: TextStyle(color: Colors.teal,fontSize: 20.0),),

                  SizedBox(height: 65.0),
                  Text('Name :',style: TextStyle(color: Colors.pink,fontSize: 18.0),),

                  SizedBox(height: 20.0),
                  Text('Location : ',style: TextStyle(color: Colors.pink,fontSize: 18.0),),

                  SizedBox(height: 20.0),
                  Text('Job : ',style: TextStyle(color: Colors.pink,fontSize: 18.0),),

                  SizedBox(height: 20.0),

                ],
      )
    )
    );
  }
}

