import 'package:chat_smth/Pages/Login_Page.dart';
import 'package:chat_smth/Pages/RegisterPage.dart';
import 'package:flutter/material.dart';
class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginScreen = true;
  void togglepage(){
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginScreen){
      return LoginPage(onTap: togglepage);
    }
    else
    {

      return RegisterPage(onTap: togglepage);
    }
  }
}
