import 'package:flutter/material.dart';
import 'package:login_sharedpre/models/user_model.dart';
import 'package:login_sharedpre/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var key= GlobalKey<FormState>();
  var cotrollerEmail = TextEditingController();
  var cotrollerPass = TextEditingController();


 


  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
                title: Text("Login"),
              ),
        body: Form(
          key: key,
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              
              children: [
              
              Text("Login",style: TextStyle(fontSize: 30,color: Colors.purple),),
              SizedBox(height: 20,),
                 TextFormField(
                  controller: cotrollerEmail,
                  validator: (value){
                  if(value!.isEmpty || value ==null){
                    
                    return "Email can not be empty";
                  }
                  else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)){
                    return "Email not match email formate ";
                  }
                    
                  },
                  
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(   
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email, color: Colors.white),            
                  hintStyle: TextStyle(
                  color: Colors.purple,
                  ),
                
              focusedBorder:OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 49, 5, 87)),
                
                
              ), 
                  
              ), ),
              SizedBox(height: 10,),

                  TextFormField(
                    controller: cotrollerPass,
                    validator: (value){
                    if(value!.isEmpty || value ==null){
                      
                      return "password can not be empty";
                    }
                    else if (!RegExp(r"").hasMatch(value)){
                      return "password not match password formate ";
                    }
                      
                    },
            
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(   
                  hintText: "Password",
                  prefixIcon: Icon(Icons.email, color: Colors.white),            
                  hintStyle: TextStyle(
                  color: Colors.purple,
                  ),
                
              focusedBorder:OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 49, 5, 87)),
                
              ), 
                  
              ), ),
              SizedBox(height: 10,),

               Container(
          
                  width: MediaQuery.sizeOf(context).width *.85 ,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 170, 53, 193))),
                    onPressed: (){
                      
                   // key.currentState!.validate();
                  }, child: Text("Login",
                  ))),


                   Container(
          
                  width: MediaQuery.sizeOf(context).width *.85 ,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 170, 53, 193))),
                    onPressed: (){
                    //key.currentState!.validate();
                    Navigator.push(context, MaterialPageRoute( 
                      builder:(context) => RegisterScreen()));

                  }, child: Text("Create an acount",
                  ))),
                  
              ],
            ),
          ),

          


          

        

        ),
     
    
      ),
    );
  }
}