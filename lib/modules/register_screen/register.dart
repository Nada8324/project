import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/data_provider/remote/firebasehelper.dart';
import 'package:project/modules/Home_screen/home_screen.dart';



class SignUp extends StatefulWidget {
  

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   final formkey=GlobalKey<FormState>();
   TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe=false;
  bool inVisible=true;
  bool? checked = true;
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
            
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        
                        child: IconButton(
                        
                                     icon: Icon(Icons.arrow_back,),
                                       onPressed: () {
                                  Navigator.pop(context);
                                },
                                
                              ),
                              
                      ),
                      SizedBox(height: height/20,),
                      Text('Sign Up',style: TextStyle(
                        fontSize: height/25,fontWeight: FontWeight.bold,color: Colors.black
                        )
                        ,),
                 
                   
                   
                     
                SizedBox(height: height/9,),
                      SizedBox(
                        width: width*0.93,
                        child: TextFormField(
                         controller: nameController,
                                    decoration: InputDecoration(
                                      
                                    labelText: ( 'UserName'),focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: HexColor('#4A4E69')))
                                    ),
                                     validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter your name";
                            }
                          },
                        ),
                      ),
                      SizedBox(height: height/30,),
                      SizedBox(
                        width: width*0.93,
                        child: TextFormField(
              
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
                                     
                                      labelText: 'Password',  
                                         focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:HexColor('#4A4E69')),
	   ),  
                                      suffixIcon: IconButton(icon: Icon(inVisible?Icons.visibility_off:Icons.visibility,color: HexColor('#4A4E69') ,),onPressed: (){
                                       setState(() {
                                         inVisible=!inVisible;
                                       });
                                      },)
                                    ),
                                    obscureText: inVisible,
                                     validator: (value) {
                            if (value!.isEmpty) {
                              return "enter valid password";
                            }
                          },
                        ),
                      
                      ),
                      SizedBox(height: height/30,),
                      Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        
                       
                        Text(
                          "Remember Me",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: width/1.89,),
                        Switch(activeColor: HexColor('#4A4E69'),   value: rememberMe, onChanged: (value){
                       setState(() {
                            rememberMe=value;
                       }
                       );
                        }
                        ),
                      ],
                    ),
                  ),
                   
                   SizedBox(height: height/10,),
                 Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: signUpAction,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: HexColor('#4A4E69'),

          ),
          width: 120,
          height: 50,

          child: Center(
            child: Text('Sign up'
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
    )
    ;
  }
  
 void signUpAction() {
if(formkey.currentState!.validate()){
  showDialog(context: context, builder: (context){
return const Center(child: CircularProgressIndicator(),);
});
FireBaseHelper().signUp(emailController.text.toString(), passwordController.text.toString(), nameController.text.toString()).then((value){
  if(value is User){
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
  