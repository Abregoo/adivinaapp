import 'package:flutter/material.dart';

class Boxcontainer extends StatefulWidget {
  Boxcontainer({Key? key,
  required this.color,
  required this.height,
  required this.borderRadius,
  required this.nombre,
  this.borderR =false,
  this.spreadRadius = 0,
  this.x = 0,
  this.y = 0,
  this.children = const <Widget>[],	
  }) 
  : super(key: key);
  
  double height = 0;
  double borderRadius = 0;
  double spreadRadius =0;
  double x = 0, y=0;
  Color color = Colors.white;
  bool borderR = false;
  String nombre;
  List<Widget>? children = <Widget>[];

  @override
  State<Boxcontainer> createState() => _BoxcontainerState();
}

class _BoxcontainerState extends State<Boxcontainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: widget.borderR ? BorderRadius.circular(widget.borderRadius) : null,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black45,
            spreadRadius: widget.spreadRadius,
            offset:   Offset(widget.x,widget.y)
          )
        ]
      ),

      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text(
                            widget.nombre,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black26,
                                    blurRadius: 2,
                                    offset: Offset(1, 2),
                                  ),
                                  Shadow(
                                      color: Colors.green,
                                      blurRadius: 2,
                                      offset: Offset(0.5, 2))
                                ]),
                          )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                             children: widget.children!,
                          )
                        ],
                      ),
    );
  }
}