import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? firstname;
  final String? username;
  final String? email;
  final String? role;

  UserModel({this.id, this.firstname, this.username, this.email, this.role});

  static UserModel fromSnapShot(QueryDocumentSnapshot<Object?> snapshot) {
    return UserModel(
      firstname: snapshot['firstname'],
      username: snapshot['username'],
      email: snapshot['email'],
      id: snapshot['id'],
      role: snapshot['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstname": firstname,
      "username": username,
      "email": email,
      "id": id,
      "role": role,
    };
  }
}