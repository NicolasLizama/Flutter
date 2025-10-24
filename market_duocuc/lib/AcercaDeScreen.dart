import 'package:flutter/material.dart';
import 'package:market_duocuc/LoginScreen.dart';

class AcercaDeScreen extends StatelessWidget {
  const AcercaDeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acerca de"),
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          // 🔹 Botón para volver atrás
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: _buildDrawer(context), // 🔸 Menú lateral integrado
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 56),
                  const Text(
                    "Market DuocUC",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/duoc.png', // Asegúrate que esta imagen exista
                height: 350,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Esta aplicación es un proyecto desarrollado para mostrar productos disponibles "
              "en Market DuocUC. Permite explorar productos y ver detalles.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 Menú lateral (Drawer)
Widget _buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrangeAccent, Colors.orangeAccent],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Usuario DUOC",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "duoc@duocuc.cl",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.shopping_bag,
            color: Colors.deepOrangeAccent,
          ),
          title: const Text("Productos"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/home');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.info_outline,
            color: Colors.deepOrangeAccent,
          ),
          title: const Text("Acerca de"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/acerca');
          },
        ),
        ListTile(
          leading: const Icon(Icons.group, color: Colors.deepOrangeAccent),
          title: const Text("Integrantes"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/integrantes');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: const Text("Cerrar Sesión"),
          onTap: () {
            Navigator.pop(context);
            _logout(context);
          },
        ),
      ],
    ),
  );
}

// 🔹 Función para cerrar sesión
void _logout(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Cerrar Sesión'),
        content: const Text('¿Estás seguro que deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Loginscreen()),
                (route) => false,
              );
            },
            child: const Text(
              'Cerrar Sesión',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
