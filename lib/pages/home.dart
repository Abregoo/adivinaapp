import 'package:adivinaapp/pages/flipcardjuego.dart';
import 'package:adivinaapp/widgets/boxcontainer.dart';
import 'package:flutter/material.dart';

import 'datos.dart';

class HomePage extends StatefulWidget {
//  final Level _level;
//   FlipCardGane(this._level);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _lista.length,
          itemBuilder: (context, index) {
            
            return GestureDetector(
               onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => _lista[index].goto,
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Boxcontainer(
                      color: _lista[index].secomdarycolor,
                      height: 115,
                      borderRadius: 30,
                      borderR: true,
                      spreadRadius: 0.5,
                      x: 3,
                      y: 4,
                      nombre: "",
                    ),
                   
                    Container(
                      child: Boxcontainer(
                        color: _lista[index].primarycolor,
                        height: 100,
                        borderRadius: 30,
                        borderR: true,
                        spreadRadius: 4,
                        x: 5,
                        y: 3,
                        nombre: _lista[index].nombre,
                        children: getStar(_lista[index].noOfstar) ,
                      ),
                    ),

                    
                  ],
                ),
              ),
            );
          }),
    );
  }
  List<Widget> getStar(int no) {
    List<Widget> _icons = [];
    for (int i = 0; i < no; i++) {
      _icons.insert(
          i,
          Icon(
            Icons.star,
            color: Colors.yellow,
          ));
    }
    return _icons;
  }
}



class Detalle {
  String nombre;
  Color primarycolor;
  Color secomdarycolor;
  Widget goto;
  int noOfstar;

  Detalle(
      {
      required this.nombre,
      required this.primarycolor,
      required this.secomdarycolor,
      required this.noOfstar,
      required this.goto});
}

List<Detalle> _lista = [
  Detalle(
      nombre: "Fácil",
      primarycolor: Colors.green,
      secomdarycolor: Color.fromARGB(255, 129, 199, 132),
      noOfstar: 1,
      goto: flipcardgame(Nivel.Facil)),
  Detalle(
      nombre: "Medio",
      primarycolor: Colors.orange,
      secomdarycolor: Color.fromARGB(255, 255, 183, 77),
      noOfstar: 2,
      goto: flipcardgame(Nivel.Medio)),
  Detalle(
      nombre: "Difícil",
      primarycolor: Colors.red,
      secomdarycolor: Color.fromARGB(255, 229, 115, 115),
      noOfstar: 3,
      goto: flipcardgame(Nivel.Dificil)),
];
