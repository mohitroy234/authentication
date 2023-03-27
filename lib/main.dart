
import 'package:firebase_core/firebase_core.dart';
import 'package:auth/Screens/sign_in.dart';
import 'package:auth/Screens/start.dart';
import 'package:flutter/material.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(initialRoute:'start',routes: {
    'start':(context)=>start(),
    'sign_in':(context)=>sign_in(),
  },
  debugShowCheckedModeBanner: false,
  ));
}
