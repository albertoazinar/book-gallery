import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Firestore_Service {

  static Future<DocumentSnapshot> getUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .get();
    return userSnapshot;
  }

  static Future<void> addUser(uid, fullName, birthdate, email) async {
    var userData = {
      "fullName": fullName,
      "birthdate": birthdate,
      "email": email
    };
    FirebaseFirestore.instance.collection('users').doc(uid).set(userData);
  }
}