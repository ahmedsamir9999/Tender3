import 'dart:core';


class UserModel {

  String? name ;
  String? email ;
  String? phoneNum ;
  String? gender ;
  String? password ;

  UserModel({
    required this.name ,
    required this.email ,
    required this.phoneNum ,
    required this.gender ,
    required this.password ,
});

  toJson() {
    Map<String , dynamic> user = {} ;

    user['name'] = name ;
    user['email'] = email ;
    user['phoneNum'] = phoneNum ;
    user['gender'] = gender ;
    user['password'] = password ;

    return user ;
  }

  UserModel.fromJson (Map json)
  {
    name = json['name'] ;
    email = json['email'] ;
    phoneNum = json['phoneNum'] ;
    gender = json['gender'] ;
    password = json['password'] ;
  }

}