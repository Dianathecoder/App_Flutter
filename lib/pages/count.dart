import 'package:flutter/material.dart';
import 'pantallaDetalle.dart';

//// StatefulWidget: Permite que la pantalla se redibuje cuando la lista cambie (borrado)
class Count extends StatefulWidget {
  final String username; //Variable que recibe el nombre desde el LoginPage
  const Count({super.key, required this.username});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  // 1. Lista de datos: Definida dentro del State para que sea mutable y reaccione al setState
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

  @override
  Widget build(BuildContext context) {
    const Color colorLogo = Color.fromARGB(255, 118, 143, 95);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        // widget.username: Forma de acceder a los datos del constructor desde el State
        title: Text(
          "¡Hola ${widget.username}!",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: colorLogo,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      // ListView.builder: Crea los elementos de la lista de forma eficiente bajo demanda
      body: ListView.builder(
        itemCount:
            ciudades.length, //// Indica cuántos elementos hay en la lista
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          final ciudad =
              ciudades[index]; // Extrae la ciudad actual por su índice
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: colorLogo,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                //Sombra suave para dar profundidad
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              // Hero origen: Define el widget que "volará" a la siguiente pantalla
              leading: Hero(
                tag: ciudad['nombre']!,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white24,
                  backgroundImage: AssetImage(
                    ciudad['imagen']!,
                  ), //// Foto circular
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
                color: Colors.white,
                size: 20,
              ),
              onTap: () {
                // Navigator.push: Añade la pantalla de detalle al stack de navegación
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pantalladetalle(
                      ciudad:
                          ciudad, // Paso de datos: Enviamos el objeto ciudad
                      // Enviar función: Pasamos la lógica de borrado como callback
                      onDelete: () {
                        // setState: Notifica al framework que la lista ha cambiado y debe redibujar
                        setState(() {
                          ciudades.removeAt(
                            index,
                          ); // Elimina el elemento por su posición
                        });
                      },
                    ),
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
