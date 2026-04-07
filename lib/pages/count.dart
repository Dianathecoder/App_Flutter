import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  final String username;
  const Count({super.key, required this.username});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int contador = 0;

  void _incrementar() {
    setState(() => contador++);
  }

  void _decrementar() {
    setState(() => contador--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página Secundaria"),
        backgroundColor: const Color.fromARGB(255, 118, 143, 95),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/mujer.png"),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(50, 0, 0, 0),
              ),
              alignment: Alignment.center,
              child: Text(
                "Bienvenid@, ${widget.username}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 25),
            Center(
              child: Text(
                "$contador",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _decrementar,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _incrementar,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
