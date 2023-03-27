import 'package:auth/Screens/start.dart';
import 'package:auth/feature/services.dart';
import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  final AuthServices _auth =AuthServices();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.white,
      title: Text('Home',style: TextStyle(color: Colors.black),),
      actions: [
        IconButton(onPressed: ()async{
          await _auth.SignOut();
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>start()));
        }, icon: Icon(Icons.logout,size: 20,color: Colors.deepPurpleAccent,))
      ],
    ),
      body: Center(child: Text('Welcome Back !',style: TextStyle(color: Colors.white,fontSize: 40),),),
    );
  }
}
