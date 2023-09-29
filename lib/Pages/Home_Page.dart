import 'package:chat_smth/Services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Messages"),
      actions: [
        IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
      ],
      backgroundColor: Colors.black54,),

      body: _buildUserList(),
    );

  }
  Widget _buildUserList()
  {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context,snapshot) {
          if(snapshot.hasError){return const Text("Error");}
          if(snapshot.connectionState == ConnectionState.waiting){return const Text("Loading");}
          return ListView(
            children: snapshot.data!.docs.map<Widget>((doc) => _buildUserListItem(doc)).toList()
          );
        });
  }
  Widget _buildUserListItem(DocumentSnapshot document)
  {
    Map<String, dynamic> data = document.data()! as Map<String,dynamic>;
    if(_auth.currentUser!.email != data['email'])
    {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(receiverUserID: data['uid'],UserEmail: data['email'],)),);},
          child: Container(
            
            padding: EdgeInsets.all(20),


            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],

            ),


            child: Row(
              children: [
                Icon(Icons.person,color: Colors.grey,),
                const SizedBox(width: 10,),

                Text(data['email']),
                const SizedBox(height: 10,)
              ],
            ),

          ),
        ),
      );
    }
    else{return Container();}
  }
}
