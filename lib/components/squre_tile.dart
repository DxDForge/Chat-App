import 'package:flutter/material.dart';

class SqureTile extends StatelessWidget {
  final String imagePath;
  const SqureTile({super.key,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.grey[100],
      border:Border.all(color: Colors.white)
     ),
   
      height: 70,
      
      child: Image.asset(imagePath),

    );
  }
}