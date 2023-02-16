// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unnecessary_new, camel_case_types

import 'package:flutter/material.dart';
import 'package:todolist/databaseHelper.dart';

class inputPage extends StatefulWidget {
  const inputPage({super.key});

  @override
  State<inputPage> createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context, 'refresh');
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              hoverColor: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "Enter Item:",
                style: TextStyle(
                    color: Color.fromARGB(255, 159, 154, 223), fontSize: 25),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(color: Color.fromARGB(255, 159, 154, 223), 
              borderRadius: BorderRadius.circular(6)),
              child: TextField(
                controller: _textController,
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Going to work',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {

                  await databaseHelper.instance.add(
                    todo(name: _textController.text),

                  );
                  _textController.clear();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 159, 154, 223)),
              child: Text("Add this Item To TodoList"),
            ),
          ],
        ),
      ),
    );
  }
}
