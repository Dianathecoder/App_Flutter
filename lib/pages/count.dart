import 'package:flutter/material.dart';
import 'pantallaDetalle.dart';

class Count extends StatelessWidget {
  final String username;
  final List<Map<String, String>> ciudades = [
    {
      "nombre": "Delhi",
      "pais": "India",
      "poblacion": "32.9M",
      "imagen": "assets/images/delhi.jpg",
      "desc":
          "Delhi, el territorio de la Capital de la India, es una enorme área metropolitana situada en el norte del país.",
    },
    {
      "nombre": "Barcelona",
      "pais": "España",
      "poblacion": "1.6M",
      "imagen": "assets/images/bcn.jpeg",
      "desc":
          "Barcelona, la capital de Cataluña, es una ciudad mediterránea y cosmopolita que combina restos romanos.",
    },
    {
      "nombre": "París",
      "pais": "Francia",
      "poblacion": "2.1M",
      "imagen": "assets/images/paris.jpeg",
      "desc":
          "París, la capital de Francia, es una importante ciudad europea y un centro mundial del arte.",
    },
  ];

  Count({super.key, required this.username});
  @override
  Widget build(BuildContext context) {
    const Color colorLogo = Color.fromARGB(255, 118, 143, 95);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Fondo blanco
      appBar: AppBar(
        title: Text(
          "¡Hola $username!",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: colorLogo,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: ciudades.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          final ciudad = ciudades[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: colorLogo, // La tarjeta ahora tiene el color del logo
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Hero(
                tag: ciudad['nombre']!,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white24,
                  backgroundImage: AssetImage(ciudad['imagen']!),
                ),
              ),
              title: Text(
                ciudad['nombre']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Opacity(
                opacity: 0.8,
                child: Text(
                  "${ciudad['pais']}  •  Pob: ${ciudad['poblacion']}",
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white, // Flecha blanca
                size: 20,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pantalladetalle(ciudad: ciudad),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
