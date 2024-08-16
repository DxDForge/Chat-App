import 'package:chat_train02/components/my_button.dart';
import 'package:chat_train02/components/my_text_field.dart';
import 'package:chat_train02/components/squre_tile.dart';
import 'package:chat_train02/service/auth_services/auth_service.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  final void Function()? onTap;
  const SignInPage({super.key, required this.onTap});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //s i g n Method
  void signInMethod()async{
    final _auth =AuthService();
    try {
      _auth.signInWithEmailAndPassword(
        emailController.text, 
        passwordController.text);

    } catch (e) {
      showDialog(context: context, 
      builder:(context) => AlertDialog(
          title: Text(e.toString()),
      ),);
    }

  }

  // bool isLoading = false; // Loading indicator

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  // // sign-in method
  // void signInMethod() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     // Handle error here, for example, show a snackbar
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(e.message ?? "An error occurred")),
  //     );
  //   } finally {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Logo
                  const Icon(Icons.login, size: 100, color: Colors.black54),
                  const SizedBox(height: 20),
                  // Welcome message
                  const Text('You have been missed. Log in now'),
                  const SizedBox(height: 50),
                  // Email text field
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureTExt: false,
                  ),
                  
                  const SizedBox(height: 10),
                  // Password text field
                  MyTextField(
                    controller: passwordController,
                    obscureTExt: true,
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 20),
                  // Sign in button
                  MyButton(
                    onTap: signInMethod,
                    buttonName: 'Sign In',
                  ),
                  const SizedBox(height: 20),
                  // Divider
                  const Row(
                    children: [
                      Expanded(child: Divider(thickness: 0.5)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text('Or continue with'),
                      ),
                      Expanded(child: Divider(thickness: 0.5)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Sign in with Google & Apple
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SqureTile(
                        imagePath: 'lib/images/google.png',
                      ),
                      SizedBox(width: 5),
                      SqureTile(
                        imagePath: 'lib/images/apple2.png',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Don't have an account? Sign up now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  // if (isLoading) // Show loading indicator when signing in
                  //   const CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
