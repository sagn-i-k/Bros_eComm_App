import 'dart:async';
import 'package:bro_app/app/Utils/route_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SplashController extends GetxController {
  var displayedText = "BROSS".obs;
  final String word = "APP";
  int index = 0;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startLetterAnimation();
    WidgetsBinding.instance.addPostFrameCallback((c){
      navigateAfterDelay();
    });

  }

  void startLetterAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (index < word.length) {
        displayedText.value += word[index];
        index++;
      } else {
        _timer?.cancel();
      }
    });
  }


  void navigateAfterDelay() async {

    await Future.delayed(const Duration(milliseconds: 1200));

    if (FirebaseAuth.instance.currentUser==null) {
      Get.offAllNamed(RoutesManager.signIn);

    } else {
      Get.offAllNamed(RoutesManager.bottomNavBar);

    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}