import 'package:chat_smth/Components/MyButton.dart';
import 'package:chat_smth/Components/MyTextField.dart';
import 'package:chat_smth/Services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class LoginPage extends StatefulWidget {

  final void Function()? onTap;

  const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn() async
  {
    final authService = Provider.of<AuthService>(context, listen: false);
    try{
      await authService.signInWithEmailandPassword(email.text, passwordController.text);
    } catch(e){ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));}

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Icon(
                  Icons.message,
                  size: 100,
                ),
                const SizedBox(height:50),

                // welcome back
                Text(
                    "Welcome Back You/'ve been missed!",
                  style: TextStyle(
                    fontSize: 16
                  ),

                ),
                const SizedBox(height:50),



                // email
                MyTextField(
                  controller: email,
                    hinttext: "Email" ,
                    obscuretext: false),
                const SizedBox(height:10),

                // password
                MyTextField(
                    controller: passwordController,
                    hinttext: "Password" ,
                    obscuretext: true),
                const SizedBox(height:25),


                // Button
                MyButton(onTap: signIn, text: "Sign In"),

                const SizedBox(height:50),
                // Not a member?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?"),
                    const SizedBox(width:4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                          "Register Now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )

                  ],
                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}
