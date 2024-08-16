import 'package:chat_train02/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatServices{

  //get instance of firestor
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth =FirebaseAuth.instance;

  //get user stream
  Stream<List<Map<String,dynamic>>> getUserStream() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc){

        //go through each individual user
        final user =doc.data();

        //return user
        return user;
      }).toList();
    });
  }


  //send messages

  Future<void> sendMessage(String receiverID, message)async{
    //get current user info
    final String currentUserID = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email!;
    final Timestamp timestamp =Timestamp.now();

    //create a new message
   Message newMessage =Message(
    message: message, 
    receiverID: receiverID, 
    senderEmail: currentUserEmail, 
    senderID: currentUserID, 
    timestamp: timestamp
    );

    //construct chat room ID for the two users (sorted to ensure uniqueness)
    List<String> ids =[currentUserID, receiverID];
    ids.sort(); //sort the ids (this ensure the chatroomID is the same for any 2 people)
    String chatRoomID =ids.join('_');

    //add new message to database
    await _firestore.
    collection('chat_rooms').
    doc(chatRoomID).
    collection('messages').
    add(newMessage.toMap());
    

  }

  //recieve messages

  Stream<QuerySnapshot> getMessages(String userID, otherUserID){
//construct a chatroom ID for the two users
List<String> ids = [userID,otherUserID];
ids.sort();
String chatRoomID =ids.join('_');
return _firestore.
collection('chat_rooms')
.doc(chatRoomID)
.collection('messages')
.orderBy('timestamp',descending: false)
.snapshots();
  }

}