import 'package:bro_app/app/Modules/Chat/chat_screen.dart';
import 'package:bro_app/app/Services/auth_services.dart';
import 'package:bro_app/app/Services/chat_services.dart';
import 'package:bro_app/app/components/my_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final chatService = ChatService();
  final authService = AuthService();



  Widget buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: chatService.getUserStream(),
      builder: (context, snapshot) {
        // Debug: Print snapshot state
        print('Snapshot connection state: ${snapshot.connectionState}');
        print('Snapshot has error: ${snapshot.hasError}');
        print('Snapshot has data: ${snapshot.hasData}');
        if (snapshot.hasData) {
          print('Number of users: ${snapshot.data!.length}');
          snapshot.data!.forEach((user) => print('User: $user'));
        }

        // Error
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        // Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Check if data is empty
        if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No users found'),
          );
        }

        // Return ListView of the User names
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return buildUserListItem(snapshot.data![index], context);
          },
        );
      },
    );
  }

  Widget buildUserListItem(Map<String, dynamic> userData, BuildContext context) {

    if(userData['email']!=authService.getCurrentUser()!.email){
    return GestureDetector(
      onTap: (){
        Get.to(ChatScreen(
          receiverMail: userData['email'],
          receiverUserID: userData['uid'],
          receiverName: userData['name'],
        )
        );
      },
      child: Container(
        color: Colors.greenAccent,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${userData['email'] ?? 'No email'}'),
            Text('Name: ${userData['name'] ?? 'No name'}'),
            if (userData['uid'] != null) Text('UID: ${userData['uid']}'),
          ],
        ),
      ),
    );
    }else{
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home - Users List")),
      drawer: MyDrawer(),
      body: buildUserList(),
    );
  }
}