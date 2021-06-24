import 'package:firebase_auth/firebase_auth.dart';

class AuthService
{
  //sign in aym
  final FirebaseAuth _auth=FirebaseAuth.instance; //getting authentication instance of firebase
  Future signIn() async
  {
    try
        {
          AuthResult result=await _auth.signInAnonymously(); //
          FirebaseUser user=result.user;
          return user;
        }catch(e) {
          print(e.toString());
          return null;
        }
  }



}