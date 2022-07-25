import 'package:flutter/material.dart';
import 'package:hrretake/models/attend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';


class MarkAttendPage extends StatefulWidget {
  const MarkAttendPage({Key? key}) : super(key: key);

  @override
  State<MarkAttendPage> createState() => _MarkAttendPageState();
}

class _MarkAttendPageState extends State<MarkAttendPage> {
  final user = FirebaseAuth.instance.currentUser!;
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);


  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: const Text('Mark Attendance'),
      ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        final attend = Attend(
                            email: user.email!,
                            date: formatted,
                            attendance: 'Present');
                        createAttend(attend);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 90, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Mark Attendance')),
                ),
              ),
            ],
          ),
        ),
      );

  Future createAttend(Attend attend) async {
    final docAttend = FirebaseFirestore.instance.collection("Attend").doc();
    attend.id = docAttend.id;

    final json = attend.toJson();
    await docAttend.set(json);
  }
}
