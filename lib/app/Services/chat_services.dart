import 'package:bro_app/app/Models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  //Get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Get users stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // Get the document data and include the document ID
        final user = doc.data();
        user['uid'] = doc.id; // Optionally include the document ID
        return user;
      }).toList();
    });
  }

  //Send message
  Future<void> sendMessage(String receiverID,String message) async{

    //get current user info
    final String currentUserId=_auth.currentUser!.uid;
    final String currentUserEmail=_auth.currentUser!.email!;
    final Timestamp timestamp=Timestamp.now();

    //create a new message
    Message newMessage=Message(
        senderID: currentUserId,
        senderEmail: currentUserEmail,
        receiverID: receiverID,
        message: message,
        timestamp: timestamp
    );

    //Construct a chatroom id for both users
    List<String> ids=[currentUserId,receiverID];
    ids.sort();//Ensures that it is unique and same for both users
    String chatRoomID=ids.join('_');

    //Add the new message to the database
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID).collection("messages")
        .add(newMessage.toMap());
  }

  //Get Message
Stream<QuerySnapshot> getMessages(String userID,String otherUserID){
    
    List<String> ids=[userID,otherUserID];
    ids.sort();
    String chatRoomID=ids.join('_');
    
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages").orderBy("timestamp",descending: false)
        .snapshots();



}



}


//List of Maps Structure:
/*[
  {
  "email":sag@gmail.com,
  "id":""
  },
  {
  "email":sag@gmail.com,
  "id":""
  },
  ] */