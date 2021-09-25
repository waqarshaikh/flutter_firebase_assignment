import 'package:flutter/material.dart';
import 'package:flutter_firebase_assignment/screens/authenticate/sign_in.dart';
import 'package:flutter_firebase_assignment/screens/authenticate/sign_up.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Authentication"),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
            child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()
                        )
                    );
                  },
                  child: Text("Sign-in")),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()
                        )
                    );
              },
              child: Text("Sign-up")),
            ],
          ),
        )));
  }
}
