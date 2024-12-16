import 'package:autonoma01/screens/notasScreen.dart';
import 'package:flutter/material.dart';
import 'package:autonoma01/screens/registroScreen.dart';
import 'package:autonoma01/screens/registrarseScreen.dart';
import 'package:autonoma01/screens/inicioScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notas de Gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
     
      initialRoute: '/inicio', 
      routes: {
        '/inicio': (context) => Inicioscreen(), 
        '/login': (context) => Registroscreen(), 
        '/register': (context) => RegistrarseScreen(), 
        '/notas': (context) => NotasScreen(), 
      },
    );
  }
}
