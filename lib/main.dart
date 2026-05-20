import 'package:flutter/material.dart';
import 'components/button_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Button Component'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ButtonComponent(
              text: 'Continuar',
              icon: Icons.arrow_forward,
              onPressed: () {
                print('Botão clicado!');
              },
            ),
          ),
        ),
      ),
    );
