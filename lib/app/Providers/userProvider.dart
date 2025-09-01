import 'dart:async';
import 'package:bro_app/app/Services/user_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/user_model.dart';

class UserProvider extends ChangeNotifier{

  UserService userServices=UserService();
  String nameOfUser="";
  String emailOfUser="";
  String addressOfUser="";
  String phoneNumberOfUser="";

  StreamSubscription<DocumentSnapshot>? userStreamSubscription;

  UserProvider(){
    getUserData();
  }

  getUserData(){
    userStreamSubscription!.cancel();
    
    userStreamSubscription=userServices.retreiveUserData().listen((dataSnapshot){

     final UserModel userData=UserModel.fromJSON(dataSnapshot as Map<String,dynamic>);
     nameOfUser=userData.name;
     emailOfUser=userData.email;
     phoneNumberOfUser=userData.phone;
     addressOfUser=userData.address;

     notifyListeners();
    });
  }

  @override
  void dispose() {
    userStreamSubscription!.cancel();
    // TODO: implement dispose
    super.dispose();
  }



}