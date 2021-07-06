import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//import 'package:login_user/screens/authenticate/sign_in.dart';

class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance; //getting authentication instance of firebase
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['email', 'https://www.googleapis.com/auth/contracts.readonly']);
  //testing
  Future<User?> signInWithGoogle() async
  {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null)
    {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(accessToken: googleSignInAuthentication.accessToken, idToken: googleSignInAuthentication.idToken,);
      try
      {
        final UserCredential userCredential = await auth.signInWithCredential(credential);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
  }

  void signOutGoogle() async
  {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    print("User Sign Out");
  }
  //sign in aym
  Future signIn(String username, String password) async
  {
    try
    {
      await _auth.signInWithEmailAndPassword(email: username, password: password); // //awaits for future of signInAnonymously to finish.
      User? user = FirebaseAuth.instance.currentUser; // assigning current user value to the user object of Class User.
      print(user?.uid.toString());
      return user;
    } on FirebaseAuthException
    catch (e)
    {
    print(e.toString());
    return e.message;
    }
  }

  Future createUSer() async
  {
    try {
      await _auth.createUserWithEmailAndPassword(email: 'kushaldevgun@gmail.com', password: '12345678'); // //awaits for future of signInAnonymously to finish.
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> googleSignIn() async
  {
    try {
      //final GoogleSignIn _googleSignIn=GoogleSignIn(scopes:['email', 'https://www.googleapis.com/auth/contacts.readonly']);
      await _googleSignIn.signIn();
    } catch (e) {
      print(e);
    }
  }

  Future<UserCredential?> signInWithFaceBooks() async
  {
    try
        {
          final AccessToken accessToken=(await FacebookAuth.instance.login()) as AccessToken; // trigger the sign-in flow
          final facebookAuthCredential=FacebookAuthProvider.credential(accessToken.token); // Create a credential from the access token
          await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential); //// Once signed in, return the UserCredential
          //print();
        }catch(e) {
          print(e);
        }
  }

  Future<Resource?> signInWithFacebook() async
  {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential = FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential = await FirebaseAuth.instance.signInWithCredential(facebookCredential);
          return Resource(status: Status.Success);
        case LoginStatus.cancelled:
          return Resource(status: Status.Cancelled);
        case LoginStatus.failed:
          return Resource(status: Status.Error);
        default:
          return null;
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

}

class Resource
{
  final Status status;
  Resource({required this.status});
}
enum Status {
  Success,
  Error,
  Cancelled
}
/*void _signinfb()async
{
  FacebookLogin facebookLogin = FacebookLogin();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final result = await facebookLogin.logIn(['email']);
  final token = result.accessToken.token;
  final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
  print(graphResponse.body);
  Map valueMap = json.decode(graphResponse.body);
  Facebookresponse loginResponse = Facebookresponse.fromJson(valueMap);
  if(result.status==FacebookLoginStatus.loggedIn){
    final credentials = FacebookAuthProvider.credential(token);
    _firebaseAuth.signInWithCredential(credentials);
  }*/

