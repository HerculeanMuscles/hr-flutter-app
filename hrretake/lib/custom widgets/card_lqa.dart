import 'package:flutter/material.dart';

class CardLqa extends StatefulWidget {
  final String email;
  final String status;
  final String subject;
  final String nda;
  final String description;

  const CardLqa({Key? key, required this.email, required this.status, required this.subject, required this.nda, required this.description}) : super(key: key);

  @override
  State<CardLqa> createState() => _CardLqaState();
}

class _CardLqaState extends State<CardLqa> {

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 12),
        color: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Expanded(
                  child: Text(
                    'Email : ' + widget.email /*"email"*/,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(
                    'Status : ' + widget.status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  )),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Expanded(
                  child: Text(
                    'Subject : ' + widget.subject /*"Date"*/,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(
                    'Num. of days absent : ' + widget.nda,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  )),
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(
                    'Description : ' + widget.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              ),
            ],
          ),
        ));
  }
}
