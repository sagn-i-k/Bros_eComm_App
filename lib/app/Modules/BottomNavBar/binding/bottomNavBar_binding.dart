import 'package:get/get.dart';
import '../controller/bottomNavBar_controller.dart';


class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBarController>(() => BottomNavBarController());
  }
}