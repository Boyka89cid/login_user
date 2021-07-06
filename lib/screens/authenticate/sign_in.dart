import 'package:flutter/material.dart';
import 'package:login_user/screens/services/auth.dart';

class SignIn extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return SignInState();
  }
}
class SignInState extends State<SignIn>
{

  final username=TextEditingController();
  final password=TextEditingController();
  AuthService authService=AuthService();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Page'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
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
                controller: username,
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
                controller: password,
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
              onPressed: () async {
                print(username.text);
                print(password.text);
                dynamic result=await authService.signIn(username.text.toString().trim(),password.text.toString().trim());
                  if(result==null)
                    print('no');
                  else
                    print(result);
              },
              icon: Icon(Icons.lock),
              label: Text(
                'Login',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              color: Colors.green[300],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: RaisedButton.icon(
              onPressed: () async {
                authService.createUSer();
              },
              icon: Icon(Icons.lock),
              label: Text(
                'Create',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              color: Colors.green[300],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: RaisedButton.icon(
              onPressed: () async {
                authService.signInWithGoogle();
              },
              icon: Icon(Icons.account_circle_outlined),
              label: Text(
                'Google Sign In',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              color: Colors.green[300],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: RaisedButton.icon(
              onPressed: () async {
                authService.signOutGoogle();
              },
              icon: Icon(Icons.lock),
              label: Text(
                'sign out',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              color: Colors.green[300],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: RaisedButton.icon(
              onPressed: () async {
                authService.signInWithFacebook();
              },
              icon: Icon(Icons.lock),
              label: Text(
                'SIGN IN FACEBOOK',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              color: Colors.green[300],
            ),
          ),
        ],
      ),
    );
  }

}