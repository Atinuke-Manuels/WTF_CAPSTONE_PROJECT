import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../global/common/toast.dart';
import '../../../../global/common/usermodel.dart';
import '../../../firebase_auth_implementation/firebase_auth_services.dart';


class SignUpAuthentication {
  final FirebaseAuthService _auth = FirebaseAuthService();

  Future<User?> signUp(
      String firstname, String username, String email, String password, String role) async {
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      _createData(UserModel(
        firstname: firstname,
        username: username,
        email: email,
        role: role,
      ));
      showToast(message: "User created successfully ");
    }
    return user;
  }

  // Stream<List<UserModel>> readData() {
  //   final userCollection = FirebaseFirestore.instance.collection("users");
  //   return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs
  //       .map((e) => UserModel.fromSnapShot(e))
  //       .toList());
  // }

  Future<UserModel?> readData(String email) async {
    final userCollection = FirebaseFirestore.instance.collection("users");
    QuerySnapshot querySnapshot = await userCollection.where('email', isEqualTo: email).get();
    if (querySnapshot.docs.isNotEmpty) {
      UserModel userModel = UserModel.fromSnapShot(querySnapshot.docs.first);
      return userModel;
    }
    return null;
  }

  void _createData(UserModel userModel) {
    final userCollection = FirebaseFirestore.instance.collection("users");
    String id = userCollection.doc().id;
    final newUser = UserModel(
      id: id,
      firstname: userModel.firstname,
      username: userModel.username,
      email: userModel.email,
      role: userModel.role,
    ).toJson();
    userCollection.doc(id).set(newUser);
  }
}
