import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:100),
                child: Container(
                    child: const Text('Something is here'),
                    color: Colors.amberAccent,
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
