import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  @override
  final emailController=TextEditingController();
@override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
Future passwordreset()async{
try{
  await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
  showDialog(context: context, builder: (context){
    return AlertDialog(content: Text('password reset link sent!'),);
  });
}on FirebaseAuthException catch(e){
  print(e);
  showDialog(context: context, builder: (context){
    return AlertDialog(content: Text(e.message.toString()),);
  });
}
}
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
      
        children: [
          SizedBox(height: 30,),
            Container(
                        alignment: Alignment.topLeft,
                        
                        child: IconButton(
                          
                                     icon: Icon(Icons.arrow_back),
                                       onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                      ),
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Enter your email and we will send you a password reset link',textAlign: TextAlign.center,),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                           controller: emailController,
                                      decoration: InputDecoration(
                                       prefixIcon: Icon(Icons.email,color:  HexColor('#4A4E69'),),
                                        labelText: 'Email',focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: HexColor('#4A4E69')))
                                      ),
                                       validator: (value) {
                              if (!value!.contains("@")) {
                                return "enter valid email";
                              }
                            },
                          ),
          ),
                        SizedBox(height: 50,),
                      MaterialButton(onPressed:passwordreset,
                      child: Text('reset password',style: TextStyle(color: Colors.white),),color: HexColor('#4A4E69'),)
        ],
      ),
    );
  }
}