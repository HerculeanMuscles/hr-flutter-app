import 'package:flutter/material.dart';

class CardHa extends StatefulWidget {
  final String name;
  final String date;
  final String attendance;

  const CardHa({Key? key, required this.name, required this.date, required this.attendance}) : super(key: key);

  @override
  State<CardHa> createState() => _CardHaState();
}

class _CardHaState extends State<CardHa> {
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
                    'Email : ' + widget.name /*"Title"*/,
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
                child: Expanded(
                  child: Text(
                    'Date : ' + widget.date /*"Date"*/,
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
                    'Attendance : ' + widget.attendance,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              ),
            ],
          ),
        ));
  }
}
