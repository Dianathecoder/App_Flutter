import 'package:flutter/material.dart';
import 'count.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _intentarLogin() {
    if (_formKey.currentState!.validate()) {
      if (_nameController.text == "user" &&
          _passwordController.text == "pass12345") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Count(username: _nameController.text),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Usuario o password incorrectos")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Color.fromARGB(255, 118, 143, 95);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Página Inicial"),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 120,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.flutter_dash,
                    size: 100,
                    color: mainColor,
                  ),
                ),
              ),

              const SizedBox(height: 40),
              const Text(
                "Nombre",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Introduce tu nombre",
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: mainColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                // Validación de usuario
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu nombre';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Introduce tu Contraseña",
                  prefixIcon: const Icon(Icons.lock_outline, color: mainColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce la contraseña';
                  }
                  if (value.length < 7) {
                    return 'Debe tener al menos 7 caracteres';
                  }
                  // Comprobar letras y números
                  bool tieneLetras = value.contains(RegExp(r'[a-zA-Z]'));
                  bool tieneNumeros = value.contains(RegExp(r'[0-9]'));

                  if (!tieneLetras || !tieneNumeros) {
                    return 'Debe contener letras y números';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                  ),
                ),
              ),

              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _intentarLogin,
                  child: const Text(
                    "INICIAR SESIÓN",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
