import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 

class AuthService{
  //intasne of firebase
  final FirebaseAuth auth =FirebaseAuth.instance;
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;

  //get current user
  User? getCurrentUser(){
    return auth.currentUser;
  }

  //Sign in Method
  Future<UserCredential> signInWithEmailAndPassword(String email,password)async{
    try {
      //sign in user
      UserCredential userCredential= await auth.signInWithEmailAndPassword(
        email: email, 
        password: password);

       //save user info if it doesn't exist
      _firestore.collection('Users').doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        }
      );
        return userCredential;
    }on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign U p Mehtod
  Future<UserCredential>signUpWithEmailAndPassword(String email,password)async{
   try {
    //create user
      UserCredential userCredential =await auth.createUserWithEmailAndPassword(
      email: email, 
      password: password);

      //save user info in a separate doc
      _firestore.collection('Users').doc(userCredential.user!.uid).set(
        {
          'uid':userCredential.user!.uid,
          'email':email,
        }
      );
      return userCredential;

   }on FirebaseAuthException catch  (e) {
     throw Exception(e.code);
   }
  }

  // sign  o u t method
  Future<void> signOutMethod()async{
    return await auth.signOut();
  }

  //error


}