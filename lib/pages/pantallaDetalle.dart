import 'package:flutter/material.dart';

class Pantalladetalle extends StatelessWidget {
  final Map<String, String> ciudad;
  final VoidCallback
  onDelete; // Función recibida del padre para ejecutar el borrado

  const Pantalladetalle({
    super.key,
    required this.ciudad,
    required this.onDelete, // Lo ponemos en el constrcutor
  });

  //mostrar el dialogo de Borrar
  void _mostrarDialogoBorrar(BuildContext context) {
    // showDialog: Muestra una ventana emergente sobre la pantalla actual
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirmar borrado"),
        content: Text("¿Deseas eliminar ${ciudad['nombre']}?"),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pop(context), // Cierra solo la ventana del diálogo
            child: const Text("CANCELAR"),
          ),
          TextButton(
            onPressed: () {
              onDelete(); // Ejecuta el setState() que vive en la pantalla 'Count'
              Navigator.pop(context); // Cierra el diálogo
              Navigator.pop(context); // Cierra el detalle y vuelve a la lista
            },
            child: const Text("BORRAR", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ciudad['nombre']!),
        actions: [
          // Icono de la papelera
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () =>
                _mostrarDialogoBorrar(context), //// Abre el diálogo
          ),
        ],
      ),
      body: Column(
        children: [
          // Hero: Crea la animación de "vuelo" de la imagen entre pantallas
          Hero(
            tag:
                ciudad['nombre']!, // El tag debe ser IDÉNTICO al de la pantalla anterior
            child: Image.asset(
              ciudad['imagen']!,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              ciudad['desc']!,
              style: const TextStyle(fontSize: 16),
            ), // Muestra la descripción de la ciudad
          ),
        ],
      ),
    );
  }
}
