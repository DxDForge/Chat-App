import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyTile({super.key,required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8,left: 15,right: 15),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
           
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              //icon
                Icon(Icons.person),
                SizedBox(width: 20,),
              //user name
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}