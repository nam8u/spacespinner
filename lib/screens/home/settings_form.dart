import 'package:flutter/material.dart';
import 'package:spacespinner/shared/constants.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
        Text('Update Info.'),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Name'),
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0),
          DropdownButtonFormField(
            value: _currentLocation ?? 'Kollam',
            decoration: textInputDecoration,
            items: locations.map((location){
              return DropdownMenuItem(
              value: location,
              child: Text('$location '),
              );
          }).toList(),
            onChanged: (val) => setState(() => _currentLocation =val),
          ),
          SizedBox(height: 20.0),
          TextFormField(
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

            },
          )

        ],
      ),
    );
  }
}

