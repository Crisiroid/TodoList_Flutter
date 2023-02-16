// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class aboutMe extends StatelessWidget {
  const aboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                "TODO List",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Developed By:",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 75,
              ),
              Text(
                "Amir Sajjad Hosein Pour",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Crisiroid",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 25,),
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
            ]),
          ),
        ),
      ),
    );
  }
}