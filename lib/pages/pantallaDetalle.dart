import 'package:flutter/material.dart';

class Pantalladetalle extends StatelessWidget {
  final Map<String, String> ciudad;

  const Pantalladetalle({super.key, required this.ciudad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ciudad['nombre']!)),
      body: Column(
        children: [
          Hero(
            tag: ciudad['nombre']!,
            child: Image.asset(
              ciudad['imagen']!,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(ciudad['desc']!, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
