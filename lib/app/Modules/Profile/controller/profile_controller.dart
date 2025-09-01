import 'dart:async';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../Models/user_model.dart';
import '../../../Services/user_services.dart';


class ProfileController extends GetxController {

  final UserService userServices = UserService();

  // Observable variables
  var nameOfUser = "".obs;
  var emailOfUser = "".obs;
  var addressOfUser = "".obs;
  var phoneNumberOfUser = "".obs;

  StreamSubscription<DocumentSnapshot>? userStreamSubscription;

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  void getUserData() {
    // Cancel existing subscription if any
    userStreamSubscription?.cancel();

    userStreamSubscription = userServices.retreiveUserData().listen((dataSnapshot) {
      if (dataSnapshot.exists) {
        final UserModel userData = UserModel.fromJSON(dataSnapshot.data() as Map<String, dynamic>);
        nameOfUser.value = userData.name;
        emailOfUser.value = userData.email;
        phoneNumberOfUser.value = userData.phone;
        addressOfUser.value = userData.address;
      }
    });
  }

  void signOutUser(){
    userStreamSubscription?.cancel();

    nameOfUser = "".obs;
    emailOfUser = "".obs;
    addressOfUser = "".obs;
    phoneNumberOfUser = "".obs;
  }

  @override
  void onClose() {
    signOutUser();
    super.onClose();
  }
}