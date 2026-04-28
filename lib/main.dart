import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/splashscreen.dart';

//Usamos initialRoute para que la app sepa dónde arrancar y routes para no tener nombres de clases escritos por todos lados.
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Ciudades',
      debugShowCheckedModeBanner:
          false, // La aplicacion cominza con la pantalla splash
      // 1. Centralizamos rutas:
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        // La pantalla Count la llamaremos con push normal para pasar el username
      },
    );
  }
}
