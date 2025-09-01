import 'package:bro_app/app/Providers/userProvider.dart';
import 'package:bro_app/app/Utils/style_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utils/color_manager.dart';
import '../../../Utils/route_manager.dart';
import '../../../modules/Signin/view/signin_screen.dart';
import '../controller/profile_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget buildItem({required IconData icon,required String title,required VoidCallback onTap,required Color? iconColor}){
    return ListTile(
     leading: Icon(icon,color: iconColor,),
      trailing: Icon(Icons.chevron_right,),
      title: Text(title),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController userController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
          title: Text("Profile",style: StyleManager.headingText,),
        centerTitle: true,
      ),
      body: Obx(() => SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person,color: Colors.greenAccent,size: 30,),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userController.nameOfUser.value,style: StyleManager.profileScreenText,),
                            Row(
                              children: [
                                Text(userController.emailOfUser.value,style: StyleManager.profileScreenSubText,),
                                // SizedBox(width: 10),
                                // Text(userController.phoneNumberOfUser.value),
                              ],
                            ),
                          ],
                        ),



                      ],
                    ),
                    Icon(Icons.edit,color: Colors.white,size: 28,)
                  ],
                )
            ),


            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  buildItem(
                    icon: Icons.logout,
                    title: "Log Out",
                    iconColor: ColorManager.primaryAppColor3,
                    onTap: () async{
                      userController.signOutUser();
                      await FirebaseAuth.instance.signOut();
                      Get.offNamed(RoutesManager.signIn);

                    },
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}





// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Profile")),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Consumer<UserProvider>(
//               builder: (context,user,child) =>Container(
//                 width: double.infinity,
//                   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
//                   decoration: BoxDecoration(
//                     borderRadius:BorderRadius.only(
//                       bottomLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Text(user.nameOfUser),
//                     ],
//                   ))
//
//             ,)
//           ],
//         ),
//       ),
//     );
//   }
// }
