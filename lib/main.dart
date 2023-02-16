// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _listItemCount = 5;
  var names = ["Amir", "Ali", "Hasan", "Hosein", "Sajad"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 32, 14, 41)),
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Center(
                child: ListView.builder(
                  itemCount: _listItemCount,
                  itemBuilder: (context, index) {
                    return Center(
                      child: GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 20,
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 46, 28, 63),
                            ),
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 66, 57, 97),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.person_pin_circle,
                                color: Colors.white,
                              ),
                              Text(
                                "Item Number: " + names[index],
                                style: TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.more_horiz))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                _listItemCount += 1; 
                names.add("Halk");
              });
            }, child: Text("Add Item")),
          ],
        ),
      ),
    );
  }
}
