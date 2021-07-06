import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_user/screens/authenticate/sign_in.dart';

class Authenticate extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: SignIn(),
    );
  }
}

