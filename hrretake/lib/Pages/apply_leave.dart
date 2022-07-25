import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../custom widgets/custom_drawer.dart';
import '../models/leave.dart';

void main() {
  runApp(const ApplyLeave());
}

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({Key? key}) : super(key: key);

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  final controllerSubject = TextEditingController();
  final controllerNumAbsent= TextEditingController();
  final controllerDescription = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        resizeToAvoidBottomInset : false,
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Apply Leave'),
            ),
            drawer: const CustomDrawer(),
            body: ListView(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          maxLines: 1,
                          controller: controllerSubject,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.0),
                            ),
                            labelText: 'Subject',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          controller: controllerNumAbsent,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.0),
                            ),
                            labelText: 'Amount of days absent',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          maxLines: 6,
                          minLines: 1,
                          controller: controllerDescription,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.0),
                            ),
                            labelText: 'Description',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                final leave = Leave(
                                    subject: controllerSubject.text,
                                    nda: controllerNumAbsent.text,
                                    description: controllerDescription.text,
                                    email : user.email!,
                                    status: 'Ongoing'
                                );
                                createLeave(leave);

                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 90, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text('Submit Leave')),
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ),
          );

  Future createLeave(Leave leave) async {
    final docLeave = FirebaseFirestore.instance.collection("Leave").doc();
    leave.id = docLeave.id;

    final json = leave.toJson();
    await docLeave.set(json);
  }
}
