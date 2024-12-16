import 'package:flutter/material.dart';

class Inicioscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bienvenido',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 8, 31),
          ),
        ),
        backgroundColor: Colors.deepPurple[600],
        centerTitle: true,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgaVadQ0NxBCSJMJ3xO1-GbQMfweSMwOOEmgXkP2evX4VPpL0bnseS8IJRbknNd5CsZ_VEs9ri4GwmJIMnfawZu8Njk1NhF2Xfh3y43HiUJRlFqTmRlkoE9VormHtr_slxIyiPNQXqUIs_F/s1600/Julio+Maria+Matovelle-2a.jpg',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Unidad Educativa Matovelle',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.purple[800],
                letterSpacing: 1.5,
                fontFamily: 'Roboto',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
    
            Text(
              '¡Bienvenido a nuestra plataforma! Inicia sesión para continuar.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              child: Text(
                'Ir a registro de sesión',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 9, 43, 236),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}
