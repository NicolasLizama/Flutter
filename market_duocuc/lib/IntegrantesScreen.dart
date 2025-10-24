import 'package:flutter/material.dart';

class IntegrantesScreen extends StatelessWidget {
  const IntegrantesScreen({super.key});

  final List<Map<String, String>> integrantes = const [
    {
      "nombre": "Carlos Neira",
      "imagen": "assets/images/carlos.png",
    },
    {
      "nombre": "Tutin Jara",
      "imagen": "assets/images/tutin.png",
    },
    {
      "nombre": "Lizamax",
      "imagen": "assets/images/corxea.png",
    },
    // agrega más integrantes aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Integrantes"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: integrantes.length,
          itemBuilder: (context, index) {
            final integrante = integrantes[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(integrante["imagen"]!),
                ),
                title: Text(
                  integrante["nombre"]!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
