import 'package:flutter/material.dart';

class Registroscreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Registroscreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (email == "test@example.com" && password == "password123") {
      Navigator.pushReplacementNamed(context, '/inicio');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Credenciales incorrectas')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Iniciar sesión',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Colors.deepPurple[600],
        centerTitle: true,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Título de la pantalla
            Text(
              'Bienvenido de nuevo',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Campo de correo electrónico
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                labelStyle: TextStyle(color: Colors.deepPurple[600]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple[600]!),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),

            // Campo de contraseña
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                labelStyle: TextStyle(color: Colors.deepPurple[600]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple[600]!),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30),

            // Botón de inicio de sesión
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
               
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              child: Text(
                'Iniciar sesión',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 55, 103, 233),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Enlace para redirigir al registro
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              child: Text(
                '¿Aún no tienes cuenta? Regístrate aquí',
                style: TextStyle(color: Colors.deepPurple[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
