import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/reimburse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const Reimbursement());
}

class Reimbursement extends StatefulWidget {
  const Reimbursement({Key? key}) : super(key: key);

  @override
  State<Reimbursement> createState() => _ReimbursementState();
}

class _ReimbursementState extends State<Reimbursement> {
  final controllerSubject = TextEditingController();
  final controllerAmt= TextEditingController();
  final controllerDescription = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset : false,
    appBar: AppBar(
      centerTitle: true,
      title: const Text('Reimbursement'),
    ),
    body: Center(
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
              controller: controllerAmt,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                labelText: 'Amount for Reimbursements',
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
                    final reimburse = Reimburse(
                        subject: controllerSubject.text,
                        afr: controllerAmt.text,
                        description: controllerDescription.text,
                        email : user.email!
                    );
                    createReimburse(reimburse);

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Submit Reimbursement')),
            ),
          ),
        ],
      ),
    ),
  );

  Future createReimburse(Reimburse reimburse) async {
    final docReimburse = FirebaseFirestore.instance.collection("Reimburse").doc();
    reimburse.id = docReimburse.id;

    final json = reimburse.toJson();
    await docReimburse.set(json);
  }

}
