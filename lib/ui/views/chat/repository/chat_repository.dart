// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatRepository {
//   var db = FirebaseFirestore.instance;
//   final DatabaseReference _database = FirebaseDatabase.instance.ref();

//   Future<void> sendMessage(
//       String senderId, String receiverId, String messageText) async {
//     var timeSend = DateTime.now().toUtc().toIso8601String();

//     final messageRef =
//         _database.child('users/$senderId/chats/$receiverId/messages').push();
//     final message = {
//       'text': messageText,
//       'senderId': senderId,
//       "timeSend": timeSend,
//     };

//     await messageRef.set(message);

//     // To send the message to the receiver's side as well (if needed)
//     _database
//         .child('users/$receiverId/chats/$senderId/messages')
//         .push()
//         .set(message);
//   }
// }
