import 'package:flutter/material.dart';
import 'package:spacespinner/models/user.dart';
import 'package:spacespinner/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:spacespinner/shared/loading.dart';
import 'package:spacespinner/services/auth.dart';

class ForgotForm extends StatefulWidget {
  @override
  _ForgotFormState createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool forgotConfirm = false;
  String email ='';
  String error='';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return loading ? Loading() : Container
      (
            child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 50.0),
                Text(
                  'Forgot Password ?',
                  style: TextStyle(color: Colors.pink,fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val.isEmpty ? 'Enter Email' : null,
                  onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                  },
                    ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.red[400],
                  child: Text(
                    'Send Link',
                    style: TextStyle(color: Colors.white,fontSize: 15.0),
                  ),
                  onPressed: () async {
                    forgotConfirm = await _auth.forgotEmailPassword(email);
                    if (forgotConfirm)
                      {
                        setState(() {
                          error = 'Mail Sent Successfully.';
                          loading = false;
                        });
                      }
                    else
                      {
                        setState(() {
                          error = 'Please check your mail or try again later.';
                          loading = false;
                        });

                      }
                  },
                ),
                SizedBox(height: 20.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          ));
  }
}
