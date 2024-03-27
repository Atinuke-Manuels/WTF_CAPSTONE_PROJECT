import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../global/common/toast.dart';
import '../../../firebase_auth_implementation/firebase_auth_services.dart';

class SignUpAuthentication {
  final FirebaseAuthService _auth = FirebaseAuthService();

  Future<User?> signUp(
      String firstname, String username, String email, String password) async {
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      _createData(UserModel(
        firstname: firstname,
        username: username,
        email: email,
      ));
      showToast(message: "User created successfully ");
    }
    return user;
  }

  Stream<List<UserModel>> readData() {
    final userCollection = FirebaseFirestore.instance.collection("users");
    return userCollection.snapshots().map((qureySnapshot) => qureySnapshot.docs
        .map((e) => UserModel.fromSnapShot(e))
        .toList());
  }

  void _createData(UserModel userModel) {
    final userCollection = FirebaseFirestore.instance.collection("users");
    String id = userCollection.doc().id;
    final newUser = UserModel(
      id: id,
      firstname: userModel.firstname,
      username: userModel.username,
      email: userModel.email,
    ).toJson();
    userCollection.doc(id).set(newUser);
  }
}

class UserModel {
  final String? id;
  final String? firstname;
  final String? username;
  final String? email;

  UserModel({this.id, this.firstname, this.username, this.email});

  static UserModel fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return UserModel(
      firstname: snapshot['firstname'],
      username: snapshot['username'],
      email: snapshot['email'],
      id: snapshot['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstname": firstname,
      "username": username,
      "email": email,
      "id": id,
    };
  }
}
