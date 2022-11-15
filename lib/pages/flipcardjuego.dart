import 'dart:async';
import 'package:adivinaapp/pages/datos.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class flipcardgame extends StatefulWidget {
  final Nivel nivel;
  flipcardgame(this.nivel);

  @override
  _flipcardgameState createState() => _flipcardgameState(nivel);
}

class _flipcardgameState extends State<flipcardgame> {
  _flipcardgameState(this.nivel);

  int indexAnterior = -1;
  bool flip = false;
  bool iniciar = false;

  bool esperar = false;
  Nivel nivel;
  Timer timer = Timer.periodic(Duration(seconds: 2), ((timer) {}));
  int tiempo = 5;
  int izquierda = 0;
  bool isFinal = false;
  List<String> data = <String>[];

  List<bool> cardFlips = <bool>[];
  List<GlobalKey<FlipCardState>> _cardStateKeys = <GlobalKey<FlipCardState>>[];

  Widget getItem(int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 3,
              spreadRadius: 0.8,
              offset: Offset(2.0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.all(4.0),
      child: Image.asset(data[index]),
    );
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        tiempo = tiempo - 1;
      });
    });
  }

  void restart() {
    startTimer();
    data = getImgArray(
      nivel,
    );
    cardFlips = getLstStadoInicial(nivel);
    _cardStateKeys = getCardStateKeys(nivel);
    tiempo = 5;
    izquierda = (data.length ~/ 2);

    isFinal = false;
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        iniciar = true;
        timer.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();

    restart();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isFinal
        ? Scaffold(
            body: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    restart();
                  });
                },
                child: Container(
                  height: 50,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    "Replay",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          )
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: tiempo > 0
                          ? Text(
                              '$tiempo',
                              style: Theme.of(context).textTheme.headline3,
                            )
                          : Text(
                              'Left:$izquierda',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) => iniciar
                            ? FlipCard(
                                key: _cardStateKeys[index],
                                onFlip: () {
                                  if (!flip) {
                                    flip = true;
                                    indexAnterior = index;
                                  } else {
                                    flip = false;
                                    if (indexAnterior != index) {
                                      if (data[indexAnterior] != data[index]) {
                                        esperar = true;

                                        Future.delayed(
                                            const Duration(milliseconds: 1500),
                                            () {
                                          _cardStateKeys[indexAnterior]
                                              .currentState
                                              ?.toggleCard();
                                          indexAnterior = index;
                                          _cardStateKeys[indexAnterior]
                                              .currentState
                                              ?.toggleCard();

                                          Future.delayed(
                                              const Duration(milliseconds: 160),
                                              () {
                                            setState(() {
                                              esperar = false;
                                            });
                                          });
                                        });
                                      } else {
                                        cardFlips[indexAnterior] = false;
                                        cardFlips[index] = false;
                                        print(cardFlips);

                                        setState(() {
                                          izquierda -= 1;
                                        });
                                        if (cardFlips
                                            .every((t) => t == false)) {
                                          print("Won");
                                          Future.delayed(
                                              const Duration(milliseconds: 160),
                                              () {
                                            setState(() {
                                              isFinal = true;
                                              iniciar = false;
                                            });
                                          });
                                        }
                                      }
                                    }
                                  }
                                  setState(() {});
                                },
                                flipOnTouch: esperar ? false : cardFlips[index],
                                direction: FlipDirection.HORIZONTAL,
                                front: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black45,
                                          blurRadius: 3,
                                          spreadRadius: 0.8,
                                          offset: Offset(2.0, 1),
                                        )
                                      ]),
                                  margin: EdgeInsets.all(4.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/animalspics/quest.png",
                                    ),
                                  ),
                                ),
                                back: getItem(index))
                            : getItem(index),
                        itemCount: data.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
