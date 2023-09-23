import 'package:flutter/material.dart';

class UserModel{

 String? userName;
 String? phone;
 String? email;
 String? password;
 String? image;
 String? gender;


 UserModel({this.userName,this.phone,this.email,this.gender,this.password,this.image});

 Map <String,dynamic>  toMap(){
  return{
  "name": userName,
  "phone": phone,
  "email" : email,
  "password" : password,
  "gender":gender,
   "image" : image
 };

}
}