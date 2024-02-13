// // emergency_form_screen.dart
// import 'package:autoaid/models/sendEmerModel.dart';
// import 'package:flutter/material.dart';
// import 'emergency_case.dart'; // Import the model class

// class EmergencyFormScreen extends StatefulWidget {
//   @override
//   _EmergencyFormScreenState createState() => _EmergencyFormScreenState();
// }

// class _EmergencyFormScreenState extends State<EmergencyFormScreen> {
//   final _formKey = GlobalKey<FormState>();
//   late String _name;
//   late String _phoneNumber;
//   late String _location;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Emergency Case Form'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _name = value!,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Phone Number'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your phone number';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _phoneNumber = value!,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Location'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your location';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _location = value!,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     _submitForm();
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _submitForm() {
//     // Create an instance of the EmergencyCase class
//     sendEmergentDTO emergencyCase = sendEmergentDTO(
//       location: Location(lat: 10.8698289, lng: 106.7780165),
//       remark: "Emergency!",
//       createTimestamp: DateTime.now(),
//       vehicle: Vehicle(verhicleNo: "ABC123", type: "CAR", brand: "Toyota"),
//       // name: _name,
//       // phoneNumber: _phoneNumber,
//       // location: _location,
//     );

//     // Send the emergencyCase object to the backend server
//     // You can use a network library like Dio or Flutter's built-in http package for this.
//     // Example: sendToBackend(emergencyCase);

//     // For simplicity, let's print the information for now
//     print('Emergency Case Submitted: $emergencyCase');
//   }
// }
