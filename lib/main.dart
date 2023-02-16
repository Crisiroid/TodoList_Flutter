// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unnecessary_new, camel_case_types, prefer_const_constructors_in_immutables
import "package:flutter/material.dart";
import 'package:todolist/screens/input_screen.dart';
import 'databaseHelper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool value = false; 

  void changeData(){
    setState(() {
      value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 13, 6, 17)),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("ToDo list"), backgroundColor: Color.fromARGB(255, 29, 18, 59),),
          body: Column(
            children: [
              SizedBox(
                height: 10,
              ),

              Expanded(
                child: Center(
                  child: FutureBuilder<List<todo>>(
                    future: databaseHelper.instance.getTodoList(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<todo>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Text(
                            "Processing...",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                      return snapshot.data!.isEmpty
                          ? Center(child: Text("No daata"))
                          : ListView(
                              children: snapshot.data!.map((toodo) {
                                return Center(
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
                                  Icons.insert_emoticon,
                                  color: Colors.white,
                                ),
                                Text(
                                  toodo.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        databaseHelper.instance.remove(toodo.id!);
                                      });
                                    },
                                    icon: Icon(Icons.more_horiz))
                              ],
                            ),
                          ),
                          );
                              }).toList(),
                            );
                    },
                  ),
                ),
              ),
              Builder(builder: (context) {
                return ElevatedButton(
                    onPressed: () async {
                      String refresh = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => inputPage()));

                      if(refresh == 'refresh'){
                        changeData();
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 29, 18, 59)),
                    child: Text("Add Item"));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
