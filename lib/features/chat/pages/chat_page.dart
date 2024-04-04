// Import necessary libraries
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../global/common/usermodel.dart';
import '../../registration/signup/widgets/signup_authentication.dart';
import 'message.dart';

class ChatPage extends StatefulWidget {
  ChatPage();
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  _ChatPageState();

  SignUpAuthentication _auth = SignUpAuthentication();
  String? email;
  final TextEditingController message = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String? email = user.email ?? '';
      UserModel? currentUser = await _auth.readData(email);
      if (currentUser != null) {
        setState(() {
          email = currentUser?.email;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instant Message"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15.h,),
            Container(
              height: MediaQuery.of(context).size.height * 0.85.h,
              child: Messages(
                email: email ?? '',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: message,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).primaryColorLight,
                        hintText: 'message',
                        hintStyle: TextStyle(color: Colors.white),
                        enabled: true,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {},
                      onSaved: (value) {
                        message.text = value!;
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (message.text.isNotEmpty) {
                      String? email =
                          FirebaseAuth.instance.currentUser?.email;
                      if (email != null) {
                        FirebaseFirestore.instance.collection('Messages').add({
                          'message': message.text.trim(),
                          'time': DateTime.now(),
                          'email': email,
                        });
                      }
                      message.clear();
                    }
                  },
                  icon: Icon(Icons.send_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

