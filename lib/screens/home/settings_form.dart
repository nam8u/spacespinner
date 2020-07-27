import 'package:flutter/material.dart';
import 'package:spacespinner/models/user.dart';
import 'package:spacespinner/services/database.dart';
import 'package:spacespinner/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:spacespinner/shared/loading.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> locations = ['Kollam','Trivandrum','Bangalore','Coimbatore'];
  String _currentName;
  String _currentJob;
  String _currentLocation;
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return loading ? Loading() : StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder:(context,snapshot){
        if(snapshot.hasData) {
          UserData userData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text('Update Info.'),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData.name,
                  decoration: textInputDecoration.copyWith(hintText: 'Name'),
                  validator: (val) =>
                  val.isEmpty
                      ? 'Please enter a name'
                      : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField(
                  value: userData.location,
                  decoration: textInputDecoration,
                  items: locations.map((location) {
                    return DropdownMenuItem(
                      value: location ?? userData.location,
                      child: Text('$location '),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentLocation = val),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData.job,
                  decoration: textInputDecoration.copyWith(hintText: 'Job'),
                  validator: (val) => val.isEmpty ? 'Job' : null,
                  onChanged: (val) => setState(() => _currentJob = val),
                ),

                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate())
                      {setState(() => loading = true);
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentName ?? userData.name,
                            _currentJob ?? userData.job,
                            _currentLocation ?? userData.location,

                        );
                      setState(() => loading = false);
                      }

                  },
                )

              ],
            ),
          );
        } else {
          return Loading();
        }
    });
  }
}

