

import 'package:chat_train02/components/my_button.dart';
import 'package:chat_train02/components/my_text_field.dart';
import 'package:chat_train02/components/squre_tile.dart';
import 'package:chat_train02/service/auth_services/auth_service.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  final void Function()? onTap;
  const SignUpPage({super.key,required this.onTap});

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {

  // t e x t controller
  final TextEditingController email =TextEditingController();
  final TextEditingController password =TextEditingController();
  final TextEditingController confirmPassword =TextEditingController();
  
  // s i g n up mehtod
  void signUpMethod(){
    // initialize instance
    final _auth =AuthService();
    if (password.text == confirmPassword.text) {
      
    try {
        _auth.signUpWithEmailAndPassword(
        email.text, 
        password.text
        );
       
    }  catch (e) {
      showDialog(
        context: context, 
        builder:(context) => AlertDialog(
          title: Text(e.toString()),
        ),
        );
    }
    }else{
        showDialog(
        context: context, 
        builder:(context) => AlertDialog(
          title: Text('Password don\'t match!!!'),
        ),
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                
                children: [
              const SizedBox(height: 20,),
                  //Logo
                const Icon(Icons.people_alt_rounded,size: 100,color: Colors.black54,),
              const SizedBox(height: 20,),
                  //welcome message
                 const Text('Don\'t have an account? Sign Up now'),
              const SizedBox(height: 50,),
              
                  //Email  text field
                   MyTextField(
                  controller: email, 
                  hintText: 'Email', 
                  obscureTExt: false,),
              const SizedBox(height: 10,),
                  //p a s s w o r d text field
                   MyTextField(
                    controller: password,
                    obscureTExt: true,
                    hintText: "password",
                  ),
              const SizedBox(height: 10,),
                  //C o n f i r m password text field
                   MyTextField(
                    controller: confirmPassword,
                    obscureTExt: true,
                    hintText: "comfirm password",
                  ),
              const SizedBox(height: 20,),
                  // s i g n_up button
                   MyButton(
                    onTap: signUpMethod,
                    buttonName: 'Sign Up',),
              const SizedBox(height: 20,),
                  //devider
                  const Row(
                    children: [
                      Expanded(child: Divider(thickness: .5,)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text('Or continue with'),
                      ),
                      Expanded(child: Divider(thickness: .5,)),
                    ],
                  ),
              const SizedBox(height: 20,),
                  //sign in with g o o g l e & a p p l e
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       SqureTile(
                        imagePath: 'lib/images/google.png',
                       ),
              SizedBox(width: 5,),
                       SqureTile(
                         imagePath: 'lib/images/apple2.png',
                       ), 
                      ],
                    ) ,
              const SizedBox(height: 20,),
                  // dont have an accoun > registre n o w
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(' Have an account? '),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text('Sing In',style: TextStyle(color: Colors.blue),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}