import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyALCdypFui6PmjFCgzmfRPDoxuXK_aMEkk", appId: "1:425711718722:android:c471e42461e5629f0cf8db", messagingSenderId: "425711718722", projectId: "firstfirebaseproject-ed712"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Firebase Connection Test')),
        body: Center(
          child: ElevatedButton(
            onPressed: testFirebaseConnection,
            child: Text('Test Firebase Connection'),
          ),
        ),
      ),
    );
  }

  void testFirebaseConnection() async {
    try {
      // Write data to Firestore
      await FirebaseFirestore.instance.collection('testCollection').doc('testDocument').set({
        'testField': 'Hello, Firebase!'
      });
      print('Data written to Firestore successfully.');

      // Read data from Firestore
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('testCollection').doc('testDocument').get();
      if (doc.exists) {
        print('Data read from Firestore: ${doc.data()}');
      } else {
        print('No such document!');
      }
    } catch (e) {
      print('Error connecting to Firebase: $e');
    }
  }
}
