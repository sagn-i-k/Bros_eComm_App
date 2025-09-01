import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService{


  Stream <DocumentSnapshot> retreiveUserData(){

    if(FirebaseAuth.instance.currentUser==null){
      return Stream.empty();
    }

    return FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }
}