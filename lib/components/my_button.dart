import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onTap;
  const MyButton({super.key,required this.buttonName,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      padding:const EdgeInsets.symmetric(vertical: 25
      ),
       decoration:  BoxDecoration(
        borderRadius:BorderRadius.circular(12),
        color: Colors.black
       ),
        child:  Center(
          child:Text(buttonName,
          style: const TextStyle(color: Colors.white),)
        ),
      ),
    );
  }
}