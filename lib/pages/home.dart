import 'package:adivinaapp/widgets/boxcontainer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Boxcontainer(
                    color: Color.fromARGB(255, 33, 150, 243),
                    height: 115,
                    borderRadius: 30,
                    borderR: true,
                    spreadRadius: 0.5,
                    x: 3,
                    y: 4,
                  ),
                  Boxcontainer(
                    color: Color.fromARGB(255, 99, 175, 238),
                    height: 100,
                    borderRadius: 30,
                    borderR: true,
                    spreadRadius: 4,
                    x: 5,
                    y: 3,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
