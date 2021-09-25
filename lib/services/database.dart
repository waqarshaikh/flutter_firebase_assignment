import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_assignment/models/custom_user.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Future setUserData({String? name, String? role}) async {
    return await userCollection.doc(uid).set({"name": name});
  }

  CustomUser userDataFromSnapshot(DocumentSnapshot snapshot) {
    return CustomUser(
      name: snapshot.get("name"),
      uid: uid,
    );
  }
}
