import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Messages extends StatefulWidget {
  final String email;
  Messages({required this.email});

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late Stream<QuerySnapshot> _messageStream;

  @override
  void initState() {
    super.initState();
    _messageStream = FirebaseFirestore.instance
        .collection('Messages')
        .orderBy('time')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(right: 12), // Add padding to the right side
          child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            primary: true,
            itemBuilder: (_, index) {
              QueryDocumentSnapshot qs = snapshot.data!.docs[index];
              Timestamp t = qs['time'];
              DateTime d = t.toDate();
              String currentUserEmail =
                  FirebaseAuth.instance.currentUser?.email ?? '';
              bool isSent = qs['email'] == currentUserEmail;
              return Padding(
                padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: isSent
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: isSent ? 0 : 12), // Adjust margin for non-sent messages
                      decoration: BoxDecoration(
                        color: isSent ? Colors.white : Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(10),
                        border: isSent ? Border.all(color: Colors.purple) : null, // Add purple border
                      ),
                      padding: EdgeInsets.all(8), // Add padding within the container
                      child: SizedBox(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  isSent ? 'You' : qs['email'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: isSent ? Colors.black : Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "${d.hour}:${d.minute}",
                                  style: TextStyle(color: isSent ? Colors.black : Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 4), // Add space between email/time and message
                            Container(
                              width: double.infinity,
                              child: Text(
                                qs['message'],
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: isSent ? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
