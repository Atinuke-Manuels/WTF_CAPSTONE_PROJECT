import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? firstname;
  final String? username;
  final String? phone;
  final String? address;
  final String? email;
  final String? role;

  UserModel({this.id, this.firstname, this.username, this.phone, this.address,this.email, this.role});

  static UserModel fromSnapShot(QueryDocumentSnapshot<Object?> snapshot) {
    return UserModel(
      firstname: snapshot['firstname'],
      username: snapshot['username'],
      phone: snapshot['phone'],
      address: snapshot['address'],
      email: snapshot['email'],
      id: snapshot['id'],
      role: snapshot['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstname": firstname,
      "username": username,
      "phone": phone,
      "address": address,
      "email": email,
      "id": id,
      "role": role,
    };
  }
}