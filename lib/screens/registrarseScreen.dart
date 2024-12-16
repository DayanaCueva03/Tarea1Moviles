import 'package:flutter/material.dart';

class RegistrarseScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegistrarseScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController(); 

  void _register() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim(); 

    if (email.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty) {
      if (password == confirmPassword) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Las contraseñas no coinciden')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registro',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
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
            // Título
            Text(
              'Crea tu cuenta',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

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
            SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirmar Contraseña',
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

            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              child: Text(
                'Registrar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 60, 122, 255),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text(
                '¿Ya tienes cuenta? Inicia sesión aquí',
                style: TextStyle(color: Colors.deepPurple[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
