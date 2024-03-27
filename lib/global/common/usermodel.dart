
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? firstname;
  final String? username;
  final String? email;

  UserModel({this.id, this.firstname, this.username, this.email});

  static UserModel fromSnapShot(DocumentSnapshot<Map<String, dynamic >> snapshot){
    return UserModel(
      firstname: snapshot['firstname'],
      username: snapshot['username'],
      email: snapshot['email'],
      id: snapshot['id'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "firstname": firstname,
      "username": username,
      "email": email,
      "id" : id,
    };
  }
}
