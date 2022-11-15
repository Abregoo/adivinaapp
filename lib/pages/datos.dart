import 'package:flutter/cupertino.dart';

enum Nivel { Dificil, Medio, Facil }

List<String> imgArray() {
  return [
    'assets/animalspics/dino.png',
    'assets/animalspics/dino.png',
    'assets/animalspics/wolf.png',
    'assets/animalspics/wolf.png',
    'assets/animalspics/peacock.png',
    'assets/animalspics/peacock.png',
    'assets/animalspics/whale.png',
    'assets/animalspics/whale.png',
    'assets/animalspics/octo.png',
    'assets/animalspics/octo.png',
    'assets/animalspics/fish.png',
    'assets/animalspics/fish.png',
    'assets/animalspics/frog.png',
    'assets/animalspics/frog.png',
    'assets/animalspics/seahorse.png',
    'assets/animalspics/seahorse.png',
    'assets/animalspics/girraf.png',
    'assets/animalspics/girraf.png',
  ];
}

List getImgArray(
  Nivel nivel,
) {
  List<String> nivelTipoLst = [];
  List sourceArray = imgArray();
  if (nivel == Nivel.Dificil) {
    sourceArray.forEach((element) {
      nivelTipoLst.add(element);
    });
  } else if (nivel == Nivel.Medio) {
    for (int i = 0; i < 12; i++) {
      nivelTipoLst.add(sourceArray[i]);
    }
  } else if (nivel == Nivel.Facil) {
    for (int i = 0; i < 6; i++) {
      nivelTipoLst.add(sourceArray[i]);
    }
  }

  nivelTipoLst.shuffle();
  return nivelTipoLst;
}



List<bool> getLstStadoInicial(Nivel nivel) {
  List<bool> lstStadoInicial = [];	
  if (nivel == Nivel.Dificil) {
    for (int i = 0; i < 18; i++) {
      lstStadoInicial.add(true);
    }
  } else if (nivel == Nivel.Medio) {
    for (int i = 0; i < 12; i++) {
      lstStadoInicial.add(true);
    }
  } else if (nivel == Nivel.Facil) {
    for (int i = 0; i < 6; i++) {
      lstStadoInicial.add(true);
    }
  }
  return lstStadoInicial;
}

// List<GlobalKey<FlipCardState>> getCardStateKeys(Nivel nivel) {
//   List<GlobalKey<FlipCardState>> cardStateKeys = new List<GlobalKey<FlipCardState>>();	
  
//   if (nivel == Nivel.Dificil) {
//     for (int i = 0; i < 18; i++) {
//       cardStateKeys.add(GlobalKey<FlipCardState>());
//     }
//   } else if (nivel == Nivel.Medio) {
//     for (int i = 0; i < 12; i++) {
//       cardStateKeys.add(GlobalKey<FlipCardState>());
//     }
//   } else if (nivel == Nivel.Facil) {
//     for (int i = 0; i < 6; i++) {
//       cardStateKeys.add(GlobalKey<FlipCardState>());
//     }
//   }
//   return cardStateKeys;
// }