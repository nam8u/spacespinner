import 'package:flutter/material.dart';
import 'package:spacespinner/screens/authenticate/forgotpassword.dart';
import 'package:spacespinner/screens/authenticate/register.dart';
import 'package:spacespinner/services/auth.dart';
import 'package:spacespinner/shared/constants.dart';
import 'package:spacespinner/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {

    void _showForgotPanel()
    {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: ForgotForm(),
        );
      });
    }
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.teal[00],
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        elevation: 0.0,
        title: Text('Sign In'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person,color: Colors.white),
              label: Text(
                'Sign up',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val.isEmpty ? 'Enter Email' : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    }),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    }),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.red[400],
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result =
                          await _auth.signinWithEmail(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Invalid Credentials';
                          loading = false;
                        });
                      }
                    }
                  },
                ),
                SizedBox(height: 20.0),
                FlatButton.icon(
                    onPressed: () {
                    _showForgotPanel();
                    },
                    icon: Icon(Icons.error,color: Colors.red,size: 20.0,),
                    label: Text(
                      'Forgot Password ?',
                      style: TextStyle(color: Colors.pink),
                    )),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          )),
    );
  }
}
