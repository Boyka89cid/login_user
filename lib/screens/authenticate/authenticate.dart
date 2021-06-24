import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 5),
            child: Text(
              'User Name',
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.green[600],
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: AutofillHints.username,
                      hintText: "Enter Your Username Here"
                  )
              )
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Password',
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.green[600],
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: AutofillHints.password,
                      hintText: "Enter Your Password Here"
                  )
              )
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: RaisedButton.icon(
              onPressed: (){},
              icon: Icon(Icons.lock),
              label: Text(
                'Login',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              color: Colors.green[300],
            ),
          )
        ],
      ),
    );
  }
}

