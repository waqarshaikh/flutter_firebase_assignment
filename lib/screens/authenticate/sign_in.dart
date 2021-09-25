import 'package:flutter/material.dart';
import 'package:flutter_firebase_assignment/screens/authenticate/password_reset.dart';
import 'package:flutter_firebase_assignment/screens/home/home.dart';
import 'package:flutter_firebase_assignment/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
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
                    hintText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() => email = value);
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  obscureText: true,
                  onChanged: (value) {
                    setState(() => password = value);
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  child: Text(
                    "Forgot password ?",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PasswordReset()));
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    child: Text("Sign in"),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _authService
                            .signInWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            loading = false;
                            error = "Please enter a valid Email or Password.";
                          });
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                            (Route<dynamic> route) => false,
                          );
                        }
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
