import 'package:auth/Screens/Home%20Page.dart';
import 'package:auth/Screens/sign_in.dart';
import 'package:auth/feature/services.dart';
import 'package:flutter/material.dart';

class start extends StatelessWidget {
  const start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthServices _auth = AuthServices();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/lg.png'),
            ),
            SizedBox(height: 20,),
            Text('Growing your',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold,),textAlign:TextAlign.center,),
            SizedBox(height: 10,),
            RichText(textAlign:TextAlign.center,text: TextSpan(
              text: 'buissness is ',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: 'easier',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 40,fontWeight: FontWeight.bold)
                )
              ]
            )),
            SizedBox(height: 10,),
            Text('then you think!',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold,),textAlign:TextAlign.center,),
            SizedBox(height: 20,),
            Text('Sign up takes only 2 minutes',style: TextStyle(color: Colors.grey,fontSize: 20),textAlign:TextAlign.center,),
            SizedBox(height: 20,),
            GestureDetector(
            onTap: ()async{
            dynamic result = await _auth.signInanon();
            if(result == null){
            print('error signing in');}
              else{
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home()));

                }
              },
              child: Container(
                margin: EdgeInsets.all(15.0),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                 child: Text('Get Started',style:TextStyle(color: Colors.white,fontSize: 20),)
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>sign_in()));
              },
              child: Container(
                margin: EdgeInsets.all(15.0),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                    child: Text('Sign In',style:TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
