// import 'package:flutter/material.dart';
// import 'package:stacked_services/stacked_services.dart';

// class UpdateProfileSheet extends StatefulWidget {
//   final SheetRequest request;
//   final Function(SheetResponse) completer;

//   const UpdateProfileSheet({
//     Key? key,
//     required this.request,
//     required this.completer,
//   }) : super(key: key);

//   @override
//   _UpdateProfileSheetState createState() => _UpdateProfileSheetState();
// }

// class _UpdateProfileSheetState extends State<UpdateProfileSheet> {
//   late TextEditingController _nameController;
//   late TextEditingController _emailController;
//   late TextEditingController _passwordController;

//   @override
//   void initState() {
//     super.initState();
//     final userData = widget.request.data as Map<String, dynamic>?;
//     _nameController = TextEditingController(text: userData?['name'] ?? '');
//     _emailController = TextEditingController(text: userData?['email'] ?? '');
//     _passwordController = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//         top: 20,
//         left: 20,
//         right: 20,
//         bottom: MediaQuery.of(context).viewInsets.bottom + 20,
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               widget.request.title!,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'New Password (optional)'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton(
//                   onPressed: () =>
//                       widget.completer(SheetResponse(confirmed: false)),
//                   child: Text(widget.request.secondaryButtonTitle!),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     widget.completer(SheetResponse(
//                       confirmed: true,
//                       data: {
//                         'name': _nameController.text,
//                         'email': _emailController.text,
//                         'password': _passwordController.text,
//                       },
//                     ));
//                   },
//                   child: Text(widget.request.mainButtonTitle!),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
// }
