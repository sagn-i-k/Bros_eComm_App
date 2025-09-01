import 'package:bro_app/app/utils/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'app/demo.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: RoutesManager.splash,
      initialRoute: RoutesManager.splash,
      getPages: RoutesManager.getPages,  // Change this to getPages:
      // Remove the routes: parameter completely
    );
  }
}


