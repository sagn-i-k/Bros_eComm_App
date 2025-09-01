//import 'dart:ui';
import 'color_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class StyleManager {

  static final TextStyle headingText = GoogleFonts.audiowide(
      fontWeight: FontWeight.w800,
      color: ColorManager.secondaryAppColor2,
      fontSize: 28
  );

  static final TextStyle profileScreenText = GoogleFonts.montserrat(
      fontWeight: FontWeight.w800,
      color: ColorManager.whiteColor,
      fontSize: 16
  );

  static final TextStyle profileScreenSubText = GoogleFonts.montserrat(
      fontWeight: FontWeight.w400,
      color: ColorManager.primaryAppColor3,
      fontSize: 14.5
  );


}