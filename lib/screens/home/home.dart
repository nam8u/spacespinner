import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spacespinner/screens/home/settings_form.dart';
import 'package:spacespinner/services/auth.dart';
import 'package:spacespinner/services/database.dart';
import 'package:provider/provider.dart';
import 'ss_list.dart';
import 'package:spacespinner/models/ss.dart';


class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingPanel()
    {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }
    return StreamProvider<List<SS> >.value(
        value: DatabaseService().ss,
        child: Scaffold(
          backgroundColor: Colors.teal[00],
          appBar: AppBar(
            backgroundColor: Colors.teal[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
              FlatButton.icon(
                onPressed: () => _showSettingPanel(),
                icon: Icon(Icons.settings),
                label:Text(''),
              ),

            ],
            title: Text('Spacespinner'),
          ),
          body: SSList(

          ),
        ));
  }
}
