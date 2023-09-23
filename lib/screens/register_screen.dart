import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_sharedpre/models/user_model.dart';
import 'package:login_sharedpre/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
 
 SharedPreferences ? _prefs ;

 var key= GlobalKey<FormState>();
 var cotrollerEmail = TextEditingController();
 var cotrollerPass = TextEditingController();
 var cotrollerUserNa = TextEditingController();
 var cotrollerPhone = TextEditingController();
//  var cotrollerGender = TextEditingController();
 String? gender; 

late UserModel user;
File? image;
final ImagePicker picker = ImagePicker();
  

@override
  void initState() {
    _getData();
    // TODO: implement initState
    super.initState();
  }

  _getData()async{
    _prefs = await SharedPreferences.getInstance();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

     appBar: AppBar(

      title: Text("Register"),
     ),

      body: SingleChildScrollView(
        
        child: Form(
            key: key,
            child: Container(
              margin: EdgeInsets.all(30),
              child: Column(
                
                children: [
                  image== null?
                  InkWell(
                    child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75)),
                    child: Icon(Icons.camera) ,
      
                    ),

                    onTap: () async{
                      final XFile? file = await picker.pickImage(source: ImageSource.gallery);
                      image = File(file!.path);
                      setState(() {
                        
                      });
                    },
                    
                    ): CircleAvatar(
                      radius: 75,
                      backgroundImage: FileImage(image!),
                    ),
                
            Text("Create acount",style: TextStyle(fontSize: 30,color: Colors.purple),),
              SizedBox(height: 20,),
       
              
                TextFormField(
              controller: cotrollerUserNa,
              validator: (value){
              if(value!.isEmpty || value ==null){
                
                return "user name can not be empty";
              }
              else if (!RegExp(r"").hasMatch(value)){
                return "user name not match formate ";
              }
                
              },
              
                    style: TextStyle(color: Colors.black),
                    
                    decoration: InputDecoration( 
                   labelText: "User Name",  
                   labelStyle:  TextStyle(
                    color: Colors.purple,
                    ),
                    hintText: "User Name",
                    prefixIcon: Icon(Icons.email, color: Colors.white),            
                    hintStyle: TextStyle(
                    color: Colors.purple,
                    ),
                  
                focusedBorder:OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 49, 5, 87)),
                  
                  
                ), 
                    
                ), ),
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
                   labelText: "Email",  
                   labelStyle:  TextStyle(
                    color: Colors.purple,
                    ),
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email, color: Colors.white),            
                    hintStyle: TextStyle(
                    color: Colors.purple,
                    ),
                  
                focusedBorder:OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 49, 5, 87)),
                  
                  
                ), 
                    
                ), ),
      
      
      
       SizedBox(height: 20,),
                   TextFormField(
                    controller: cotrollerPhone,
              validator: (value){
              if(value!.isEmpty || value ==null){
                
                return "phone can not be empty";
              }
              else if (!RegExp(r"").hasMatch(value)){
                return "phone not match formate ";
              }
                
              },
              
                    style: TextStyle(color: Colors.black),
                    
                    decoration: InputDecoration( 
                   labelText: "phone",  
                   labelStyle:  TextStyle(
                    color: Colors.purple,
                    ),
                    hintText: "phone",
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

               
      
                Column(
        children: [
        
        RadioListTile(
          
            title: const Text("Male",style:  TextStyle(
                    color: Colors.purple,
                    ),),
            value: "male", 
            groupValue: gender, 
            onChanged: (value){
              setState(() {
                  gender = value.toString();
              });
            },
        ),
      
        RadioListTile(
            title: const Text("Female",style:  TextStyle(
                    color: Colors.purple,
                    ),),
            value: "female", 
            groupValue: gender, 
            onChanged: (value){
              setState(() {
                  gender = value.toString();
              });
            },
        ),
      
          
        ],
      ),
      
                 Container(
            
                    width: MediaQuery.sizeOf(context).width *.85 ,
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 170, 53, 193))),
                      onPressed: () async{
                      UserModel user = UserModel(
                        userName: cotrollerUserNa.text,
                        email: cotrollerEmail.text,
                        password: cotrollerPass.text,
                        phone: cotrollerPhone.text,
                        gender: gender,
                        image: image!.path,
                      );
      
      
                     // SharedPreferences prefs = await SharedPreferences.getInstance();
                      String data =jsonEncode(user.toMap());
                    //  key.currentState!.validate();
                    if(_prefs!.containsKey(cotrollerEmail.text)){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Email already exists"))
                      );
                    }else{
                      _prefs!.setString(cotrollerEmail.text, data).then((value) => Navigator.pop(context));
                    }
       
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