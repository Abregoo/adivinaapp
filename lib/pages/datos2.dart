// import 'package:flutter/material.dart';
// import 'package:flutter_flip_card/flutter_flip_card.dart';

// List<String> fillsourceArray() {
//   return [""];
// }

// enum Level { Hard, Medium, Easy }

// List getSourceArray(Level level) {
//   List<String> levellist = <String>[];
//   List sourceArray = fillsourceArray();

//   if (level == Level.Hard) {
//     sourceArray.forEach((element) {
//       levellist.add(element);
//     });
//   } else if (level == Level.Medium) {
//     for (int i = 0; i < 12; i++) {
//       levellist.add(sourceArray[i]);
//     }
//   } else if (level == Level.Easy) {
//     for (int i = 0; i < 6; i++) {
//       levellist.add(sourceArray[i]);
//     }
//   }

//   levellist.shuffle();
//   return levellist;
// }

// List<bool> getInitialitemState(Level level) {
//   List<bool> initialitemstate = <bool>[];

//   if (level == Level.Hard) {
//     for (var i = 0; i < 18; i++) {
//       initialitemstate.add(true);
//     }
//   } else if (level == Level.Medium) {
//     for (int i = 0; i < 18; i++) {
//       initialitemstate.add(true);
//     }
//   } else if (level == Level.Easy) {
//     for (int i = 0; i < 18; i++) {
//       initialitemstate.add(true);
//     }
//   }
//   return initialitemstate;
// }

// List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
//   List<GlobalKey<FlipCardState>> cardStateKeys = <GlobalKey<FlipCardState>>[];
//   if (level == Level.Hard) {
//     for (int i = 0; i < 18; i++) {
//       cardStateKeys.add(GlobalKey<FlipCardState>());
//     }
//   } else if (level == Level.Medium) {
//     for (int i = 0; i < 12; i++) {
//       cardStateKeys.add(GlobalKey<FlipCardState>());
//     }
//   } else if (level == Level.Easy) {
//     for (int i = 0; i < 6; i++) {
//       cardStateKeys.add(GlobalKey<FlipCardState>());
//     }
//   }
//   return cardStateKeys;
// }
