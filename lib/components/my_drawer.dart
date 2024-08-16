
import 'package:chat_train02/pages/home_page.dart';
import 'package:chat_train02/pages/settings.dart';
import 'package:chat_train02/service/auth_services/auth_service.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
   MyDrawer({super.key});

  //instance of auth service
  final AuthService auth =AuthService();

  void exit(){
    auth.signOutMethod();
  }

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Column(
              children: [
                      const DrawerHeader(child: Icon(Icons.functions)),

      //drawers
       ListTile(
        leading: const Icon(Icons.home),
        title: const Text('H O M E'),
        onTap:  () => Navigator.push(context, 
        MaterialPageRoute(builder:(context) => HomePage(),)),
        
      ),
          ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('S E T T I N G'),
        onTap: () => Navigator.push(context, 
        MaterialPageRoute(builder:(context) => SettingsPage(),)),
      ),
              ],
            ),

          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Column(
              children: [
                ListTile(
                        leading: const Icon(Icons.exit_to_app),
                        title: const Text('E X I T'),
                        onTap: exit,
                      ),
              ],
            ),
          ),
    ]));
  }
}
