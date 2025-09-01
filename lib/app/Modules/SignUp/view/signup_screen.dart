import 'package:bro_app/app/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../../utils/route_manager.dart';
import '../../BottomNavBar/view/bottomNavBar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final formGlobalKey=GlobalKey<FormState>();
  final nameController=TextEditingController();
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

            Text("Sign Up ",style: GoogleFonts.audiowide(
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
                validator: (value)=>value!.isEmpty?"Name cannot be empty":null,
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Name",
                ),

              ),
            ),

            const SizedBox(
              height: 10,
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
                validator:
                    (value)=> value!.length<10
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
                  authService.createUserAccountWithUserAndPassword(
                      emailController.text.trim().toString(),
                      passwordController.text.trim().toString(),
                      nameController.text.trim().toString()).then((status){
                        if(status=="Signup Successful"){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                              backgroundColor:Colors.greenAccent,
                              content: Text("Congrats your account has been created")));
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
                child: Center(child: Text("Sign Up",style: GoogleFonts.audiowide(color: Colors.white.withOpacity(0.7),fontSize: 17,fontWeight: FontWeight.w600),)),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ?",
                    style: GoogleFonts.roboto(color: Colors.black45,fontSize: 17,fontWeight: FontWeight.w800),),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, "signin");
                  }, child: Text("Please Signin", style: GoogleFonts.roboto(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w800)))
                ],
              ),
            )

          ],
        )),
      ),
    );
  }
}
