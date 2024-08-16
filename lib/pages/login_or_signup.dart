import 'package:chat_train02/pages/sign%20in_page.dart';
import 'package:chat_train02/pages/sign%20up_page.dart';
import 'package:flutter/material.dart';

class LoginOrSignupPage extends StatefulWidget {
  const LoginOrSignupPage({super.key});

  @override
  State<LoginOrSignupPage> createState() => _LoginOrSignupPageState();
}

class _LoginOrSignupPageState extends State<LoginOrSignupPage> {

  //default page
  bool signInpage =true;
  //toggle page
  void togglePage(){
    setState(() {
      signInpage =!signInpage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (signInpage) {
      return SignInPage(
        onTap: togglePage,
      );
      
    }else
    return SignUpPage(
      onTap: togglePage,
    );
  }
}