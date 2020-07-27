import 'package:flutter/material.dart';
import 'package:spacespinner/services/auth.dart';
import 'package:spacespinner/shared/constants.dart';
import 'package:spacespinner/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String name='';
  String location ='';
  String job='';
  final List<String> locations = ['Kollam','Trivandrum','Bangalore','Coimbatore'];

  String error='';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.teal[00],
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        elevation: 0.0,
        title: Text('Sign up'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Container(
          //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
         // padding: EdgeInsets.only(
              //bottom: MediaQuery.of(context).viewInsets.bottom),

          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Name'),
                  validator: (val)=> val.isEmpty ? 'Enter Name' : null,
                    onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                }),
                SizedBox(height: 20.0),
                DropdownButtonFormField(
                  value: locations.first,
                  decoration: textInputDecoration,
                  items: locations.map((loc) {
                    return DropdownMenuItem(
                      value: loc,
                      child: Text('$loc'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => location = val),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Job'),
                    validator: (val)=> val.isEmpty ? 'Enter Job' : null,
                    onChanged: (val) {
                      setState(() {
                        job = val;
                      });
                    }),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val)=> val.isEmpty ? 'Enter Email' : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    }),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                    obscureText: true,
                    validator: (val)=> val.length < 6 ? 'Enter a password 6+ chars long' : null,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    }),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.red[400],
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                   if(_formKey.currentState.validate())
                     {
                       setState(() => loading = true);
                       dynamic result = await _auth.registerWithEmail(email, password, name,job,location);
                       if(result == null)
                         {
                           setState(() {
                             loading = false;
                             error = 'please check the form.';
                           });
                         }
                     }
                  },
                ),
                SizedBox(height: 20.0),
                Text(
                  error,
                  style: TextStyle(color:Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          )),
    );
  }
}
