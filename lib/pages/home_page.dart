import 'package:chat_train02/components/My_tile.dart';
import 'package:chat_train02/components/my_drawer.dart';
import 'package:chat_train02/pages/chat_page.dart';
import 'package:chat_train02/service/auth_services/auth_service.dart';
import 'package:chat_train02/service/chat_services/chat%20service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  //a u t h & c h a t services
  final AuthService authService =AuthService();
  final ChatServices chatServices =ChatServices();

  //s i g n out method
  void signOutMethod(){
    //instance auth
    final _auth =AuthService();
      _auth.signOutMethod();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('HomePage'),
      foregroundColor: Colors.grey[500],),
      drawer: MyDrawer(),
      body: _buildUserList()
    );
  }


  //build a list of user except for the current logged in user

  Widget _buildUserList(){
    return StreamBuilder(
      stream: chatServices.getUserStream(), 
    builder:(context, snapshot) {
      //error
      if (snapshot.hasError) {
        return const Text('Error');
      }
          //loading
      if (snapshot.connectionState ==ConnectionState.waiting) {
          return const Text('Loading.....');
        }

        //return list view
        return ListView(
          children:snapshot.data!.map<Widget>
          ((userData) => _builduserListItem(userData,context)).toList(),
        );
    },);
  }


  //build individual list tile for user
  Widget _builduserListItem(
    Map<String, dynamic> userData,BuildContext context){

    //display all the user except current user
    if (userData['email'] != authService.getCurrentUser()!.email) {
      
       return MyTile(
      onTap: (){
        //tapped on a user -> go to chat page
        Navigator.push(context, MaterialPageRoute(
          builder:(context) =>ChatPage(
            receiverEmail: userData['email'], 
            receiverID: userData['uid'],),
            ),
            );
      }, 
      text: userData['email']
      
      );


    }else{
      return Container();
    }
   
  }

}