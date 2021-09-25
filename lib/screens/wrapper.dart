import 'package:flutter/material.dart';
import 'package:flutter_firebase_assignment/models/custom_user.dart';
import 'package:flutter_firebase_assignment/screens/authenticate/authenticate.dart';
import 'package:flutter_firebase_assignment/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);

    //return either Home or Authenticate Widget
    return user != null ? Home(name: user.name) : Authenticate();

  }
}
