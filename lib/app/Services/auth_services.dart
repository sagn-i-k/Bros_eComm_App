import 'package:bro_app/app/Modules/Profile/controller/profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AuthService{

  User? getCurrentUser(){
    return FirebaseAuth.instance.currentUser;
  }

  final ProfileController profileController=Get.put(ProfileController());

  createUserAccountWithUserAndPassword(String userEmail,String userPassword,String name)async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEmail, password: userPassword);

      await storeUserData(userEmail: userEmail, name: name);

      return "Signup Successful";
    }on FirebaseAuthException catch (exp){
      return exp.message.toString();
    }
  }

  storeUserData({required String userEmail,required String name}) async{
    try{
      Map<String,dynamic> userData={
        "name":name,
        "email":userEmail
      };
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(userData);

    }
    catch(exp){
      print("Failed to save User Data");
    }

}

  loginWithEmailAndPassword(String email,String password) async{
    try{

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email,
          password: password
      );

      profileController.getUserData();

      return "Login Successful";

    }on FirebaseAuthException catch(exp){
      return exp.message.toString();
    }
  }


}