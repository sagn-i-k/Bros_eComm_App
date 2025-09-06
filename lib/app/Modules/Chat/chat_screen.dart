import 'package:bro_app/app/Services/auth_services.dart';
import 'package:bro_app/app/Services/chat_services.dart';
import 'package:bro_app/app/components/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String receiverMail;
  final String receiverUserID;
  final String receiverName;
  const ChatScreen({super.key, required this.receiverMail, required this.receiverUserID, required this.receiverName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final messageController=TextEditingController();
  final chatService=ChatService();
  final authService=AuthService();

  void sendMessage()async{
  if(messageController.text.isNotEmpty) {
     await chatService.sendMessage(widget.receiverUserID, messageController.text);
   }
   messageController.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverName.toString()),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 15,),
            Expanded(child: buildMessageList()),
            Container(
              margin: EdgeInsets.only(bottom: 20),
                child: buildUserInput())
          ],
        ),
      ),

    );
  }

  Widget buildMessageList(){
    String senderID=authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: chatService.getMessages(senderID, widget.receiverUserID),
        builder: (context,snapshot){
          //Errors
          if(snapshot.hasError){
            return const Text("Error");
          }

          //Loading
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((doc)=>buildMessageItem(doc)).toList()
          );

        });

  }

  Widget buildMessageItem(DocumentSnapshot doc){
    Map<String,dynamic> data=doc.data() as Map<String,dynamic>;

    //Is Current User
    bool isCurrentUser=data['senderID']==authService.getCurrentUser()!.uid;
    //Aligning the messages to the right if he is the user else on the left
    var alignment=isCurrentUser ? Alignment.centerRight:Alignment.centerLeft;

    print(["hhhhh",isCurrentUser]);

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment: isCurrentUser?CrossAxisAlignment.end:CrossAxisAlignment.start,
          children: [
            ChatBubble(message: data['message'], isCurrentUser: isCurrentUser)
          ],
        ));
  }

  Widget buildUserInput(){
    return Row(
      children: [
        Expanded(child: TextField(
          controller: messageController,
          decoration: InputDecoration(
            hintText: "Type a message"
          ),
        )),
        IconButton(onPressed: sendMessage, icon:Icon(Icons.send))
      ],
    );
  }

}
