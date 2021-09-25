import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_assignment/screens/authenticate/authenticate.dart';
import 'package:flutter_firebase_assignment/services/auth.dart';
import 'package:flutter_firebase_assignment/services/database.dart';

class Home extends StatefulWidget {
  final String? name;
  const Home({Key? key, this.name}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("Username:  -------- ${ _auth.currentUser!.displayName}");
    dynamic displayName = user!.displayName == null ? widget.name : user!.displayName;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home")),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.only(top: 200.0),
          child: Center(
            child: Column(
              children: [
                Text("${displayName}",
                  style: TextStyle(fontSize: 50.0)
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _auth.signOut();
                    Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Authenticate()),
                            (Route<dynamic> route) => false,
                          );
                  },
                  child: Text("Log out"),
                ),
              ],
            ),
          )),
    );
  }
}
