import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ChatBubble extends StatelessWidget {
  final String message;
  final String senderId;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

   ChatBubble({super.key, required this.message, required this.senderId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
            color:(this.senderId == _firebaseAuth.currentUser!.uid) ? Colors.green : Colors.blue, ),

      child : Text(
        message,
        style: TextStyle(fontSize: 16,color: Colors.white),
      )
    );
  }
}
