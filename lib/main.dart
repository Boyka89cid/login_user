import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_user/screens/wrapper.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Wrapper()
    );
  }

}

