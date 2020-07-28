import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacespinner/models/ss.dart';
import 'package:spacespinner/screens/home/userData.dart';

class SStitle extends StatelessWidget {


  final SS ss;
  SStitle({this.ss});

  @override
  Widget build(BuildContext context) {

    void showData(String name,String location,String job)
    {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
            child: UserDataForm(),
        );
      });
    }
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        child: ListTile(

          leading:  FlatButton.icon(
              onPressed: () => showData(ss.name,ss.location,ss.job),
              icon: Icon(Icons.account_circle,color: Colors.deepOrangeAccent,),
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
