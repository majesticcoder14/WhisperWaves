import 'package:chat_smth/Model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier
{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> sendMessage(String receiverid, String message) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
    Message newMessage = Message(senderId: currentUserId, receiverId: receiverid, timestamp: timestamp, message: message, senderEmail: currentUserEmail);
    List<String> ids = [currentUserId,receiverid];
    ids.sort();
    String chatRoomID = ids.join("_");
    await _firestore.collection("ChatRooms").doc(chatRoomID).collection("messages").add(newMessage.toMap());
  }
  Stream<QuerySnapshot> getMessage(String userId, String otherUserid){
    List<String> ids = [userId,otherUserid];
    ids.sort();
    String chatroomId = ids.join("_");
    return _firestore.collection("ChatRooms").doc(chatroomId).collection("messages").orderBy('timestamp', descending: false).snapshots();
  }

}