import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utils/color_manager.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryAppColor1,
      body: Center(
        child: Obx(() => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            controller.displayedText.value,
            key: ValueKey(controller.displayedText.value),
            style: GoogleFonts.audiowide(fontSize: 35, fontWeight: FontWeight.bold,color: ColorManager.primaryAppColor2),
          ),
        )),
      ),
    );
  }
}