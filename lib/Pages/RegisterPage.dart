import 'package:chat_smth/Services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/MyButton.dart';
import '../Components/MyTextField.dart';
class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  void signUp() async {
    if(passwordController.text != confirmpasswordController.text){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Passwords Dont Match :("))
      );return ;}
    final authservice = Provider.of<AuthService>(context,listen: false);
    try{
      await authservice.signUpWithEmailAndPassword(email.text, passwordController.text);
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
                const Icon(
                  Icons.message,
                  size: 100,
                ),
                const SizedBox(height:0),

                // welcome back
                const Text(
                  "Lets create an account for you!",
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
                const SizedBox(height:10),
                MyTextField(
                    controller: confirmpasswordController,
                    hinttext: "Confirm Password" ,
                    obscuretext: true),
                const SizedBox(height:25),



                // Button
                MyButton(onTap: signUp, text: "Sign Up"),

                const SizedBox(height:50),
                // Not a member?
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a member?"),
                    SizedBox(width:4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login Now",
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
