import 'package:auth/Screens/Home Page.dart';
import 'package:auth/feature/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auth/feature/loading.dart';
import 'package:google_sign_in/google_sign_in.dart';

class sign_in extends StatefulWidget {
  const sign_in({Key? key}) : super(key: key);

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  final AuthServices _auth = AuthServices();
  final GoogleSignIn _googleSignIn=GoogleSignIn();
  final _formKey = GlobalKey<FormState>();
  bool loading=false;
  String email="";
  String password="";
  String error="";
  String userName="";
  @override
  Widget build(BuildContext context) {
    return loading? Loading() :Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/we.png'),
            ),
            SizedBox(height: 20,),
            Text('Welcome back!',style: TextStyle(color: Colors.black,fontSize: 45,fontWeight: FontWeight.bold,),textAlign:TextAlign.center,),
            SizedBox(height: 10,),
            Text('Sign up takes only 2 minutes',style: TextStyle(color: Colors.grey,fontSize: 20),textAlign:TextAlign.center,),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.all(15.0),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: GestureDetector(
                  onTap: (){
                    _googleSignIn.signIn().then((value) => {
                    userName= value!.displayName!,
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Welcome! ${userName}'))),
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home()))
                    });
                    },
                   child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(child: Image.asset('assets/google.jpg',width: 30,height: 30,)),
                          SizedBox(width: 8.0,),
                          Text('Sign in with Google',style:TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))
                        ],
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(height: 2,width:150,color: Colors.grey,),
                SizedBox(width: 5.0,),
                Text('Or',style: TextStyle(fontSize: 20,color: Colors.grey),),
                SizedBox(width: 5.0,),
                Container(height: 2,width:150,color: Colors.grey,),
              ],
            ),
            SizedBox(height: 10,),
            Form(
                key:_formKey,
                child:Column(
                  children: [
                    SizedBox(height: 20.0,),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: "email",
                          filled:true,
                          prefixIcon: Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400,width: 2.0),
                          ),
                        ),
                        validator: (val)=> val!.isEmpty ? 'Enter the email': null,//form field is valid or not
                        onChanged:(val){//everytime the value changes
                          setState(() {
                            email=val;//entered value stored in email
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: "password",
                          filled:true,
                          suffixIcon: Icon(FontAwesomeIcons.eye),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400,width: 2.0),
                          ),
                        ),

                        validator: (val)=> val!.length < 6 ? 'Enter a password 6+ chars long': null,
                        obscureText: true,
                        onChanged:(val){
                          setState(() {
                            password=val;//entered value stored in password
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: ()async {
                        if(_formKey.currentState!.validate()){
                          setState(() {
                            loading =true;
                          });
                          dynamic result= await _auth.registerwithemailpass(email, password);
                          if(result == null){
                            setState(() {
                              loading=false;
                              error ='please supply a valid email';
                            });
                          }
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
                            child: Text('Sign in',style:TextStyle(color: Colors.white,fontSize: 20),)
                        ),
                      ),
                    ),
                    RichText(text: TextSpan(text:"Don't have an account? ",style: TextStyle(fontSize: 15,color: Colors.black),
                      children:[
                        TextSpan(text: 'Sign up here',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 15))
                      ]
                    ))
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}

