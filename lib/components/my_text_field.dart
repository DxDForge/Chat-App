import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureTExt;
  final FocusNode? focusNode;
  const MyTextField({super.key,required this.controller,
  required this.hintText,
  required this.obscureTExt,
   this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextField(
    controller: controller,
    obscureText: obscureTExt,
    focusNode: focusNode,
      decoration: InputDecoration(
        
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
          fillColor: Colors.grey[200],
          filled: true,
          enabledBorder: OutlineInputBorder(            
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white))),
    );
  }
}
