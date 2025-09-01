import 'package:bro_app/app/modules/BottomNavBar/view/bottomNavBar.dart';
import 'package:bro_app/app/services/auth_services.dart';
import 'package:bro_app/app/utils/route_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../SignUp/view/signup_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final formGlobalKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  AuthService authService=AuthService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.7),
      body: SingleChildScrollView(
        child: Form(
          key: formGlobalKey,
            child: Column(
              children: [

                const SizedBox(
                  height: 80,
                ),

                Text("Sign In ",style: GoogleFonts.audiowide(
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                    color: Colors.black
                ),),

                const SizedBox(
                  height: 60,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(

                    validator: (value)=>value!.isEmpty?"Email cannot be empty":null,
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45),
                        ),
                        hintText: "Email"
                    ),

                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    validator: (value)=>
                    value!.length<10
                        ?"Password must contain atleast 10 characters"
                        :null,
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45),
                        ),
                        hintText: "Password"
                    ),
                    obscureText: true,
                  ),
                ),

                const SizedBox(
                  height: 60,
                ),

                GestureDetector(
                  onTap: (){
                    if(formGlobalKey.currentState!.validate()){

                      authService.loginWithEmailAndPassword(
                          emailController.text.trim().toString(),
                          passwordController.text.trim().toString()
                      ).then((status){
                        if(status=="Login Successful"){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                              backgroundColor:Colors.greenAccent,
                              content: Text("Congrats you have successfully logged in")
                              )
                          );
                          //Navigating to the
                          Get.offNamed(RoutesManager.bottomNavBar);
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  backgroundColor:Colors.red,
                                  content: Text(status))
                          );
                        }

                      });
                    }


                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.5),

                    ),
                    child: Center(child: Text("Sign In",style: GoogleFonts.audiowide(color: Colors.white.withOpacity(0.7),fontSize: 17,fontWeight: FontWeight.w600),)),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an account ?",
                        style: GoogleFonts.roboto(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w800),),
                      GestureDetector(
                        onTap: (){
                          Get.off(SignupScreen());
                        },
                          child: Text("Please Signup", style: GoogleFonts.roboto(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w800)))
                    ],
                  ),
                )

              ],
            )),
      ),
    );
  }
}
