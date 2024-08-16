import 'package:flutter/material.dart';

class ChatBullbe extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBullbe({super.key,required this.message,required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
       color: isCurrentUser? Colors.green:Colors.grey[500], 
      ),
      padding: EdgeInsets.all(20),
      
      child: Text(message),
    );
  }
}