import 'package:adivinaapp/pages/home.dart';
import 'package:adivinaapp/pages/inicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const Inicio());

  FlutterNativeSplash.remove();
}
