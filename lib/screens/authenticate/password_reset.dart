import 'package:flutter/material.dart';
import 'package:flutter_firebase_assignment/services/auth.dart';

class PasswordReset extends StatefulWidget {
  PasswordReset({Key? key}) : super(key: key);

  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
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
        title: Text("Password Reset"),
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
                ElevatedButton(
                    child: Text("Submit"),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _authService.passwordReset(email);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Password reset email has been sent!",
                              style: TextStyle(
                                fontSize: 18.0
                              )
                            ),
                            backgroundColor: Colors.blue,

                          )
                        );
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
