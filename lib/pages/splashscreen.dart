import 'package:flutter/material.dart';

// StatefulWidget: Necesario porque la pantalla tiene un "ciclo de vida" (el temporizador)
//Usamos el StateWitget para acceder al initState()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

@override
class _SplashScreenState extends State<SplashScreen> {
  //initState(): Es un método que se ejecuta una sola vez justo cuando la pantalla se inicia. Es el lugar perfecto para poner cronómetros o cargar datos.
  void initState() {
    super.initState(); // Ejecuta la lógica inicial del framework

    //Future.delayed: El tiempo de espera
    Future.delayed(const Duration(seconds: 3), () {
      // pushReplacementNamed: Salta al login y BORRA el Splash del historial ya no se puede volver atras
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        //Centra el contenido de la pantalla
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //centralizarlo
          children: [
            Image(image: AssetImage("assets/images/logo.png"), height: 150),
            SizedBox(height: 20), //Espaciado
            Text(
              "Explora el mundo",
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 30),
            // CircularProgressIndicator: Animación de círculo girando, es el indicador de carga
            CircularProgressIndicator(color: Color.fromARGB(255, 118, 143, 95)),
          ],
        ),
      ),
    );
  }
}
