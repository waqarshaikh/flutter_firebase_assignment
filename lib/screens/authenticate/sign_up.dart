import 'package:flutter/material.dart';
import 'package:flutter_firebase_assignment/screens/home/home.dart';
import 'package:flutter_firebase_assignment/services/auth.dart';
import 'package:flutter_firebase_assignment/services/database.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  String email = "";
  String name = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('Sign Up'),
        ),
        body: Center(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Name",
                  ),
                  validator: (value) => value!.isEmpty ? "Name is empty" : null,
                  onChanged: (value) {
                    setState(() => name = value);
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Email is empty" : null,
                  onChanged: (value) {
                    setState(() => email = value);
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                  validator: (value) => value!.length < 6
                      ? "Password should be at least 8 characters long"
                      : null,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() => password = value);
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                  backgroundColor: Colors.indigo
                ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = await _authService
                            .signUpWithEmailAndPassword(email, password, name);
                        await DatabaseService(
                                        uid: _authService.customUser?.uid)
                                    .setUserData(name: name);
                        if(result == null){
                          setState(() => error = "Please enter a valid email or password");
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Home(name: name)),
                            (Route<dynamic> route) => false,
                          );
                        }
                      }
                    },
                    child: const Text("Sign up")
            ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15.00,
                      ),
                    ),
              ],
            ),
          ),
        )));
  }
}
