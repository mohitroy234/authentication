import 'package:auth/Screens/start.dart';
import 'package:flutter/material.dart';
import 'package:auth/Screens/Home Page.dart';
import 'package:auth/feature/models.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users=Provider.of<logUser?>(context);//user login ya logout ka value logout ->null

    if(users==null){
      return start();
    }
    else{
      return Home();
    }
  }
}
