
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/data_provider/remote/firebasehelper.dart';
import 'package:project/modules/signup_screen/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home_screen/home_screen.dart';
import '../forgetpassword/forget_password.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formkey=GlobalKey<FormState>();
  bool isSwitched=false;
  bool inVisible=true;
  bool? checked = true;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
  double width=MediaQuery.of(context).size.width;
 double height=MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(child:
        SingleChildScrollView(
          child: Form(
            key:formkey,
            child: 
  
            Center(
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Container(
                        alignment: Alignment.topLeft,
                        
                        child: IconButton(
                          
                                     icon: Icon(Icons.arrow_back),
                                       onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                      ),
                      SizedBox(height: height/13,),
                      Text('Welcome',style: TextStyle(
                        fontSize: height/25,fontWeight: FontWeight.bold,color: HexColor('#4A4E69')
                        )
                        ,),
                    SizedBox(height: height/40),
                   
                     Text('Log in',style: TextStyle(
                        fontSize:width/20 ,color: Colors.black
                        )
                        ,),
                SizedBox(height: height/15,),
                      SizedBox(
                        width: width*0.93,
                        child:  TextFormField(
                         controller: emailController,
                                    decoration: InputDecoration(
                                    
                                      labelText: 'Email Address',focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: HexColor('#4A4E69')))
                                    ),
                                     validator: (value) {
                            if (!value!.contains("@")) {
                              return "enter valid email";
                            }
                          },
                        ),
                      
                      
                      ),
                 
                       SizedBox(height: height/30,),
                       SizedBox(
                        width: width*0.93,
                        child: TextFormField(
                         controller: passwordController,
                                    decoration: InputDecoration(
                                      labelText: 'Password',focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: HexColor('#4A4E69'))),
                                      suffixIcon: IconButton(icon: Icon(inVisible?Icons.visibility_off:Icons.visibility,color:HexColor('#4A4E69') ,),onPressed: (){
                                       setState(() {
                                         inVisible=!inVisible;
                                       });
                                      },
                                      
                                    )
                                    ),
                                    obscureText: inVisible,
                                    validator: (value) {
                            if (value!.isEmpty) {
                              return "enter valid password";
                            }
                          },
                        ),
                      
                      ),
                 SizedBox(height: height/20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                               return Forgetpassword();
                                }));
                              },
                              child: Text('Forget password?',style: TextStyle(fontWeight: FontWeight.w400,fontSize:15 ,color: HexColor('#525CB5CC')),)),
                          ],
                        ),
                      ),
                      SizedBox(height: height/20,),
                       Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        
                       
                        Text(
                          "Remember Me",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Switch(activeColor: HexColor('#4A4E69'),   value: isSwitched, onChanged: (value){
                       setState(() {
                            isSwitched=value;
                       }
                       );
                        }
                        ),
                      ],
                    ),
                  ),
                   
                   
                   SizedBox(height: height/8,),
                    Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: logInAction,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: HexColor('#4A4E69'),

          ),
          width: 120,
          height: 50,

          child: Center(
            child: Text('Log in'
              ,
              style:TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold) ,),
          ),
        ),
      ),
    )]
                ,
              ),
            ),
          ),
        ),
      ),
    );
  }
  

  void logInAction() {
    if(formkey.currentState!.validate())
    {
      showDialog(context: context, builder: (context) =>const Center(child: CircularProgressIndicator(),));
      FireBaseHelper().signIN(emailController.text.toString(), passwordController.text.toString()).then((value)
      {
        if(value is User)
        {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home_screen()));
        }
        else if (value is String)
            {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
            }
      });
    }
  }
}

